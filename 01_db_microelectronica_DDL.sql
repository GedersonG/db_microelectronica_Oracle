/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= DDL =============
 */


-- ELIMINAMOS LAS TABLAS 
drop table componentes cascade constraints;
drop table componentes_detalles cascade constraints;
drop table componentes_transistores_bipolares cascade constraints;
drop table componentes_transistores_mosfet cascade constraints;
drop table componentes_capacitores_electroliticos cascade constraints;
drop table componentes_resistores_alta_frecuencia cascade constraints;
drop table componentes_microcontroladores_risc_pics cascade constraints;
drop table componentes_microcontroladores_risc_avrs cascade constraints;
drop table componentes_placas_arduinos cascade constraints;
drop table componentes_placas_esp8266 cascade constraints;
drop table componentes_placas_esp32 cascade constraints;



-- ELIMINAMOS TODAS LAS SECUENCIAS AUTO INCREMENTABLES ID 
drop sequence id_seq_comp;
drop sequence id_seq_comp_det;
drop sequence id_seq_comp_trans_bip;
drop sequence id_seq_comp_trans_mosf;
drop sequence id_seq_comp_cap_elect;
drop sequence id_seq_comp_resis_alt_frec;
drop sequence id_seq_comp_micr_risc_pics;
drop sequence id_seq_comp_micr_risc_avrs;
drop sequence id_seq_comp_plac_arduinos;
drop sequence id_seq_comp_plac_esp8266;
drop sequence id_seq_comp_plac_esp32;


-- CREAMOS LAS SECUENCIAS AUTOINCREMENTABLES ID
create sequence id_seq_comp start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_det start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_trans_bip start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_trans_mosf start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_cap_elect start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_resis_alt_frec start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_micr_risc_pics start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_micr_risc_avrs start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_plac_arduinos start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_plac_esp8266 start with 1 increment by 1 nocache nocycle;
create sequence id_seq_comp_plac_esp32 start with 1 increment by 1 nocache nocycle;



create table componentes(
	
id      char(2000)  default id_seq_comp.nextval  not null,
codigo varchar2(100) not null, -- ej: mh-r-447y8
imagen varchar2(1000), -- link de la imagen
nro_pieza varchar2(200) not null, -- ej: KSH13005
categoria varchar2(100) not null, -- ej: sensor, circuito integrado, transistor,etc
descripcion varchar2(100) not null, -- ej:transistor bjt npn
fabricante varchar2(100) not null, -- ej: SHANTOU HUASHAN, generico
stock char(200) not null, -- ej: 100, 200, etc
precio  number(8,2) not null -- ej: 5.55 dolares 

);


-- ======= Restricciones Tabla componentes ===========
-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes 
add constraint PK_componentes_id
primary key(id);


-- UNIQUE CODIGO
alter table componentes
add constraint UNIQUE_componentes_codigo
unique (codigo);


-- CHECK STOCK
alter table componentes
add constraint CHECK_componentes_stock
check (stock >= 0 );


-- CHECK PRECIO
alter table componentes
add constraint CHECK_componentes_precio
check (precio > 0 );


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------



-- ======= TABLA COMPONENTES_DETALLES ===========

create table componentes_detalles(
	
id 							char(2000)       default id_seq_comp_det.nextval  not null,
id_componente 				char(2000)       not null,
hoja_de_datos				varchar2(700)	 not null, --link datasheet
longitud					varchar2(30)	 ,-- 69.0 mm
ancho						varchar2(30) 	 ,-- 56.7 mm
peso						varchar2(30) 	,-- 19.4 gramos
material					varchar2(50)	 ,-- silicio,acero, plastico, etc
voltaje_recomendado			varchar2(30)	 , -- 5 voltios
voltaje_min_entrada			varchar2(30)	,-- 7  voltios (recomendado)
voltaje_max_entrada			varchar2(30)	 -- 12  voltios (recomendado)

);

-- ======= Restricciones Tabla componentes_detalles ===========
-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_detalles
add constraint PK_componentes__detalles_id
primary key(id);


-- UNIQUE ID_COMPONENTE
alter table componentes_detalles
add constraint UNIQUE_componentes_detalles_id_componente
unique (id_componente);


-- FK ID_COMPONENTE
alter table componentes_detalles 
add constraint FK_componentes_detalles_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA COMPONENTES_TRANSISTORES_BIPOLARES ===========

