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
	"Cant_Sillas_Economica" NUMBER(*,0)
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
