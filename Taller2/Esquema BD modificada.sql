--------------------------------------------------------
-- Archivo creado  - domingo-mayo-13-2018   
--------------------------------------------------------
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
	"Ultima_Ubicacion" NVARCHAR2(255), 
	"Cant_Sillas_Economica" NUMBER(38,0), 
	"Tipo Aeronave" VARCHAR2(250 BYTE)
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
	"Id_Aeronave" NUMBER(9,0), 
	"Estado" NVARCHAR2(20)
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

REM INSERTING into USERDBA."Aeronave"
SET DEFINE OFF;
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('3','N764AV','7887','Brand new','12','Tierra','Medellin','138','Airbus A320-251N');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('4','N765AV','7928','Brand new','12','Vuelo','Bogota','138','Airbus A320-251N');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('5','N759AV','7770','Brand new','12','Tierra','Bogota','182','Airbus A321-253N');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('6','N759AV','7847','Brand new','12','Tierra','Bogota','182','Airbus A321-253N');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('7','N589AV','2575','12 years','12','Tierra',null,'88','Airbus A318-111');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('8','N590EL','2328','13 years','12','Tierra',null,'88','Airbus A318-111');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('9','N591EL','2333','13 years','12','Tierra',null,'88','Airbus A318-111');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('10','N593EL','2358','13 years','12','Tierra',null,'88','Airbus A318-111');
Insert into USERDBA."Aeronave" ("Id","Matricula","Num_Serial","Edad","Cant_Sillas_Negocios","Estado","Ultima_Ubicacion","Cant_Sillas_Economica","Tipo Aeronave") values ('11','N594EL','2367','13 years','12','Tierra',null,'88','Airbus A318-111');
REM INSERTING into USERDBA."Aeropuerto"
SET DEFINE OFF;
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('1','Jose Maria Cordoba','SKRG','Medellin',null,'Colombia');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('2','El Dorado','SKBO','Bogota',null,'Colombia');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('3','Alfonso Bonilla Aragon','SKCL','Cali',null,'Colombia');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('4','Rafael Nunez','SKCG','Cartagena',null,'Colombia');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('5','San Salvador','MSLP','Salvador',null,'El Salvador');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('6','Jorge Chavez','SPJC','Lima',null,'Peru');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('7','Barajas Airpot','LEMD','Madrid',null,'Spain');
Insert into USERDBA."Aeropuerto" ("Id","Nombre","Abreviacion","Ciudad","Coordenadas","Pais") values ('8','International Airport','KMIA','Miami',null,'United States');
REM INSERTING into USERDBA."Itinerario"
SET DEFINE OFF;
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('7',to_date('12/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_date('12/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_timestamp('12/05/18 12:53:36,846000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 12:53:36,846000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 12:53:36,846000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 12:53:36,846000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1','3','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('8',to_date('11/05/18','DD/MM/RR'),to_date('12/05/18','DD/MM/RR'),to_date('11/05/18','DD/MM/RR'),to_date('12/05/18','DD/MM/RR'),to_timestamp('11/05/18 12:54:02,070000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 12:54:02,070000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('11/05/18 12:54:02,070000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 12:54:02,070000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1','4','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('9',to_date('10/05/18','DD/MM/RR'),to_date('11/05/18','DD/MM/RR'),to_date('10/05/18','DD/MM/RR'),to_date('11/05/18','DD/MM/RR'),to_timestamp('10/05/18 12:54:08,063000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('11/05/18 12:54:08,063000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('10/05/18 12:54:08,063000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('11/05/18 12:54:08,063000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1','5','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('10',to_date('09/05/18','DD/MM/RR'),to_date('10/05/18','DD/MM/RR'),to_date('09/05/18','DD/MM/RR'),to_date('10/05/18','DD/MM/RR'),to_timestamp('09/05/18 12:54:14,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('10/05/18 12:54:14,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('09/05/18 12:54:14,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('10/05/18 12:54:14,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1','6','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('11',to_date('08/05/18','DD/MM/RR'),to_date('09/05/18','DD/MM/RR'),to_date('08/05/18','DD/MM/RR'),to_date('09/05/18','DD/MM/RR'),to_timestamp('08/05/18 12:54:19,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('09/05/18 12:54:19,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('08/05/18 12:54:19,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('09/05/18 12:54:19,605000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1','7','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('12',to_date('07/05/18','DD/MM/RR'),to_date('08/05/18','DD/MM/RR'),to_date('07/05/18','DD/MM/RR'),to_date('08/05/18','DD/MM/RR'),to_timestamp('07/05/18 12:54:26,909000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('08/05/18 12:54:26,909000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('07/05/18 12:54:26,909000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('08/05/18 12:54:26,909000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1','8','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('13',to_date('13/05/18','DD/MM/RR'),to_date('14/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_date('14/05/18','DD/MM/RR'),to_timestamp('13/05/18 12:56:01,243000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('14/05/18 12:56:01,243000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 12:56:01,243000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('14/05/18 12:56:01,243000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'2','3','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('14',to_date('14/05/18','DD/MM/RR'),to_date('15/05/18','DD/MM/RR'),to_date('14/05/18','DD/MM/RR'),to_date('15/05/18','DD/MM/RR'),to_timestamp('14/05/18 12:56:07,342000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 12:05:00,342000000 PM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('14/05/18 12:00:00,342000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 12:05:00,342000000 PM','DD/MM/RR HH12:MI:SSXFF AM'),null,'2','4','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('15',to_date('15/05/18','DD/MM/RR'),to_date('16/05/18','DD/MM/RR'),to_date('15/05/18','DD/MM/RR'),to_date('16/05/18','DD/MM/RR'),to_timestamp('15/05/18 12:56:13,199000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('16/05/18 12:56:13,199000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('15/05/18 12:56:13,199000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('16/05/18 12:56:13,199000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'2','5','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('16',to_date('16/05/18','DD/MM/RR'),to_date('17/05/18','DD/MM/RR'),to_date('16/05/18','DD/MM/RR'),to_date('17/05/18','DD/MM/RR'),to_timestamp('16/05/18 12:56:21,284000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 12:56:21,284000000 PM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('16/05/18 12:56:21,284000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('17/05/18 12:56:21,284000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'2','6','confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('17',to_date('12/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_date('12/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_timestamp('12/05/18 01:30:44,784000000 PM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 01:36:44,784000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 01:30:44,784000000 PM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 01:36:44,784000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'1',null,'confirmado');
Insert into USERDBA."Itinerario" ("Id","Fecha_Estimada_Salida","Fecha_Estimada_Llegada","Fecha_Real_Salida","Fecha_Real_Llegada","Hora_Estimada_Salida","Hora_Estimada_Llegada","Hora_Real_Salida","Hora_Real_Llegada","DuracionReal","Id_Vuelo","Id_Aeronave","Estado") values ('19',to_date('12/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_date('12/05/18','DD/MM/RR'),to_date('13/05/18','DD/MM/RR'),to_timestamp('13/05/18 01:36:44,784000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 01:36:44,784000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('12/05/18 01:36:44,784000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),to_timestamp('13/05/18 01:36:44,784000000 AM','DD/MM/RR HH12:MI:SSXFF AM'),null,'2',null,'confirmado');
REM INSERTING into USERDBA."PersonalAsignado"
SET DEFINE OFF;
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('1','3','7','Piloto');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('2','1','7','Copiloto');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('3','2554','7','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('4','2555','7','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('5','2556','7','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('6','2557','7','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('7','2558','7','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('8','498','14','Piloto');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('9','499','14','Copiloto');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('10','2554','14','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('11','2555','14','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('12','2556','14','Azafata');
Insert into USERDBA."PersonalAsignado" ("Id","Id_Empleados","Id_Itinerario","Rol") values ('13','2557','14','Azafata');
REM INSERTING into USERDBA."Rutas"
SET DEFINE OFF;
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('1','1','2','0','0');
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('2','2','1','0','0');
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('4','3','4',null,null);
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('5','4','3',null,null);
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('6','5','6',null,null);
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('7','6','5',null,null);
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('8','7','8',null,null);
Insert into USERDBA."Rutas" ("Id","Id_Aeropuerto_Origen","Id_Aeropuerto_Destino","Distancia",DURACION_PROMEDIO) values ('9','8','7',null,null);
REM INSERTING into USERDBA."Vuelo"
SET DEFINE OFF;
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('1','1','Med-Bog','0');
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('2','2','Bog-Med',null);
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('3','4','Cal-Cart',null);
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('4','5','Car-Cal',null);
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('5','6','Sal-Lim',null);
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('6','7','Lim-Sal',null);
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('7','8','Mad-Mia',null);
Insert into USERDBA."Vuelo" ("Id","Id_Ruta","Nombre","Frecuencia") values ('8','9','Mia-Mad',null);
