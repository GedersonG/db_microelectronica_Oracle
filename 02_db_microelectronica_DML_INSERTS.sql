/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= DML INSERTS=============
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
alter sequence id_seq_comp_cap_elect restart;
alter sequence id_seq_comp_resis_alt_frec restart;
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
 
 

 
 
 -- https://ar.mouser.com/c/ds/passive-components/capacitors/aluminum-electrolytic-capacitors/
 -- ============================ INSERTS CAPACITORES ELECTROLITICOS ===================================================
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('009-KLDIUAOASS','https://http2.mlstatic.com/D_NQ_NP_757161-MLA41722189255_052020-O.webp' 
 , 'KLDIUAOASS' , 'Capacitores Electroliticos' , 'Capacitor Electrolitico de Aluminio Radial' , 'VISHAY', 20 , 1);
 
  insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('3097-JKSJHSBS6DVBDG','https://http2.mlstatic.com/D_NQ_NP_2X_938147-MLA47364644565_092021-F.webp' 
 , 'BS6DVBDG' , 'Capacitores Electroliticos' , 'Capacitor Electrolitico de Aluminio Axial' , 'VISHAY', 18 , 1.6);
 
 
 
  
 
 -- ============================ INSERTS RESISTORES DE ALTA FRECUENCIA ===================================================
-- https://ar.mouser.com/ProductDetail/Vishay-Electro-Films/MIF2500BFKMGNHT5?qs=sGAEpiMZZMukHu%252BjC5l7YTdS15yq3RDAQ2ShXPLobqc%3D
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('594-MIF2500BFKMGNHT5' , 'https://ar.mouser.com/images/vishay/images/mif1000afkmgnht5_SPL.jpg' 
 , 'FKMGNHT5' , 'Resistores de Alta Frecuencia' , 'Resistores de alta frecuencia RF 25ohms 1% 100ppm' 
 , 'VISHAY' , 800 , 5);
 
 
 -- https://ar.mouser.com/ProductDetail/ATC-Kyocera-AVX/CS12010T0100GTR?qs=S4ILP0tmc7RtGe5NcuJBYQ%3D%3D
 insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('581-CS12010T0100GTR' , 'https://ar.mouser.com/images/americantechnicalceramics/images/ATCFT.jpg' 
 , 'T0100GTR' , 'Resistores de Alta Frecuencia' , 'Resistores de alta frecuencia RF 100ohms 2% 10W' 
 , 'KYSHOCERA' , 1200 , 3);
 
 
 
 
 
-- https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB

-- ======================= INSERTS MICROCONTROLADORES_RISC_PICS ========================================
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('HSFGDTTEE-KY0-PIC18F4520-I/PT' , 'https://www.kynix.com/uploadfiles/small/PIC18F4520-I2fPT_10386.jpg' 
 , 'KY0-PIC18F4520-I/PT' , 'Microcontroladores PICS' , 'Microcontrolador PIC18F4520-I/PT' , 'Microchip' , 40 , 20 );

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('HJDYETU-KY32-PIC-00130-001' , 'https://www.kynix.com/images/ic-package/SOP.jpg' 
 , 'KY32-PIC-00130-001' , 'Microcontroladores PICS' , 'Microcontrolador PIC-00130-001' , 'T-Wins' , 34 , 30 );
 
  

-- https://es.farnell.com/c/semiconductores-circuitos-integrados/microcontroladores-mcu/microcontroladores-mcu-de-8-bits?rango-de-producto=avr-atmega-family-atmega328-series-microcontrollers
-- https://www.digikey.com/es/products/detail/microchip-technology/ATMEGA32-16AUR/2357031

-- ======================= INSERTS MICROCONTROLADORES_RISC_AVRS ========================================

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('ATMEGA32-16AURTR-ND' , 'https://media.digikey.com/Renders/Atmel%20Renders/313;44A;A;44.jpg' 
 , '16AURTR-ND' , 'Microcontroladores AVRS' , 'Microcontrolador AVR ATMEGA32-16AUR' , 'Microchip Technology' , 10 , 30 );
 

insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('ATMEGA328P-MUR-JKSHJ67' , 'https://es.farnell.com/productimages/standard/en_GB/GE32QFN-40.jpg' 
 , 'MUR-JKSHJ67' , 'Microcontroladores AVRS' , 'Microcontrolador AVR ATMEGA328P-MUR' , 'Microchip Technology' , 15 , 25 );
 
    
 

-- ======================= INSERTS PLACAS_ARDUINOS ========================================
 
 -- https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('KSHJETA-ARDUINO-UNO' , 'https://http2.mlstatic.com/D_NQ_NP_2X_603035-MLA41509685506_042020-F.webp' 
 , 'ETA-ARDUINO-UNO' , 'Placas Arduino' , 'Placa Arduino Uno R3' , 'Arduino' , 30 , 10 );

 
 -- http://www.agspecinfo.com/pdfs/M/MB0016.PDF
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('JSHYUTT-ARDUINO-NANO' , 'https://http2.mlstatic.com/D_NQ_NP_2X_728208-MLA40243275480_122019-F.webp' 
 , 'UTT-ARDUINO-NANO' , 'Placas Arduino' , 'Placa Arduino Nano V3.0' , 'Arduino' , 40 , 8 );




-- ======================= INSERTS PLACAS_ESP8266 ========================================
 
 -- https://cdn-shop.adafruit.com/product-files/2471/0A-ESP8266__Datasheet__EN_v4.3.pdf
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('2471S0A-ESP8266' , 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/ESP-01.jpg/375px-ESP-01.jpg' 
 , '0A-ESP8266' , 'Placas Esp8266' , 'Placa Esp8266 EX' , 'Espressif Systems' , 10 , 10 );

 
 -- https://www.prometec.net/wemos-d1-esp8266-wifi/
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('JD76FG6-DOIT-WEMOS-Mini' , 'https://www.esploradores.com/wp-content/uploads/2017/01/DOIT-WEMOS-Mini-NodeMCU-768x641.jpg' 
 , 'DOIT-WEMOS-Mini' , 'Placas Esp8266' , 'Placa Wemos D1 Mini' , 'Wemos' , 12 , 8 );




-- ======================= INSERTS PLACAS_ESP32 ========================================
 
 -- https://pdf1.alldatasheet.com/datasheet-pdf/view/1148034/ESPRESSIF/ESP-WROOM-02U.html
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('HJSHKWROOM-ESP32' , 'https://ar.mouser.com/images/espressifsystems/lrg/ESP32-DevKitC-32UE_SPL.jpg' 
 , 'WROOM-ESP32' , 'Placas Esp32' , 'Placa Esp32 WROOM 32ue' , 'Espressif Systems' , 5 , 20 );


 -- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('H789DHJUi-ESP32' , 'https://tienda.ityt.com.ar/23642-large_default/modulo-wifi-bluetooth-esp32-esp-wroom-32-espressif-itytarg.jpg' 
 , 'DHJUi-ESP32i' , 'Placas Esp32' , 'Placa ESP32 WROOM' , 'Espressif Systems' , 5 , 15  );



 
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
, '45mm' , '25mm' , '0.23 g' , 'silicio' , '25 VDC' , '12 VDC', '40 VDC');

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(2 , 'https://alltransistors.com/adv/pdfdatasheet_inchange_semiconductor/3cd010g.pdf' 
, '39mm' , '22mm' , '0.19 g' , 'silicio' , '5 VDC' , '-24 VDC', '20 VDC');



