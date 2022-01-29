/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= DML =============
 */
 
 
 -- ELIMINAMOS LOS REGISTROS 
delete from  componentes cascade ;
delete from  componentes_detalles cascade;
delete from  componentes_transistores_bipolares cascade;
delete from  componentes_transistores_mosfet cascade;
delete from  componentes_capacitores_electroliticos cascade;
delete from  componentes_resistores_alta_frecuencia cascade;

delete from componentes_microcontroladores_risc_pics cascade ;
delete from componentes_microcontroladores_risc_avrs cascade ;
delete from componentes_placas_arduinos cascade;
delete from componentes_placas_esp8266 cascade;
delete from componentes_placas_esp32 cascade;


-- REESTABLECEMOS LAS SECUENCIAS
alter sequence id_seq_comp restart;
alter sequence id_seq_comp_det restart;
alter sequence id_seq_comp_trans_bip restart;

alter sequence id_seq_comp_micr_risc_pics restart;
alter sequence id_seq_comp_micr_risc_avrs restart;
alter sequence id_seq_comp_plac_arduinos restart;
alter sequence id_seq_comp_plac_esp8266 restart;
alter sequence id_seq_comp_plac_esp32 restart;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- =====================================
-- ======= TABLA COMPONENTES ===========
-- =====================================

select * from componentes;

describe componentes;

-- TRANSISTORES BIPOLARES
-- https://alltransistors.com/es/transistor.php?transistor=69829
-- datasheet http://www.datasheet.es/PDF/688909/KSH13005-pdf.html


--TRANSISTORES MOSFET
-- https://alltransistors.com/es/mosfet/transistor.php?transistor=18313


-- APLICAMOS INSERCIONES DE 1 REGISTRO YA QUE LAS INSERCIONES MASIVAS NO SON COMPATIBLES CON SECUENCIAS





--- https://alltransistors.com/es/transistor.php?transistor=69829
-- ============================ INSERTS TRANSISTORES BJT ===================================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
('HDGHFK-KSH13005' , 'https://images.alldatasheet.es/semiconductor/electronic_parts/datasheet/335783/HUASHAN/KSH13005.GIF' 
,'KSH13005' , 'Transistores BJT' , 'Transistor BJT NPN', 'SHANTOU HUASHAN', 300, 2.0
);

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
('DFHSDK-3CD010G' , 'https://http2.mlstatic.com/D_NQ_NP_906581-MLA32747237952_112019-O.webp' 
,'3CD010G' , 'Transistores BJT' , 'Transistor BJT PNP', 'INCHANGE SEMICONDUCTOR', 400, 5.0
);


-- -- https://alltransistors.com/es/mosfet/transistor.php?transistor=18313
-- ============================ INSERTS TRANSISTORES MOSFET ===================================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('JDHFYT-AP4519GED' , 'https://alltransistors.com/adv/pdfdatasheet_ape/image/ap4511gh-hf_0001.jpg'
 ,'AP4519GED' , 'Transistores MOSFET' , 'Transistor Mosfet NP' , 'Advanced Power' , 200 ,4.0
 );
 
 
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('HJDGHF-SL60N06' , 'https://http2.mlstatic.com/D_NQ_NP_2X_893006-MLA41523372205_042020-F.webp'
 ,'SL60N06' , 'Transistores MOSFET' , 'Transistor Mosfet N' , 'Slkor' , 50 , 7.0
 );
 
 
 
 
 -- ============================ INSERTS RESISTORES DE ALTA FRECUENCIA ===================================================
