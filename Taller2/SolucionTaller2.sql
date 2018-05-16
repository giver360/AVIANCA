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
create or replace PROCEDURE PROGRAMACION_TRIPULACION_JOB(i_horas_antes IN NUMBER)
AS

I_ITINERARIO number := 0;

cursor c_vuelos is
    select "Id"
    from "Itinerario"
    where TO_NUMBER(TO_CHAR(sysdate,'HH24')) - TO_NUMBER(TO_CHAR("Hora_Estimada_Salida",'HH24')) <= i_horas_antes
    order by "Id" DESC;

begin

open c_vuelos;

        loop    
            fetch c_vuelos into I_ITINERARIO;            
            exit when c_vuelos%notfound;
            PROGRAMACION_TRIPULACION(I_ITINERARIO => I_ITINERARIO );
        end loop;

close c_vuelos;
END;

create or replace PROCEDURE PROGRAMACION_TRIPULACION(i_Itinerario IN NUMBER)
AS

var_aeronave_disponible number := 0;
var_can_auxi number := 0;
var_can_auxi_dispo number := 0;
var_can_sillas number := 0;
var_dif_horas number := 0;
var_ubi_act_tri nvarchar2(255) := '';
var_mensaje nvarchar2(255) := 'Se asigno aeronave y tripulacion al vuelo correctametne';

begin
--Numeral a
--Asignar la aeronave a los vuelos confirmados, que se encuentran en el aeropuerto de salida, dos horas antes de la hora estimada de salida

/*UPDATE (SELECT i."Id_Aeronave" as sinavio,v."ID_AERONAVE" as aviodispo
            FROM "LISTARAERONAVES" v 
            INNER JOIN "Itinerario" i ON v."ID_VUELO" = i."Id_Vuelo"
            where i."Id_Aeronave" is null and ROWNUM = 1) u
SET u.sinavio = u.aviodispo;*/

--Se recupera la aeronave
SELECT v."ID_AERONAVE" 
into var_aeronave_disponible
FROM "LISTARAERONAVES" v 
INNER JOIN "Itinerario" i ON v."ID_VUELO" = i."Id_Vuelo"
where i."Id_Aeronave" is null and ROWNUM = 1 and i."Id" = i_Itinerario;

--Validacion de aeronave disponible para asignacion
if sql%FOUND then
    update "Itinerario" set "Id_Aeronave" = var_aeronave_disponible where "Id" = i_Itinerario;
else
    var_mensaje := 'No se asigno aeronave, por favor validar disponibilidad, y/o confirmacion del vuelo';
GOTO salida;
end if;
--------------------------------------------------------------------------------------------------------------------------------
--Numeral b
--Recuperar el orgen del vuelo, para la busqueda de la tripulacion disponible
select a."Ciudad"
into var_ubi_act_tri
from "Itinerario" i
inner join "Vuelo" v on i."Id_Vuelo" = v."Id"
inner join "Rutas" r on v."Id_Ruta" = r."Id"
inner join "Aeropuerto" a on r."Id_Aeropuerto_Origen" = a."Id"
where i."Id" = i_Itinerario;

--Con el origen del vuelo y demas condiciones se busca el piloto
insert into "PersonalAsignado" ("Rol","Id_Empleados","Id_Itinerario")
select 'Piloto',e."Id",i_Itinerario
from "Empleados" e inner join "Pilotos" p on e."Id" = p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and ROWNUM = 1
and p."Cargo" = 'Comandante';

--Se valida piloto disponible
if sql%NOTFOUND then
    rollback;--Por si no se encuentra piloto, devolver las asignaciones anteriores
    var_mensaje := 'No se encontro piloto disponible';
GOTO salida;
end if;

--Con el origen del vuelo y demas condiciones se busca el Copipiloto
insert into "PersonalAsignado" ("Rol","Id_Empleados","Id_Itinerario")
select 'Copiloto',e."Id",i_Itinerario
from "Empleados" e inner join "Pilotos" p on e."Id" = p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and ROWNUM = 1
and p."Cargo" = 'Primer Oficial';

--Se valida copipiloto disponible
if sql%NOTFOUND then
    rollback;--Por si no se encuentra copiloto, devolver las asignaciones anteriores
    var_mensaje := 'No se encontro copiloto disponible';
GOTO salida;
end if;

--Busqueda de la cantidad de asientos para asignar tripulacion
select ("Cant_Sillas_Negocios" + "Cant_Sillas_Economica") 
into var_can_sillas 
from "Aeronave" 
where "Id" = var_aeronave_disponible;