create table componentes_transistores_bipolares(
	
id 							char(2000)      default id_seq_comp_trans_bip.nextval  not null,
id_componente 				char(2000)      not null,
tipo						varchar2(10) 	not null, -- NPN, PNP
--Desempeño
voltaje_colec_emis         varchar2(30)    , ---30V, 5.5V
voltaje_colec_base         varchar2(30)    , ---30V, 5.5V
voltaje_emis_base           varchar2(30)    , ---30V, 5.5V
voltaje_colec_emis_sat     varchar2(30)    , ---30V, 5.5V
corriente_colec             varchar2(30)    , ---1.5A
ganancia_hfe                varchar2(30)    , ---1.5A
--Caract. Térmicas			
disip_max					varchar2(30)    , ---0.645W
temp_juntura				varchar2(50)    ----55a+155 °C

);

-- ======= Restricciones Tabla componentes_transistores_bipolares ===========
-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_transistores_bipolares
add constraint PK_componentes_transistores_bipolares_id
primary key(id);


-- UNIQUE ID_COMPONENTE
alter table componentes_transistores_bipolares
add constraint UNIQUE_componentes_transistores_bipolares_id_componente
unique (id_componente);



-- FK ID_COMPONENTE
alter table componentes_transistores_bipolares 
add constraint FK_componentes_transistores_bipolares_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA COMPONENTES_TRANSISTORES_MOSFET ===========

create table componentes_transistores_mosfet(
	
id 							char(2000)      default id_seq_comp_trans_mosf.nextval  not null,
id_componente 				char(2000)      not null,
tipo						varchar2(10) 	not null, -- nMos, pMos
--Espec Máximas
voltaje_drenaje_fuente      varchar2(30)    , ---40v
corriente_cc_drenaje    	varchar2(30)    , ---0.15A
--Caract. Térmicas			
disip_max					varchar2(30)   , ---0.35W
temp_op_max				    varchar2(50)    , ----150 °C
--Caract. Eléctricas
conduct_drenaje_sustrato	varchar2(50)   , ---14 pF 
resist_drenaje_fuente	    varchar2(50)  ---30 Ohm

);

-- ======= Restricciones Tabla componentes_transistores_mosfet ===========

-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_transistores_mosfet
add constraint PK_componentes_transistores_mosfet_id
primary key(id);


-- UNIQUE ID_COMPONENTE 
alter table componentes_transistores_mosfet
add constraint UNIQUE_componentes_transistores_mosfet_id_componente
unique (id_componente);



-- FK ID_COMPONENTE
alter table componentes_transistores_mosfet
add constraint FK_componentes_transistores_mosfet_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA COMPONENTES_CAPACITORES_ELECTROLITICOS ===========

create table componentes_capacitores_electroliticos(
	
id 							char(2000)      default id_seq_comp_cap_elect.nextval  not null,
id_componente 				char(2000)      not null,
tipo						varchar2(30) 	not null, -- plomo axial, plomo radial, etc
--Espec 
capacitancia                 varchar2(30)    , ---10000 uF
tolerancia                	 varchar2(30)     , --- +/- 20%
--Caract. Térmicas			
rango_temperatura			 varchar2(50)   , --- -55 °C to +105 °C
--Caract. Eléctricas
rango_tension_nominal     	 varchar2(50)    --- 10 V to 100 V

);

-- ======= Restricciones Tabla componentes_capacitores_electroliticos ===========

-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_capacitores_electroliticos
add constraint PK_componentes_capacitores_electroliticos_id
primary key(id);




-- UNIQUE ID_COMPONENTE 
alter table componentes_capacitores_electroliticos
add constraint UNIQUE_componentes_capacitores_electroliticos_id_componente
unique (id_componente);

-- FK ID_COMPONENTE
alter table componentes_capacitores_electroliticos
add constraint CHECK_componentes_capacitores_electroliticos_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA COMPONENTES_RESISTORES_ALTA_FRECUENCIA ===========

create table componentes_resistores_alta_frecuencia(
	
id 							char(2000)      default id_seq_comp_resis_alt_frec.nextval  not null,
id_componente 				char(2000)      not null,
--Espec 
capacitancia                 varchar2(50)    , ---10000 uF
rango_tolerancia             varchar2(50)     , ---  ± 5, ± 10, ± 20 standard
rango_resis_gral             varchar2(30)     , ---  20 ? to 1000 ?
rango_resis_microondas       varchar2(30)     , ---  20 ? to 100 ?
capacitancia_parasita        varchar2(30)     , ---   0.2 pF
--Caract. Térmicas			
rango_temperatura			 varchar2(50)   , --- -55 to +125 °C
--Caract. Eléctricas
tension_operativa    	      varchar2(50)    ---  100 V

);

