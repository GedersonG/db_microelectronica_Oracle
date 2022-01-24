/* -------------------------------
 * ------ MICROELECTRONCIA---------
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

-- ELIMINAMOS TODAS LAS SECUENCIAS AUTO INCREMENTABLES ID 
drop sequence id_seq_comp;
drop sequence id_seq_comp_det;
drop sequence id_seq_comp_trans_bip;
drop sequence id_seq_comp_trans_mosf;
drop sequence id_seq_comp_cap_elect;
drop sequence id_seq_comp_resis_alt_frec;


-- CREAMOS LAS SECUENCIAS AUTOINCREMENTABLES ID
create sequence id_seq_comp start with 1 increment by 1;
create sequence id_seq_comp_det start with 1 increment by 1;
create sequence id_seq_comp_trans_bip start with 1 increment by 1;
create sequence id_seq_comp_trans_mosf start with 1 increment by 1;
create sequence id_seq_comp_cap_elect start with 1 increment by 1;
create sequence id_seq_comp_resis_alt_frec start with 1 increment by 1;




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
references componentes(id);


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
references componentes(id);




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
references componentes(id);





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
references componentes(id);




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
tension_operativo     	      varchar2(50)    ---  100 V

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
references componentes(id);



-- ---------------------------------------------------------------------------


