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