-- ============================ INSERTS TRANSISTORES MOSFET ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(3 , 'https://alltransistors.com/es/mosfet/transistor.php?transistor=18313' 
, '56mm' , '38mm' , '0.45 g' , ' metal-óxido-silicio' , '35 VDC' , '20 VDC', '100 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(4 , 'https://alltransistors.com/adv/pdfdatasheet_slkor/sl60n06.pdf' 
, '64mm' , '31mm' , '0.67 g' , ' metal-óxido-silicio' , '40 VDC' , '5 VDC', '60 VDC');





 -- ============================ INSERTS CAPACITORES ELECTROLITICOS ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(5 , 'https://ar.mouser.com/datasheet/2/427/136rvi-2888792.pdf' , '71mm' , '21mm' , '0.97 g' , 'electrolito'
, '10 a 100 VDC' , '10 VDC' , '100 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(6 , 'https://ar.mouser.com/datasheet/2/212/1/KEM_A4095_PEG228-1919468.pdf' ,  '76mm' , '19mm' , '0.87 g' , 'electrolito'
, '25 a 64 VDC' , '10 VDC' , '100 VDC');




 -- ============================ INSERTS RESISTORES DE ALTA FRECUENCIA ===================================================
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(7 , 'https://www.vishay.com/docs/61038/mif.pdf' ,  '19mm' , '12mm' , '0.11 g' , 'Nitrito de Tantanio'
, '0 a 300 VDC' , '0 VDC' , '400 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(8 , 'https://ar.mouser.com/datasheet/2/40/resistive_prod_cs-1920496.pdf' , '17mm' , '9mm' , '0.08 g' , 'Nitrito de Tantanio'
, '0 a 300 VDC' , '0 VDC' , '400 VDC');




-- =================== INSERTS MICROCONTROLADORES_RISC_PICS ==========================
-- https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(9 , 'https://www.kynix.com/uploadfiles/pdf8798/PIC18F4520-I2fPT_10386.pdf' , '189mm' , '110mm' , '0.110 g' , 'Metal'
, '2 a 5.5 VDC' , '2.0 VDC' , '5.5 VDC');

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(10 , 'https://www.alldatasheet.com/view.jsp?Searchword=PIC-00130-001' ,  '192mm' , '190mm' , '0.130 g' , 'Metal'
, '4.5 a 17 VDC' , '4.5 VDC' , '17 VDC');




-- =================== INSERTS MICROCONTROLADORES_RISC_AVRS ==========================
-- https://es.farnell.com/microchip/atmega328p-mur/mcu-8bit-atmega-20mhz-mlf-32/dp/2425125

insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(11 , 'https://ww1.microchip.com/downloads/en/DeviceDoc/2503S.pdf' , '212mm' , '112mm' , '0.180 g' , 'Metal'
, '2.7 a 5.5 VDC' , '2.7 VDC' , '5.5 VDC');


insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(12 , 'https://www.farnell.com/datasheets/2047852.pdf' , '222mm' , '177mm' , '0.123 g' , 'Metal'
, '1.8 a 5.5 VDC' , '1.8 VDC' , '5.5 VDC');





-- =================== INSERTS PLACAS_ARDUINO ==========================

-- https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(13 , 'https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf' ,   '334mm' , '223mm' , '0.230 g' , 'Metal-Aluminio'
, '3.3 a 5.0 VDC' , '3.3 VDC' , '5.0 VDC');

 -- http://www.agspecinfo.com/pdfs/M/MB0016.PDF
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(14 , 'http://www.agspecinfo.com/pdfs/M/MB0016.PDF' ,  '324mm' , '224mm' , '0.213 g' , 'Metal-Aluminio'
, '3.0 a 3.3 VDC' , '3.0 VDC' , '3.3 VDC');


-- =================== INSERTS PLACAS_ESP8266 ==========================

 
  -- https://cdn-shop.adafruit.com/product-files/2471/0A-ESP8266__Datasheet__EN_v4.3.pdf
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(15 , 'https://cdn-shop.adafruit.com/product-files/2471/0A-ESP8266__Datasheet__EN_v4.3.pdf' 
, '182mm' , '115mm' , '0.330 g' , 'Aluminio' , '3.0 a 3.6 VDC' , '3.0 VDC' , '3.6 VDC');



-- https://www.prometec.net/wemos-d1-esp8266-wifi/
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(16 , 'https://www.esploradores.com/doitwemos-d1-mini-nodemcu/' , '199mm' , '176mm' , '0.220 g' , 'Aluminio'
, '3.3 a 5.0 VDC' , '3.3 VDC' , '5.0 VDC');


 
 
