/* -------------------------------
 * ------ MICROELECTRONCIA---------
 * --------------------------------
 * 
 * 
 * ========= DML =============
 */
 
 
 -- ELIMINAMOS LOS REGISTROS 
delete from  componentes cascade ;
delete from componentes_detalles cascade;
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



-- ============================ INSERTS TRANSISTORES BJT ===================================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
('KSH13005' , 'https://images.alldatasheet.es/semiconductor/electronic_parts/datasheet/335783/HUASHAN/KSH13005.GIF' 
,'KSH13005' , 'Transistor' , 'Transistor BJT NPN', 'SHANTOU HUASHAN', 300, 2.0
);

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
('3CD010G' , 'https://http2.mlstatic.com/D_NQ_NP_906581-MLA32747237952_112019-O.webp' 
,'3CD010G' , 'Transistor' , 'Transistor BJT PNP', 'INCHANGE SEMICONDUCTOR', 400, 5.0
);



-- ============================ INSERTS TRANSISTORES MOSFET ===================================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('AP4519GED' , 'https://alltransistors.com/adv/pdfdatasheet_ape/image/ap4511gh-hf_0001.jpg'
 ,'AP4519GED' , 'Transistor' , 'Transistor Mosfet NP' , 'Advanced Power' , 200 ,4.0
 );
 
 
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('SL60N06' , 'https://http2.mlstatic.com/D_NQ_NP_2X_893006-MLA41523372205_042020-F.webp'
 ,'SL60N06' , 'Transistor' , 'Transistor Mosfet N' , 'Slkor' , 50 , 7.0
 );
 
 
 select * from componentes;



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==============================================
-- ======= TABLA COMPONENTES_DETALLES ===========
-- ==============================================

select * from componentes_detalles;

describe componentes_detalles;

-- https://alltransistors.com/es/transistor.php?transistor=69829
-- datasheet http://www.datasheet.es/PDF/688909/KSH13005-pdf.html

-- ============================ INSERTS TRANSISTORES BJT ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(1 , 'https://www.alldatasheet.com/datasheet-pdf/pdf/335783/HUASHAN/KSH13005.html?gclid=CjwKCAiAlrSPBhBaEiwAuLSDUFeS6YrIZoRclGdfPAGVxkvXDpENZQ76uvZ1PCot50KcnlLYfYgNwBoCdwoQAvD_BwE' 
, null , null , null , null , '25v' , '12v', '40v');

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(2 , 'https://alltransistors.com/adv/pdfdatasheet_inchange_semiconductor/3cd010g.pdf' 
, null , null , null , null , '5v' , '-24v', '20v');



-- ============================ INSERTS TRANSISTORES MOSFET ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(3 , 'https://alltransistors.com/es/mosfet/transistor.php?transistor=18313' 
, null , null , null , null , '35v' , '20v', '100v');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(4 , 'https://alltransistors.com/adv/pdfdatasheet_slkor/sl60n06.pdf' 
, null , null , null , null , '40v' , '5v', '60v');




select * from componentes_detalles;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ============================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_BIPOLARES ===========
-- ============================================================

select * from componentes_transistores_bipolares;

describe componentes_transistores_bipolares;

-- https://alltransistors.com/es/transistor.php?transistor=69829
-- datasheet http://www.datasheet.es/PDF/688909/KSH13005-pdf.html


insert into componentes_transistores_bipolares(id_componente , tipo , voltaje_colec_emis
, voltaje_colec_base , voltaje_emis_base , voltaje_colec_emis_sat , corriente_colec 
, ganancia_hfe , disip_max , temp_juntura )values
(1 , 'NPN' , '5v' , '0.5 v' , '0.2v' , '1.2 v' , '0.75 A' , '200' ,'75w' , '150°C');

insert into componentes_transistores_bipolares(id_componente , tipo , voltaje_colec_emis
, voltaje_colec_base , voltaje_emis_base , voltaje_colec_emis_sat , corriente_colec 
, ganancia_hfe , disip_max , temp_juntura)values
(2 , 'PNP' , '-200v' , '-200v' , '-5V' , '-1v' , '1.5 A' , '15'  ,'10w' , '175°C' );




select * from componentes_transistores_bipolares;


