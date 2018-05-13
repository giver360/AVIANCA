--Taller 2
--Punto A
ALTER TABLE "Aeronave" ADD Estado NVARCHAR2(20) NOT NULL;
ALTER TABLE "Aeronave" ADD CONSTRAINT CK_ESTADO_AVION CHECK (Estado IN ('Vuelo','Tierra','Mantenimiento','Reparación'));

--Punto B
ALTER TABLE "Aeronave" ADD Ultima_Ubicacion NVARCHAR2(255) NOT NULL;

--Punto C
ALTER TABLE "Itinerario" ADD Estado NVARCHAR2(20) NOT NULL;
ALTER TABLE "Itinerario" ADD CONSTRAINT CK_ESTADO_VUELOS CHECK (Estado IN ('envuelo','cancelado','retrasado','confirmado','abordando','programado'));

--Punto 1
Create or Replace View ListarAeronaves AS
Select 
  a."Id" Id_Aeronave, origen."ID_VUELO"
From 
      (Select distinct ao."Ciudad" ,i."Id" Itinerario, i."Hora_Estimada_Salida", v."Id" Id_Vuelo
      From "Vuelo" v Inner join "Itinerario" i on v."Id"=i."Id_Vuelo"
                      Inner join "Rutas" r on v."Id_Ruta"=r."Id"
                      Inner join "Aeropuerto" ao On r."Id_Aeropuerto_Origen"=ao."Id"
      Where /*v."Id"='1' and*/ i."Estado"='confirmado' and i."Id_Aeronave" is null --Validar si realmente el vuelo esta confirmado y sin avion asignado.  
      ) origen       
      Inner Join "Aeronave" a on origen."Ciudad"=a."Ultima_Ubicacion" --Relacion para conocer que aviones ya se encuentran en ese aeropuerto.
Where a."Estado"='Tierra'      -- Garantizar que el avion este en tierra y no en vuelo en proceso
union
Select 
  envuelo."Id" Id_Aeronave, origen."ID_VUELO"
From    
    (Select distinct ao."Ciudad" ,i."Id" Itinerario, i."Hora_Estimada_Salida", v."Id" Id_Vuelo
      From "Vuelo" v Inner join "Itinerario" i on v."Id"=i."Id_Vuelo"
                      Inner join "Rutas" r on v."Id_Ruta"=r."Id"
                      Inner join "Aeropuerto" ao On r."Id_Aeropuerto_Origen"=ao."Id"
      Where /*v."Id"='1' and*/ i."Estado"='confirmado' and i."Id_Aeronave" is null --Validar si realmente el vuelo esta confirmado y sin avion asignado. 
    ) origen   
    inner join
    (select a."Ciudad", ae."Id", i."Hora_Estimada_Llegada"
      From "Vuelo" v Inner Join "Itinerario" i On v."Id"=i."Id_Vuelo"
                    Inner join "Rutas" r On v."Id_Ruta"=r."Id"
                    Inner join "Aeropuerto" a On r."Id_Aeropuerto_Destino"=a."Id"              
                    Inner join "Aeronave" ae On i."Id_Aeronave"=ae."Id"
      Where  i."Estado"='confirmado'  --Validar si realmente el vuelo se confirmo, asi garantizar el aeropuerto destino.
            and ae."Estado"='Vuelo' --Validar que el avion este en transicion entre un aeropuerto y otro.
    ) envuelo 
      on origen."Ciudad"=envuelo."Ciudad" 
Where  to_number(SUBSTR((origen."Hora_Estimada_Salida"-envuelo."Hora_Estimada_Llegada"),'11','3'))<='2'; --Validar que en menos de 2 horas, estará un avion en ese aeropuerto.

--Punto 2
create or replace PROCEDURE PROGRAMACION_TRIPULACION(i_Itinerario IN NUMBER)
AS

var_aeronave_disponible number := 0;
var_can_auxi number := 0;
var_can_sillas number := 0;
var_ubi_act_tri nvarchar2(255) := '';
var_mensaje nvarchar2(255) := 'Se asigno aeronave y tripulacion correctametne al vuelo';

begin
--Punto a
--Asignar la aeronave a los vuelos confirmados, que se encuentran en el aeropuerto de salida, dos horas antes de la hora de salida

/*UPDATE (SELECT i."Id_Aeronave" as sinavio,v."ID_AERONAVE" as aviodispo
            FROM "LISTARAERONAVES" v 
            INNER JOIN "Itinerario" i ON v."ID_VUELO" = i."Id_Vuelo"
            where i."Id_Aeronave" is null and ROWNUM = 1) u
SET u.sinavio = u.aviodispo;*/

SELECT v."ID_AERONAVE" into var_aeronave_disponible
FROM "LISTARAERONAVES" v 
INNER JOIN "Itinerario" i ON v."ID_VUELO" = i."Id_Vuelo"
where i."Id_Aeronave" is null and ROWNUM = 1 and i."Id" = i_Itinerario;