-- https://ar.mouser.com/ProductDetail/Vishay-Electro-Films/MIF2500BFKMGNHT5?qs=sGAEpiMZZMukHu%252BjC5l7YTdS15yq3RDAQ2ShXPLobqc%3D
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('594-MIF2500BFKMGNHT5' , 'https://ar.mouser.com/images/vishay/images/mif1000afkmgnht5_SPL.jpg' 
 , 'FKMGNHT5' , 'Resistores de Alta Frecuencia' , 'Resistores de alta frecuencia RF 25ohms 1% 100ppm' , 'VISHAY' , 800 , 5);
 
 -- https://ar.mouser.com/ProductDetail/ATC-Kyocera-AVX/CS12010T0100GTR?qs=S4ILP0tmc7RtGe5NcuJBYQ%3D%3D
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('581-CS12010T0100GTR' , 'https://ar.mouser.com/images/americantechnicalceramics/images/ATCFT.jpg' 
 , 'T0100GTR' , 'Resistores de Alta Frecuencia' , 'Resistores de alta frecuencia RF 100ohms 2% 10W' , 'KYSHOCERA' , 1200 , 3);
 
 
 
 
 -- https://ar.mouser.com/c/ds/passive-components/capacitors/aluminum-electrolytic-capacitors/
 -- ============================ INSERTS CAPACITORES ELECTROLITICOS ===================================================
 
 
-- https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB

-- ======= INSERTS MICROCONTROLADORES_RISC_PICS ===========
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('HSFGDTTEE-KY0-PIC18F4520-I/PT' , 'https://www.kynix.com/uploadfiles/small/PIC18F4520-I2fPT_10386.jpg' 
 , 'KY0-PIC18F4520-I/PT' , 'Microcontroladores' , 'Microcontrolador PIC18F4520-I/PT' , 'Microchip' , 40 , 20 );

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('HJDYETU-KY32-PIC-00130-001' , 'https://www.kynix.com/images/ic-package/SOP.jpg' 
 , 'KY32-PIC-00130-001' , 'Microcontroladores' , 'Microcontrolador PIC-00130-001' , 'T-Wins' , 34 , 30 );
 
  
 
 
 
 select * from componentes;



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==============================================
-- ======= TABLA COMPONENTES_DETALLES ===========
-- ==============================================

select * from componentes_detalles;

describe componentes_detalles;


-- ============================ INSERTS TRANSISTORES BJT ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(1 , 'https://www.alldatasheet.com/datasheet-pdf/pdf/335783/HUASHAN/KSH13005.html?gclid=CjwKCAiAlrSPBhBaEiwAuLSDUFeS6YrIZoRclGdfPAGVxkvXDpENZQ76uvZ1PCot50KcnlLYfYgNwBoCdwoQAvD_BwE' 
, null , null , null , null , '25 VDC' , '12 VDC', '40 VDC');

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(2 , 'https://alltransistors.com/adv/pdfdatasheet_inchange_semiconductor/3cd010g.pdf' 
, null , null , null , null , '5 VDC' , '-24 VDC', '20 VDC');



-- ============================ INSERTS TRANSISTORES MOSFET ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(3 , 'https://alltransistors.com/es/mosfet/transistor.php?transistor=18313' 
, null , null , null , null , '35 VDC' , '20 VDC', '100 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(4 , 'https://alltransistors.com/adv/pdfdatasheet_slkor/sl60n06.pdf' 
, null , null , null , null , '40 VDC' , '5 VDC', '60 VDC');


 -- ============================ INSERTS CAPACITORES ELECTROLITICOS ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(5 , 'https://ar.mouser.com/datasheet/2/427/136rvi-2888792.pdf' , null, null , null, null
, '10 a 100 VDC' , '10 VDC' , '100 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(6 , 'https://ar.mouser.com/datasheet/2/212/1/KEM_A4095_PEG228-1919468.pdf' , null, null , null, null
, '25 a 64 VDC' , '10 VDC' , '100 VDC');




 -- ============================ INSERTS RESISTORES DE ALTA FRECUENCIA ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(7 , 'https://www.vishay.com/docs/61038/mif.pdf' , null, null , null, null
, '0 a 300 VDC' , '0 VDC' , '400 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(8 , 'https://ar.mouser.com/datasheet/2/40/resistive_prod_cs-1920496.pdf' , null, null , null, null
, '0 a 300 VDC' , '0 VDC' , '400 VDC');




-- ======= INSERTS MICROCONTROLADORES_RISC_PICS ===========
-- https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(9 , 'https://www.kynix.com/uploadfiles/pdf8798/PIC18F4520-I2fPT_10386.pdf' , null, null , null, null
, '2 a 5.5 VDC' , '2.0 VDC' , '5.5 VDC');

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(10 , 'https://www.alldatasheet.com/view.jsp?Searchword=PIC-00130-001' , null, null , null, null
, '4.5 a 17 VDC' , '4.5 VDC' , '17 VDC');





