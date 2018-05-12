--------------------------------------------------------
-- Archivo creado  - sábado-mayo-12-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_AERONAVE
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_AERONAVE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_AEROPUERTO
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_AEROPUERTO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CHEKIN
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_CHEKIN"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_EMPLEADOS
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_EMPLEADOS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2702 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_HABILITACION
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_HABILITACION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ITINERARIO
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_ITINERARIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_LOGVUELO
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_LOGVUELO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PASAJEROS
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_PASAJEROS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PERSONALASIGNADO
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_PERSONALASIGNADO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PILOTOS
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_PILOTOS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 501 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RUTAS
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_RUTAS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TIPOLICENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_TIPOLICENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_VUELO
--------------------------------------------------------

   CREATE SEQUENCE  "USERDBA"."SEQ_VUELO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table Aeronave
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Aeronave" 
   (	"Id" NUMBER(9,0), 
	"Matricula" VARCHAR2(250 BYTE), 
	"Num_Serial" NUMBER(*,0), 
	"Edad" VARCHAR2(250 BYTE), 
	"Cant_Sillas_Negocios" NUMBER(*,0), 
	"Estado" NVARCHAR2(20), 
	"ULTIMA_UBICACION" NVARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Aeropuerto
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Aeropuerto" 
   (	"Id" NUMBER(9,0), 
	"Nombre" VARCHAR2(250 BYTE), 
	"Abreviacion" VARCHAR2(250 BYTE), 
	"Ciudad" VARCHAR2(250 BYTE), 
	"Coordenadas" VARCHAR2(250 BYTE), 
	"Pais" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Checkin
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Checkin" 
   (	"Id" NUMBER(9,0), 
	"Num_Confirmacion_Checkin" NUMBER(*,0), 
	"Nombre_Contacto_Emergencia" VARCHAR2(250 BYTE), 
	"Ciudad_Contacto_Emergencia" VARCHAR2(250 BYTE), 
	"Pais_Contacto_Emergencia" VARCHAR2(250 BYTE), 
	"Correo_Contacto_Emergencia" VARCHAR2(250 BYTE), 
	"Numero_Contacto_Emergencia" NUMBER(*,0), 
	"Silla_Asignada" VARCHAR2(250 BYTE), 
	"Tipo_Silla" VARCHAR2(250 BYTE), 
	"Id_Pasajero" NUMBER(9,0), 
	"Id_Itinerario" NUMBER(9,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Empleados
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Empleados" 
   (	"Id" NUMBER(9,0), 
	"Nombre" VARCHAR2(250 BYTE), 
	"Apellido" VARCHAR2(250 BYTE), 
	"Sexo" VARCHAR2(250 BYTE), 
	"Fec_Nac" DATE, 
	"Antiguedad" NUMBER(*,0), 
	"Fecha_Ultimo_Entrenamiento" DATE, 
	"Direccion_Residencia" VARCHAR2(250 BYTE), 
	"Email" VARCHAR2(250 BYTE), 
	"Celular" VARCHAR2(250 BYTE), 
	"Horas_Descanso_Ultimo_Vuelo" NUMBER(*,0), 
	"Estado" VARCHAR2(250 BYTE), 
	"Ubicacion_Actual" VARCHAR2(250 BYTE), 
	"Tipo" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Itinerario
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Itinerario" 
   (	"Id" NUMBER(9,0), 
	"Fecha_Estimada_Salida" DATE, 
	"Fecha_Estimada_Llegada" DATE, 
	"Fecha_Real_Salida" DATE, 
	"Fecha_Real_Llegada" DATE, 
	"Hora_Estimada_Salida" TIMESTAMP (6), 
	"Hora_Estimada_Llegada" TIMESTAMP (6), 
	"Hora_Real_Salida" TIMESTAMP (6), 
	"Hora_Real_Llegada" TIMESTAMP (6), 
	"DuracionReal" NUMBER(*,0), 
	"Id_Vuelo" NUMBER(9,0), 
	"Id_Aeronave" NUMBER(9,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Log_Vuelo
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Log_Vuelo" 
   (	"Id" NUMBER(9,0), 
	"Id_Itinerario" NUMBER(9,0), 
	"TimeStamp" NUMBER(*,0), 
	"HoraUTC" TIMESTAMP (6), 
	"Latitud" VARCHAR2(250 BYTE), 
	"Longitud" VARCHAR2(250 BYTE), 
	"Altitud" NUMBER(*,0), 
	"Velocidad" NUMBER(*,0), 
	"Dirreccion" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Pasajeros
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Pasajeros" 
   (	"Id" NUMBER(9,0), 
	"Tipo_Documento" VARCHAR2(250 BYTE), 
	"Num_Documento" VARCHAR2(250 BYTE), 
	"Nombre" VARCHAR2(250 BYTE), 
	"Apellido" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table PersonalAsignado
--------------------------------------------------------

  CREATE TABLE "USERDBA"."PersonalAsignado" 
   (	"Id" NUMBER(9,0), 
	"Id_Empleados" NUMBER(9,0), 
	"Id_Itinerario" NUMBER(9,0), 
	"Rol" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Pilotos
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Pilotos" 
   (	"Id" NUMBER(9,0), 
	"Nivel_Ingles" VARCHAR2(250 BYTE), 
	"Cant_Horas_Vuelo" NUMBER(*,0), 
	"Cargo" VARCHAR2(250 BYTE), 
	"TipoLicencia" NUMBER(9,0), 
	"Id_Empleados" NUMBER(9,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Rutas
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Rutas" 
   (	"Id" NUMBER(9,0), 
	"Id_Aeropuerto_Origen" NUMBER(9,0), 
	"Id_Aeropuerto_Destino" NUMBER(9,0), 
	"Distancia" NUMBER(*,0), 
	"DURACION_PROMEDIO" NUMBER(9,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  DDL for Table Vuelo
--------------------------------------------------------

  CREATE TABLE "USERDBA"."Vuelo" 
   (	"Id" NUMBER(9,0), 
	"Id_Ruta" NUMBER(9,0), 
	"Nombre" VARCHAR2(250 BYTE), 
	"Frecuencia" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA" ;
--------------------------------------------------------
--  Constraints for Table Aeronave
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Aeronave" MODIFY ("ULTIMA_UBICACION" NOT NULL ENABLE);
  ALTER TABLE "USERDBA"."Aeronave" ADD CONSTRAINT "CK_ESTADO_AVION" CHECK ("Estado"='Vuelo' OR "Estado"='Tierra' OR "Estado"='Mantenimiento' OR "Estado"='Reparación') ENABLE;
  ALTER TABLE "USERDBA"."Aeronave" MODIFY ("Estado" NOT NULL ENABLE);
  ALTER TABLE "USERDBA"."Aeronave" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Aeropuerto
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Aeropuerto" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Checkin
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Checkin" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Empleados
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Empleados" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Itinerario
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Itinerario" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Log_Vuelo
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Log_Vuelo" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Pasajeros
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Pasajeros" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PersonalAsignado
--------------------------------------------------------

  ALTER TABLE "USERDBA"."PersonalAsignado" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
  ALTER TABLE "USERDBA"."PersonalAsignado" MODIFY ("Rol" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table Pilotos
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Pilotos" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Rutas
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Rutas" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Vuelo
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Vuelo" ADD PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AVIANCA"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Checkin
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Checkin" ADD CONSTRAINT "FK_CHECKIN_ITINERARIO" FOREIGN KEY ("Id_Itinerario")
	  REFERENCES "USERDBA"."Itinerario" ("Id") ENABLE;
  ALTER TABLE "USERDBA"."Checkin" ADD CONSTRAINT "FK_CHECKIN_PASAJEROS" FOREIGN KEY ("Id_Pasajero")
	  REFERENCES "USERDBA"."Pasajeros" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Itinerario
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Itinerario" ADD CONSTRAINT "FK_ITINERARIO_AERONAVE" FOREIGN KEY ("Id_Aeronave")
	  REFERENCES "USERDBA"."Aeronave" ("Id") ENABLE;
  ALTER TABLE "USERDBA"."Itinerario" ADD CONSTRAINT "FK_ITINERARIO_VUELO" FOREIGN KEY ("Id_Vuelo")
	  REFERENCES "USERDBA"."Vuelo" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Log_Vuelo
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Log_Vuelo" ADD CONSTRAINT "FK_LOGVUELO_ITINERARIO" FOREIGN KEY ("Id_Itinerario")
	  REFERENCES "USERDBA"."Itinerario" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PersonalAsignado
--------------------------------------------------------

  ALTER TABLE "USERDBA"."PersonalAsignado" ADD CONSTRAINT "FK_PERSONALASIGNADO_EMPLEADOS" FOREIGN KEY ("Id_Empleados")
	  REFERENCES "USERDBA"."Empleados" ("Id") ENABLE;
  ALTER TABLE "USERDBA"."PersonalAsignado" ADD CONSTRAINT "FK_PERSONALASIGNADO_ITINERARIO" FOREIGN KEY ("Id_Itinerario")
	  REFERENCES "USERDBA"."Itinerario" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Pilotos
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Pilotos" ADD CONSTRAINT "FK_PILOTOS_EMPLEADOS" FOREIGN KEY ("Id_Empleados")
	  REFERENCES "USERDBA"."Empleados" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Rutas
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Rutas" ADD CONSTRAINT "FK_RUTAS_AEROPUERTODESTINO" FOREIGN KEY ("Id_Aeropuerto_Destino")
	  REFERENCES "USERDBA"."Aeropuerto" ("Id") ENABLE;
  ALTER TABLE "USERDBA"."Rutas" ADD CONSTRAINT "FK_RUTAS_AEROPUERTOORIGEN" FOREIGN KEY ("Id_Aeropuerto_Origen")
	  REFERENCES "USERDBA"."Aeropuerto" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table Vuelo
--------------------------------------------------------

  ALTER TABLE "USERDBA"."Vuelo" ADD CONSTRAINT "FK_VUELO_RUTAS" FOREIGN KEY ("Id_Ruta")
	  REFERENCES "USERDBA"."Rutas" ("Id") ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_AERONAVE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_AERONAVE" 
before insert on "Aeronave" for each row
begin
Select seq_Aeronave.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_AERONAVE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_AEROPUERTO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_AEROPUERTO" 
before insert on "Aeropuerto" for each row
begin
Select seq_Aeropuerto.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_AEROPUERTO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_EMPLEADOS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_EMPLEADOS" 
before insert on "Empleados" for each row
begin
Select seq_Empleados.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_EMPLEADOS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_ITINERARIO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_ITINERARIO" 
before insert on "Itinerario" for each row
begin
Select seq_Itinerario.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_ITINERARIO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_LOGVUELO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_LOGVUELO" 
before insert on "Log_Vuelo" for each row
begin
Select seq_LogVuelo.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_LOGVUELO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_PASAJEROS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_PASAJEROS" 
before insert on "Pasajeros" for each row
begin
Select seq_Pasajeros.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_PASAJEROS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_PERSONALASIGNADO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_PERSONALASIGNADO" 
before insert on "PersonalAsignado" for each row
begin
Select seq_PersonalAsignado.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_PERSONALASIGNADO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_PILOTOS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_PILOTOS" 
before insert on "Pilotos" for each row
begin
Select seq_Pilotos.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_PILOTOS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_RUTAS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_RUTAS" 
before insert on "Rutas" for each row
begin
Select seq_Rutas.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_RUTAS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_VUELO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "USERDBA"."TRIG_VUELO" 
before insert on "Vuelo" for each row
begin
Select seq_Vuelo.nextval into :new."Id" from Dual;
end;
/
ALTER TRIGGER "USERDBA"."TRIG_VUELO" ENABLE;