-- =================== INSERTS PLACAS_ESP32 ==========================


 -- https://pdf1.alldatasheet.com/datasheet-pdf/view/1148034/ESPRESSIF/ESP-WROOM-02U.html
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(17 , 'https://pdf1.alldatasheet.com/datasheet-pdf/view/1148034/ESPRESSIF/ESP-WROOM-02U.html' 
, '123mm' , '112mm' , '0.167 g' , 'Aluminio', '2.7 a 3.6 VDC' , '2.7 VDC' , '3.6 VDC');


-- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(18 , 'https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf' 
, '154mm' , '132mm' , '0.120 g' , 'Aluminio' , '2.7 a 3.6 VDC' , '2.7 VDC' , '3.6 VDC');




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


-- ===========================================================
-- ======= TABLA RESISTORES DE ALTA FRECUENCIA ===============
-- ===========================================================


select * from componentes;
select * from componentes_detalles;
select * from componentes_resistores_alta_frecuencia;

describe componentes_resistores_alta_frecuencia;

-- https://ar.mouser.com/ProductDetail/Vishay-Electro-Films/MIF2500BFKMGNHT5?qs=sGAEpiMZZMukHu%252BjC5l7YTdS15yq3RDAQ2ShXPLobqc%3D
insert into componentes_resistores_alta_frecuencia(id_componente, capacitancia ,rango_tolerancia
, rango_resis_gral , rango_resis_microondas , capacitancia_parasita , rango_temperatura , tension_operativa
)values( 7 , '-' , ' +- 1, +- 5, +- 10, +- 20 standard' , '20 to 100' , '+- 100' , '-' , ' - 55 to + 125' , '100 max.');

 
 -- https://ar.mouser.com/ProductDetail/ATC-Kyocera-AVX/CS12010T0100GTR?qs=S4ILP0tmc7RtGe5NcuJBYQ%3D%3D
insert into componentes_resistores_alta_frecuencia(id_componente, capacitancia ,rango_tolerancia
, rango_resis_gral , rango_resis_microondas , capacitancia_parasita , rango_temperatura , tension_operativa
)values( 8 , '4' , ' +- 40 standard' , '15 to 90' , '+- 120' , '-' , ' -' , '120 max.');



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ================================================================
-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_PICS =========
-- ================================================================



describe componentes_microcontroladores_risc_pics;

select * from componentes;

-- Página Hoja de datos pics : https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB
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






-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- https://es.farnell.com/microchip/atmega328p-mur/mcu-8bit-atmega-20mhz-mlf-32/dp/2425125

-- ================================================================
-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_AVRS =========
-- ================================================================


describe componentes_microcontroladores_risc_avrs;

select * from componentes;

-- https://ww1.microchip.com/downloads/en/DeviceDoc/2503S.pdf
insert into componentes_microcontroladores_risc_avrs(id_componente , frec_operacion
, tam_nucleo, tam_memoria_programa , tipo_memoria , cantidad_entr_sal
,comunic_protocolos , temp_funcionamiento ) values 
(11 ,'16MHz' , '8 bits' , '32KB (16K x 16)' , 'Memoria Flash' , 32 
, 'I²C, SPI, UART/USART' , '-40°C ~ 85°C (TA)');

-- https://www.farnell.com/datasheets/2047852.pdf
insert into componentes_microcontroladores_risc_avrs(id_componente , frec_operacion
, tam_nucleo, tam_memoria_programa , tipo_memoria , cantidad_entr_sal
,comunic_protocolos , temp_funcionamiento ) values 
(12 ,'20 MHz' , '8 bits' , '32KB ' , 'Memoria Flash' , 23 
, 'I2C, SPI, USART' , '-40°C to 85°C');


select * from componentes_microcontroladores_risc_avrs;


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==================================================
-- ======= TABLA COMPONENTES_PLACAS_ARDUINO =========
-- ==================================================


describe componentes_placas_arduinos;

select * from componentes;


 -- https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf

