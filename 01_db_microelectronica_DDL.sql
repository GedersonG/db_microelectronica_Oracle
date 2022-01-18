/* -------------------------------
 * ------ MICROELECTRONCIA---------
 * --------------------------------
 * 
 * 
 * ========= DDL =============
 */

drop table componentes;
drop table componentes_detalles;
drop table componentes_transistores_bipolares;


create table componentes(
	
id char(2000) primary key ,
codigo varchar2(100) not null, -- ej: mh-r-447y8
imagen varchar2(1000), -- link de la imagen
categoria varchar2(50) not null, -- ej: sensor, circuito integrado, transistor,etc
nombre varchar2(100) not null, -- ej: Sensor de Agua MH 
modelo varchar2(100) not null, -- ej: MH
marca varchar2(50) not null, -- ej: Generico
stock char(200) not null, -- ej: 100, 200, etc
precio  number(8,2) not null -- ej: 5.55 dolares 

);


-- ======= Restricciones Tabla componentes ===========



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
	
id 							char(2000) primary key,
id_componente 				char(2000)       not null,
hoja_de_datos				varchar2(700)	 not null, --link datasheet
longitud					number(8,2)	 not null,-- 69.0 mm
ancho						number(8,2) 	 not null,-- 56.7 mm
peso						number(8,2) 	 not null,-- 19.4 gramos
material					varchar2(50)	 	 not null,-- silicio,acero, plastico, etc
voltaje_recomendado			number(8,2)	 not null, -- 5 voltios
voltaje_min_entrada			number(8,2)	 not null,-- 7  voltios (recomendado)
voltaje_max_entrada			number(8,2)	 not null-- 12  voltios (recomendado)

);

-- ======= Restricciones Tabla componentes_detalles ===========

-- FK ID_COMPONENTE
alter table componentes_detalles 
add constraint FK_componentes_detalles_id_componente
foreign key(id_componente)
references componentes(id);


-- CHECK VOLTAJE_RECOMENDADO
alter table componentes_detalles
add constraint CHECK_componentes_detalles_voltaje_recomendado
check (voltaje_recomendado > 0 and voltaje_recomendado <= 220);


-- CHECK VOLTAJE_MIN_ENTRADA
alter table componentes_detalles
add constraint CHECK_componentes_detalles_voltaje_min_entrada
check ( (voltaje_min_entrada > 0 and voltaje_min_entrada <= 220) and (voltaje_min_entrada < voltaje_max_entrada));


-- CHECK VOLTAJE_MAX_ENTRADA
alter table componentes_detalles
add constraint CHECK_componentes_detalles_voltaje_max_entrada
check (( voltaje_max_entrada > 0 and voltaje_max_entrada <= 220) and (voltaje_max_entrada > voltaje_min_entrada));


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- ======= TABLA COMPONENTES_TRANSISTORES_BIPOLARES ===========

create table componentes_transistores_bipolares(
	
id 							char(2000) primary key,
id_componente 				char(2000) not null,
tipo						varchar2(100) 	not null, -- NPN, PNP
--Desempeño
voltaje_colec_emis_corte    number(8,2)    not null, ---30V, 5.5V
voltaje_colec_emis_sat    	number(8,2)    not null, ---30V, 5.5V
voltaje_emis_base_corte   number(8,2)    not null, ---30V, 5.5V
--Caract. Térmicas			
disip_max					number(8,2)    not null, ---0.645W
temp_juntura				varchar2(50)    not null, ----55a+155 °C
--Caract. Eléctricas
voltaje_ruptura_colec_emis	number(8,2)    not null, ---30 V 
voltaje_ruptura_colec_base	number(8,2)    not null, ---30 V
voltaje_ruptura_emis_base	number(8,2)    not null ---30 V
);

-- ======= Restricciones Tabla componentes_transistores_bipolares ===========



-- FK ID_COMPONENTE
alter table componentes_transistores_bipolares 
add constraint FK_componentes_transistores_bipolares_id_componente
foreign key(id_componente)
references componentes(id);


-- CHECK VOLTAJE_COLEC_EMIS_CORTE 
alter table componentes_transistores_bipolares 
add constraint CHECK_componentes_transistores_bipolares_voltaje_colec_emis_corte
check ((voltaje_colec_emis_corte > 0) and (voltaje_colec_emis_corte <= 220));


-- CHECK VOLTAJE_EMIS_BASE_CORTE 
alter table componentes_transistores_bipolares 
add constraint CHECK_componentes_transistores_bipolares_voltaje_emis_base_corte 
check ((voltaje_emis_base_corte  > 0) and (voltaje_emis_base_corte  <= 220));



-- ---------------------------------------------------------------------------