-- ======= Restricciones Tabla componentes_resistores_alta_frecuencia ===========


-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_resistores_alta_frecuencia
add constraint PK_componentes_resistores_alta_frecuencia_id
primary key(id);



-- UNIQUE ID_COMPONENTE 
alter table componentes_resistores_alta_frecuencia
add constraint UNIQUE_componentes_resistores_alta_frecuencia_id_componente
unique (id_componente);

-- FK ID_COMPONENTE
alter table componentes_resistores_alta_frecuencia
add constraint CHECK_componentes_resistores_alta_frecuencia_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- Página Hoja de datos pics : https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB

-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_PICS ===========

create table componentes_microcontroladores_risc_pics(
	
id 							char(2000)      default  id_seq_comp_micr_risc_pics.nextval  not null,
id_componente 				char(2000)      not null,
frec_operacion               varchar2(50)    , --- DC-40 Mhz
memoria_programa             varchar2(50)     , ---  16384 bytes
memoria_datos                varchar2(50)     , ---  768 bytes
memoria_datos_eeprom         varchar2(50)     , ---  256 bytes
cantidad_fuentes_interrup    char(5)     , ---  19   
cantidad_timers              char(5)     , ---  4      
comunic_seriales             varchar2(200)     , ---  MSSP, Enhanced USART      
set_instrucciones            varchar2(200)     ---  75 Instructions; 83 with Extended Instruction Set Enabled     

);

-- ======= Restricciones Tabla componentes_microcontroladores_risc_pics ===========


-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_microcontroladores_risc_pics
add constraint PK_componentes_microcontroladores_risc_pics_id
primary key(id);



-- UNIQUE ID_COMPONENTE 
alter table componentes_microcontroladores_risc_pics
add constraint UNIQUE_componentes_microcontroladores_risc_pics_id_componente
unique (id_componente);


-- FK ID_COMPONENTE
alter table componentes_microcontroladores_risc_pics
add constraint CHECK_componentes_microcontroladores_risc_pics_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- https://datasheetspdf.com/pdf/219613/ATMELCorporation/ATMEGA32/1

-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_AVRS ===========

create table componentes_microcontroladores_risc_avrs(
	
id 							char(2000)      default  id_seq_comp_micr_risc_avrs.nextval  not null,
id_componente 				char(2000)      not null,
frec_operacion               varchar2(50)    , --- DC-40 Mhz
tam_nucleo               varchar2(50)    , --- 8 bits
tam_memoria_programa             varchar2(50)     , ---  16384 bytes
tipo_memoria                 varchar2(50)     , -- Memoria Flash
cantidad_entr_sal              char(5)     , ---  32   
comunic_protocolos           varchar2(200)     , --- I²C, SPI, UART/USART  
temp_funcionamiento           varchar2(50)     ---  -40°C ~ 85°C (TA)

);

-- ======= Restricciones Tabla componentes_microcontroladores_risc_avrs ===========


-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_microcontroladores_risc_avrs
add constraint PK_componentes_microcontroladores_risc_avrs_id
primary key(id);



-- UNIQUE ID_COMPONENTE 
alter table componentes_microcontroladores_risc_avrs
add constraint UNIQUE_componentes_microcontroladores_risc_avrs_id_componente
unique (id_componente);


-- FK ID_COMPONENTE
alter table componentes_microcontroladores_risc_avrs
add constraint CHECK_componentes_microcontroladores_risc_avrs_id_componente
foreign key(id_componente)
references componentes(id)
on delete cascade;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf

-- ======= TABLA COMPONENTES_PLACAS_ARDUINOS ===========

create table componentes_placas_arduinos(
	
id 							char(2000)      default  id_seq_comp_plac_arduinos.nextval  not null,
id_componente 				char(2000)      not null,
procesador                  varchar2(50)    , --- ATMega328P 
frec_mem                    varchar2(20)    , -- 16 MHz
tam_flash                   varchar2(20)    , -- 32 KB
tam_sram                    varchar2(20)    , -- 2 KB
tam_eeprom                  varchar2(20)    , -- 1 KB
cantidad_entr_sal              char(5)     , ---  22   
comunic_protocolos           varchar2(200)  --- I2C, SPI, UART
);