insert into componentes_placas_arduinos(id_componente , procesador
, frec_mem , tam_flash , tam_sram , tam_eeprom , cantidad_entr_sal 
, comunic_protocolos ) values 
(13 ,'ATMega 16U2 ' , '16 MHz' , '32KB Flash' , '2 KB' , '1 KB' 
, 23 , 'I²C, SPI, UART/USART');


 -- http://www.agspecinfo.com/pdfs/M/MB0016.PDF 
insert into componentes_placas_arduinos(id_componente , procesador
, frec_mem , tam_flash , tam_sram , tam_eeprom , cantidad_entr_sal 
, comunic_protocolos ) values 
(14 ,'ATmega328p' , '16 MHz' , '32KB Flash' , '2 KB' , '1 KB' 
, 14 , 'I²C, SPI, UART/USART');



select * from componentes_placas_arduinos;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==================================================
-- ======= TABLA COMPONENTES_PLACAS_ESP8266 =========
-- ==================================================


describe componentes_placas_esp8266;

select * from componentes;



-- https://cdn-shop.adafruit.com/product-files/2471/0A-ESP8266__Datasheet__EN_v4.3.pdf
insert into componentes_placas_esp8266(id_componente , procesador
, frec_mem , tam_flash , tam_sram , cantidad_entr_sal , comunic_protocolos
, prot_wifi, rango_frec ) values 
(15 ,'CPU RISC de 32-bit: Tensilica Xtensa LX106 ' , '80 MHz' , '512 KB a 4 MB' , '64 KB'  
, 16 , 'UART/SDIO/SPI/I2C/I2S/IR Remote Control' ,'802.11 b/g/n' , '2.4G-2.5G (2400M-2483.5M)');


-- https://www.prometec.net/wemos-d1-esp8266-wifi/
insert into componentes_placas_esp8266(id_componente , procesador
, frec_mem , tam_flash , tam_sram , cantidad_entr_sal , comunic_protocolos
, prot_wifi, rango_frec ) values 
(16 ,'CPU RISC de 32-bit: Tensilica Xtensa LX1012 ' , '80 MHz' , '200 KB a 2 MB' , '45 KB'  
, 9 , 'UART/SDIO/SPI/I2C' , '802.11 b/g/n' , '2.4G-2.5G (2400M-2483.5M)');





select * from componentes_placas_esp8266;







-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==================================================
-- ======= TABLA COMPONENTES_PLACAS_ESP32 =========
-- ==================================================


describe componentes_placas_esp32;

select * from componentes;



 -- https://pdf1.alldatasheet.com/datasheet-pdf/view/1148034/ESPRESSIF/ESP-WROOM-02U.html
insert into componentes_placas_esp32(id_componente , procesador
, frec_mem , tam_flash , tam_sram  , comunic_protocolos
, prot_wifi, rango_frec, modo_wifi , seg_wifi , prot_bluetooth) values 
(17 ,' ARM Xtensa 32-bit' , '-' , '-' , '-'  
 , 'UART/HSPI/I2C/I2S/IR Remote Control' ,'802.11 b/g/n'
 , '(2400M ~ 2483.5M) ' , 'Station/SoftAP/SoftAP + Station' , 'WPA/WPA2'
 , 'Bluetooth v4.2 BR/EDR and BLE specification');


-- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
insert into componentes_placas_esp32(id_componente , procesador
, frec_mem , tam_flash , tam_sram  , comunic_protocolos
, prot_wifi, rango_frec, modo_wifi , seg_wifi , prot_bluetooth) values 
(18 ,'ARM Xtensa single-/dual-core 32-bit LX6' , '-' , '-' , '-'  
 , 'UART/SDIO/SPI/I2C/I2S/IR Remote Control' ,'802.11 b/g/n (802.11n up to 150 Mbps)'
 , '2.4G-2.5G ' , 'Station/SoftAP/SoftAP+Station/P2P' , 'WPA/WPA2/WPA2-Enterprise/WPS'
 , 'Bluetooth v4.2 BR/EDR and BLE specification');



select * from componentes_placas_esp32;