select * from componentes_detalles;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ============================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_BIPOLARES ===========
-- ============================================================

select * from componentes_transistores_bipolares;

describe componentes_transistores_bipolares;


insert into componentes_transistores_bipolares(id_componente , tipo , voltaje_colec_emis
, voltaje_colec_base , voltaje_emis_base , voltaje_colec_emis_sat , corriente_colec 
, ganancia_hfe , disip_max , temp_juntura )values
(1 , 'NPN' , '5 VDC' , '0.5 VDC' , '0.2 VDC' , '1.2 VDC' , '0.75 A' , '200' ,'75 W' , '150°C');

insert into componentes_transistores_bipolares(id_componente , tipo , voltaje_colec_emis
, voltaje_colec_base , voltaje_emis_base , voltaje_colec_emis_sat , corriente_colec 
, ganancia_hfe , disip_max , temp_juntura)values
(2 , 'PNP' , '-200 VDC' , '-200 VDC' , '-5 VDC' , '-1 VDC' , '1.5 A' , '15'  ,'10 W' , '175°C' );




select * from componentes_transistores_bipolares;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- =========================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_MOSFET ===========
-- =========================================================

select * from componentes_transistores_mosfet;
select * from componentes;

describe componentes_transistores_mosfet;



insert into componentes_transistores_mosfet(id_componente , tipo , voltaje_drenaje_fuente
, corriente_cc_drenaje , disip_max, temp_op_max , conduct_drenaje_sustrato
, resist_drenaje_fuente)values
(3 , 'pMOS' , '35 VDC' , '6.2 A' , '30W' , '150°C' , ' 90(115) pF' , '0.032(0.064) Ohm');

insert into componentes_transistores_mosfet(id_componente , tipo , voltaje_drenaje_fuente
, corriente_cc_drenaje , disip_max, temp_op_max , conduct_drenaje_sustrato
, resist_drenaje_fuente)values
(4 , 'nMOS' , '100 VDC' , '20A' , '50W' , '240°C' , '-' , '-' );




select * from componentes_transistores_mosfet;



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ================================================================
-- ======= TABLA COMPONENTES_CAPACITORES_ELECTROLITICOS ===========
-- ================================================================

select * from componentes_capacitores_electroliticos;
select * from componentes;

describe componentes_capacitores_electroliticos;



insert into componentes_capacitores_electroliticos(id_componente , tipo , capacitancia
, tolerancia , rango_temperatura , rango_tension_nominal)values
(5 , 'Plomo Radial' , '22 ?F a 10 000 ?F' , '± 20 %' , '-55 °C a +105 °C' , '10 V to 100 V'); 

insert into componentes_capacitores_electroliticos(id_componente , tipo , capacitancia
, tolerancia , rango_temperatura , rango_tension_nominal)values
(6 , 'Plomo Axial' , '520 – 7,000 µF' , '–10/+30%' , '–40 to +150°C' , '25 – 63 VDC');




select * from componentes_capacitores_electroliticos;







-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------

-- Página Hoja de datos pics : https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB

-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_PICS ===========



describe componentes_microcontroladores_risc_pics;

select * from componentes;

insert into componentes_microcontroladores_risc_pics(id_componente , frec_operacion
, memoria_programa , memoria_datos , memoria_datos_eeprom , cantidad_fuentes_interrup
, cantidad_timers ,  comunic_seriales , set_instrucciones ) values 
(9 ,'DC-40 Mhz' , '16384 bytes' , '768 bytes' , '256 bytes' , 19 , 4 , 'MSSP, Enhanced USART'
, '75 Instructions; 83 with Extended Instruction Set Enabled');



insert into componentes_microcontroladores_risc_pics(id_componente , frec_operacion
, memoria_programa , memoria_datos , memoria_datos_eeprom , cantidad_fuentes_interrup
, cantidad_timers ,  comunic_seriales , set_instrucciones ) values 
(10 ,'-' , '-' , '-' , '-' , 19 , 4 , ' Enhanced USART'
, '75 Instructions; 83 with Extended Instruction Set Enabled');


select * from componentes_microcontroladores_risc_pics;