--Asignacion de tripulacion segun politica especificada en el primer taller
var_can_auxi := CANTIDAD_TRIPULACION(I_CAN_SILLAS => var_can_sillas );

select TO_NUMBER(TO_CHAR("Hora_Estimada_Llegada",'HH24')) - TO_NUMBER(TO_CHAR("Hora_Estimada_Salida",'HH24'))
into var_dif_horas
from "Itinerario"
where "Id" = i_Itinerario;

--Si el vuelo dura mas de 6 horas, aducionar un auxiliar mas
if var_dif_horas > 6 then
var_can_auxi := var_can_auxi + 1;
end if;

--Se valida la disponibilidad de auxiliares de vuelo
select count(DISTINCT(e."Id"))
into var_can_auxi_dispo
from "Empleados" e inner join "Pilotos" p on e."Id" <> p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and p."Cargo" = 'Azafata';

if var_can_auxi_dispo >= var_can_auxi then

--Con el origen del vuelo, y politica de cantidad de asientos, se asigna los auxiliares del vuelo
insert into "PersonalAsignado" ("Rol","Id_Empleados","Id_Itinerario")
select 'Azafata',e."Id",i_Itinerario
from "Empleados" e inner join "Pilotos" p on e."Id" = p."Id_Empleados"
where "Estado" = 'ACTIVO' and "Horas_Descanso_Ult_Vuelo" = 2 and "Ubicacion_Actual" = var_ubi_act_tri and ROWNUM <= var_can_auxi
and p."Cargo" = 'Azafata';

else
    rollback;--Por si no se encuentra auxiliares, devolver las asignaciones anteriores
    var_mensaje := 'No se encontro auxiliares';
GOTO salida;
end if;

--------------------------------------------------------------------------------------------------------------------------------
--Numeral c
--Se actualiza el vuelo a estado confirmado
update "Itinerario" set "Estado" = 'confirmado' where "Id" = i_Itinerario;

COMMIT;

<<salida>>
dbms_output.put_line(var_mensaje);

EXCEPTION
WHEN OTHERS THEN
ROLLBACK;
dbms_output.put_line('No se asigno aeronave, por favor validar disponibilidad, y/o confirmacion del vuelo');
end;

--Funcion que se usa para determinar el numero de auxiliares en un buelo a partir del numero de sillas
create or replace FUNCTION CANTIDAD_TRIPULACION(I_CAN_SILLAS NUMBER)
RETURN NUMBER
IS

var_can_auxi NUMBER := 0;

BEGIN

case 
when I_CAN_SILLAS >= 19 and I_CAN_SILLAS < 50 then var_can_auxi := 1;
when I_CAN_SILLAS >= 50 and I_CAN_SILLAS < 100 then var_can_auxi := 2;
when I_CAN_SILLAS >= 100 and I_CAN_SILLAS < 180 then var_can_auxi := 3;
when I_CAN_SILLAS >= 180 and I_CAN_SILLAS < 200 then var_can_auxi := 4;
when I_CAN_SILLAS >= 200 and I_CAN_SILLAS < 250 then var_can_auxi := 5;
when I_CAN_SILLAS >= 250 and I_CAN_SILLAS < 300 then var_can_auxi := 6;
when I_CAN_SILLAS >= 300 and I_CAN_SILLAS < 350 then var_can_auxi := 7;
when I_CAN_SILLAS >= 350 and I_CAN_SILLAS < 400 then var_can_auxi := 8;
when I_CAN_SILLAS >= 450 and I_CAN_SILLAS < 500 then var_can_auxi := 9;
when I_CAN_SILLAS >= 500 and I_CAN_SILLAS < 600 then var_can_auxi := 10;
when I_CAN_SILLAS >= 650 and I_CAN_SILLAS < 700 then var_can_auxi := 11;
when I_CAN_SILLAS >= 750 and I_CAN_SILLAS < 800 then var_can_auxi := 12;
when I_CAN_SILLAS >= 850 and I_CAN_SILLAS < 853 then var_can_auxi := 18;
else var_can_auxi := 1;
end case;

RETURN var_can_auxi;

END;

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

--Punto5
CREATE OR REPLACE VIEW VuelosProgramado AS
SELECT 
    It."Id_Vuelo", It."Hora_Estimada_Salida" , It."Fecha_Estimada_Salida"