-- ======= Restricciones Tabla componentes_placas_arduinos ===========


-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_placas_arduinos
add constraint PK_componentes_placas_arduinos
primary key(id);



-- UNIQUE ID_COMPONENTE 
alter table componentes_placas_arduinos
add constraint UNIQUE_componentes_placas_arduinos
unique (id_componente);


-- FK ID_COMPONENTE
alter table componentes_placas_arduinos
add constraint CHECK_componentes_placas_arduinos
foreign key(id_componente)
references componentes(id)
on delete cascade;



-- ---------------------------------------------------------------------------




-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- https://cdn-shop.adafruit.com/product-files/2471/0A-ESP8266__Datasheet__EN_v4.3.pdf

-- ======= TABLA COMPONENTES_PLACAS_ESP8266 ===========

create table componentes_placas_esp8266(
	
id 							char(2000)      default  id_seq_comp_plac_esp8266.nextval  not null,
id_componente 				char(2000)      not null,
procesador                  varchar2(100)    , --- CPU RISC de 32-bit: Tensilica Xtensa LX106 
frec_mem                    varchar2(20)    , -- 80 MHz
tam_flash                   varchar2(20)    , --  512 KB a 4 MB
tam_sram                    varchar2(20)    , -- 64 KB
cantidad_entr_sal              char(5)     , --- 16  
comunic_protocolos           varchar2(100),  --- UART/SDIO/SPI/I2C/I2S/IR Remote Control
prot_wifi                   varchar2(100),  -- 802.11 b/g/n
rango_frec                  varchar2(100) -- 2.4G-2.5G (2400M-2483.5M)  
);

-- ======= Restricciones Tabla componentes_placas_esp8266 ===========


-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_placas_esp8266
add constraint PK_componentes_placas_esp8266
primary key(id);



-- UNIQUE ID_COMPONENTE 
alter table componentes_placas_esp8266
add constraint UNIQUE_componentes_placas_esp8266
unique (id_componente);


-- FK ID_COMPONENTE
alter table componentes_placas_esp8266
add constraint CHECK_componentes_placas_esp8266
foreign key(id_componente)
references componentes(id)
on delete cascade;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
-- https://www.microelectronicash.com/downloads/ESP32_MANUAL.pdf

-- ======= TABLA COMPONENTES_PLACAS_ESP32 ===========

create table componentes_placas_esp32(
	
id 							char(2000)      default  id_seq_comp_plac_esp32.nextval  not null,
id_componente 				char(2000)      not null,
procesador                  varchar2(100)    , --- Procesador ARM Xtensa single-/dual-core 32-bit LX6
frec_mem                    varchar2(20)    , -- -
tam_flash                   varchar2(20)    , --  -
tam_sram                    varchar2(20)    , -- -
cantidad_entr_sal              char(5)     , --- -  
comunic_protocolos           varchar2(100),  --- UART/SDIO/SPI/I2C/I2S/IR Remote Control
prot_wifi                   varchar2(100),  -- 802.11 b/g/n (802.11n up to 150 Mbps)
rango_frec                  varchar2(100), -- 2.4G-2.5G 
modo_wifi                   varchar2(100), -- Station/SoftAP/SoftAP+Station/P2P
seg_wifi                     varchar2(100), -- WPA/WPA2/WPA2-Enterprise/WPS
prot_bluetooth              varchar2(100) -- Bluetooth v4.2 BR/EDR and BLE specification 
);

-- ======= Restricciones Tabla componentes_placas_esp32 ===========


-- PRIMARY KEY (LO SETEAMOS ACA PORQUE AGREGAMOS EL AUTOINCREMENT EN LA TABLA)
alter table componentes_placas_esp32
add constraint PK_componentes_placas_esp32
primary key(id);



-- UNIQUE ID_COMPONENTE 
alter table componentes_placas_esp32
add constraint UNIQUE_componentes_placas_esp32
unique (id_componente);


-- FK ID_COMPONENTE
alter table componentes_placas_esp32
add constraint CHECK_componentes_placas_esp32
foreign key(id_componente)
references componentes(id)
on delete cascade;



describe componentes_placas_esp32;


-- ---------------------------------------------------------------------------
