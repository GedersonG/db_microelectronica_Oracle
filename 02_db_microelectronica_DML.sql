/* -------------------------------
 * ------ MICROELECTRONCIA---------
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

-- REESTABLECEMOS LAS SECUENCIAS
alter sequence id_seq_comp restart;
alter sequence id_seq_comp_det restart;
alter sequence id_seq_comp_trans_bip restart;





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
('KSH13005' , 'https://images.alldatasheet.es/semiconductor/electronic_parts/datasheet/335783/HUASHAN/KSH13005.GIF' 
,'KSH13005' , 'Transistor' , 'Transistor BJT NPN', 'SHANTOU HUASHAN', 300, 2.0
);

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
('3CD010G' , 'https://http2.mlstatic.com/D_NQ_NP_906581-MLA32747237952_112019-O.webp' 
,'3CD010G' , 'Transistor' , 'Transistor BJT PNP', 'INCHANGE SEMICONDUCTOR', 400, 5.0
);


-- -- https://alltransistors.com/es/mosfet/transistor.php?transistor=18313
-- ============================ INSERTS TRANSISTORES MOSFET ===================================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('AP4519GED' , 'https://alltransistors.com/adv/pdfdatasheet_ape/image/ap4511gh-hf_0001.jpg'
 ,'AP4519GED' , 'Transistor' , 'Transistor Mosfet NP' , 'Advanced Power' , 200 ,4.0
 );
 
 
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('SL60N06' , 'https://http2.mlstatic.com/D_NQ_NP_2X_893006-MLA41523372205_042020-F.webp'
 ,'SL60N06' , 'Transistor' , 'Transistor Mosfet N' , 'Slkor' , 50 , 7.0
 );
 
 
 
 -- https://ar.mouser.com/c/ds/passive-components/capacitors/aluminum-electrolytic-capacitors/
 -- ============================ INSERTS CAPACITORES ELECTROLITICOS ===================================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('136RVI' , 'https://cdn.sos.sk/productdata/e2/ed/548f2ccf/136-rvi-470uf-16v-105degc-mal213665471e3.jpg' 
 , '136RVI' , 'Capacitor' , 'Capacitor Electrolitico Plomo Radial de Aluminio' , 'VISHAY' , 300 , 2);
 
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('PEG228' , 'https://www.mouser.com/images/marketingid/2014/img/103855608.png?v=010721.0953' 
 , 'PEG228' , 'Capacitor' , 'Capacitor Electrolitico Plomo Axial de Aluminio' , 'KEMET' , 400 , 3);
 
 
 
 
 
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