FROM 
    "Itinerario" It inner join "Vuelo" V on It."Id_Vuelo" = V."Id"
WHERE
    TRUNC(It."Fecha_Estimada_Salida") between TRUNC(SYSDATE) and TRUNC(SYSDATE + 15)
ORDER BY It."Fecha_Estimada_Salida"

--Punto6
--PRIMERA VISTA: Explain plan a la vista LISTARAERONAVES
explain plan set statement_id = 'ep_LISTARAERONAVES01' for 
SELECT * FROM "LISTARAERONAVES";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARAERONAVES01' , 'TYPICAL'));
-----------------------------------------------------------------------------------------------
--Crearemos un index sobre la tabla Itinerarios en el campo Id_Aeronaves
create index "Id_Aeronave" on "Itinerario" ("Id_Aeronave");

explain plan set statement_id = 'ep_LISTARAERONAVES02' for 
SELECT * FROM "LISTARAERONAVES";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARAERONAVES01' , 'TYPICAL'));
select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARAERONAVES02' , 'TYPICAL'));
--Se presento una mejora en el costo pasando de 27 a 25
------------------------------------------------------------------------------------------------
--Crearemos un index sobre la tabla Itinerarios en el campo Id_Aeronaves
create index "Id_Vuelo" on "Itinerario" ("Id_Vuelo");

explain plan set statement_id = 'ep_LISTARAERONAVES03' for 
SELECT * FROM "LISTARAERONAVES";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARAERONAVES02' , 'TYPICAL'));
select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARAERONAVES03' , 'TYPICAL'));
--El costo se mantuvo igual
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Se eliminan los index para poder realizar el ejercicio con la vista LISTARPERSONALASIGNADO ya tambien usa las mismas tablas
drop index "Id_Aeronave";
drop index "Id_Vuelo";
------------------------------------------------------------------------------------------------
--SEGUNDA VISTA: Explain plan a la vista LISTARPERSONALASIGNADO
explain plan set statement_id = 'ep_LISTARPERSONALASIGNADO001' for 
SELECT * FROM "LISTARPERSONALASIGNADO";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARPERSONALASIGNADO001' , 'TYPICAL'));
-------------------------------------------------------------------------------------------------
--Crearemos un index sobre la tabla Itinerarios en el campo Id_Aeronaves
create index "Id_Aeronave" on "Itinerario" ("Id_Aeronave");

explain plan set statement_id = 'ep_LISTARPERSONALASIGNADO002' for 
SELECT * FROM "LISTARPERSONALASIGNADO";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARPERSONALASIGNADO001' , 'TYPICAL'));
select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARPERSONALASIGNADO002' , 'TYPICAL'));
--El costo se mantuvo igual
-------------------------------------------------------------------------------------------------
--Crearemos un index sobre la tabla Itinerarios en el campo Id_Aeronaves
create index "Id_Vuelo" on "Itinerario" ("Id_Vuelo");

explain plan set statement_id = 'ep_LISTARPERSONALASIGNADO003' for 
SELECT * FROM "LISTARPERSONALASIGNADO";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARPERSONALASIGNADO002' , 'TYPICAL'));
select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_LISTARPERSONALASIGNADO003' , 'TYPICAL'));
--El costo se mantuvo igual
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Se eliminan los index para poder realizar el ejercicio con la vista VUELOSPROGRAMADO ya tambien usa las mismas tablas
drop index "Id_Aeronave";
drop index "Id_Vuelo";
------------------------------------------------------------------------------------------------
--TERCERA VISTA: Explain plan a la vista VUELOSPROGRAMADO
explain plan set statement_id = 'ep_VUELOSPROGRAMADO001' for 
SELECT * FROM "VUELOSPROGRAMADO";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_VUELOSPROGRAMADO001' , 'TYPICAL'));
-------------------------------------------------------------------------------------------------
--Crearemos un index sobre la tabla Itinerarios en el campo Id_Aeronaves
create index "Id_Vuelo" on "Itinerario" ("Id_Vuelo");

explain plan set statement_id = 'ep_VUELOSPROGRAMADO002' for 
SELECT * FROM "VUELOSPROGRAMADO";

select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_VUELOSPROGRAMADO001' , 'TYPICAL'));
select * from table(dbms_xplan.display('PLAN_TABLE', 'ep_VUELOSPROGRAMADO002' , 'TYPICAL'));
--El costo se mantuvo igual
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