if var_aeronave_disponible > 0 then
    update "Itinerario" set "Id_Aeronave" = var_aeronave_disponible where "Id" = i_Itinerario;
else
    var_mensaje := 'No se asigno aeronave, por favor validar disponibilidad, y/o confirmacion del vuelo';
GOTO salida;
end if;
--------------------------------------------------------------------------------------------------
--Punto b
--Recuperar el orgen del vuelo, para la busqueda de la tripulacion disponible
select a."Ciudad"
into var_ubi_act_tri
from "Itinerario" i
inner join "Vuelo" v on i."Id_Vuelo" = v."Id"
inner join "Rutas" r on v."Id_Ruta" = r."Id"
inner join "Aeropuerto" a on r."Id_Aeropuerto_Origen" = a."Id"
where v."Id" = i_Itinerario;

--Recuperar El piloto y el copiloto:
insert into "PersonalAsignado" ("Rol","Id_Empleados","Id_Itinerario")
select 'Piloto',e."Id",i_Itinerario
from "Empleados" e inner join "Pilotos" p on e."Id" = p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and ROWNUM = 1
and p."Cargo" = 'Comandante';

if sql%NOTFOUND then
    var_mensaje := 'No se encontro piloto';
GOTO salida;
end if;

insert into "PersonalAsignado" ("Rol","Id_Empleados","Id_Itinerario")
select 'Copiloto',e."Id",i_Itinerario
from "Empleados" e inner join "Pilotos" p on e."Id" = p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and ROWNUM = 1
and p."Cargo" = 'Primer Oficial';

if sql%NOTFOUND then
    var_mensaje := 'No se encontro copiloto';
GOTO salida;
end if;

--Validacion de la cantidad de asientos para asignar tripulacion
select ("Cant_Sillas_Negocios" + "Cant_Sillas_Economica") 
into var_can_sillas 
from "Aeronave" 
where "Id" = var_aeronave_disponible;

case 
when var_can_sillas >= 19 and var_can_sillas < 50 then var_can_auxi := 1;
when var_can_sillas >= 50 and var_can_sillas < 100 then var_can_auxi := 2;
when var_can_sillas >= 100 and var_can_sillas < 180 then var_can_auxi := 3;
when var_can_sillas >= 180 and var_can_sillas < 200 then var_can_auxi := 4;
when var_can_sillas >= 200 and var_can_sillas < 250 then var_can_auxi := 5;
when var_can_sillas >= 250 and var_can_sillas < 300 then var_can_auxi := 6;
when var_can_sillas >= 300 and var_can_sillas < 350 then var_can_auxi := 7;
when var_can_sillas >= 350 and var_can_sillas < 400 then var_can_auxi := 8;
when var_can_sillas >= 450 and var_can_sillas < 500 then var_can_auxi := 9;
when var_can_sillas >= 500 and var_can_sillas < 600 then var_can_auxi := 10;
when var_can_sillas >= 650 and var_can_sillas < 700 then var_can_auxi := 11;
when var_can_sillas >= 750 and var_can_sillas < 800 then var_can_auxi := 12;
when var_can_sillas >= 850 and var_can_sillas < 853 then var_can_auxi := 18;
else var_can_auxi := 1;
end case;

insert into "PersonalAsignado" ("Rol","Id_Empleados","Id_Itinerario")
select 'Azafata',e."Id",i_Itinerario
from "Empleados" e inner join "Pilotos" p on e."Id" = p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and ROWNUM <= var_can_auxi
and e."Sexo" = 'Mujer';

if sql%NOTFOUND then
    var_mensaje := 'No se encontro auxiliares';
GOTO salida;
end if;

dbms_output.put_line(var_mensaje);
<<salida>>
dbms_output.put_line(var_mensaje);
end;

--Punto 4
ALTER TABLE "PersonalAsignado" ADD CONSTRAINT CK_ROL CHECK ("Rol" IN ('Piloto','Copiloto','Azafata'));

Create Or Replace view ListarPersonalAsignado AS
Select v."Id" Id_Vuelo, 
      e."Nombre",
      (Case When p."Rol" = 'Piloto' Then 'Piloto' End) Pilotos,
      (Case When p."Rol" = 'Copiloto' Then 'Copiloto' End) Copilotos,  
      (Case When p."Rol" = 'Azafata' Then 'Azafata' End) Azafatas       
      
From "Vuelo" v Inner join "Itinerario" i on v."Id"=i."Id_Vuelo"
              Inner join "PersonalAsignado" p on i."Id" = p."Id_Itinerario" 
              Inner join "Empleados" e on p."Id_Empleados" = e."Id"
Where i."Estado" in ('confirmado');
