/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= DML DELETES =============
 */
 
 -- https://www.techonthenet.com/oracle/delete.php
 
 
 
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


select * from componentes;
select * from componentes_detalles;


describe componentes;

-- Eliminamos un componente según su ID
--Tenemos configurado el delete cascade en el DDL, se borran todos los registros que tengan una FK
delete from componentes where id = 30;



-- ===================================
-- ======= TABLA COMPONENTES =========
-- ===================================

-- Insertamos un nuevo componente (mismas caracteristicas que el eliminado)

 -- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio) values
 ('H789DHJUi-ESP32' , 'https://raw.githubusercontent.com/andresWeitzel/db_microelectronica_Oracle/master/files/placasEsp32/01_Placa%20Esp32%20WROOM%2032ue.webp' 
 , 'DHJUi-ESP32i' , 'Placas Esp32' , 'Placa ESP32 WROOM' , 'Espressif Systems' , 5 , 15  );



-- ============================================
-- ======= TABLA COMPONENTES_DETALLES =========
-- ============================================

-- insertamos el detalle del componente

 -- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
insert into componentes_detalles(id_componente , hoja_de_datos , longitud , ancho 
, peso ,material, voltaje_recomendado , voltaje_min_entrada , voltaje_max_entrada)values
(31 , 'https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf' , null, null , null, null
, '2.7 a 3.6 VDC' , '2.7 VDC' , '3.6 VDC');


-- ================================================
-- ======= TABLA COMPONENTES_PLACAS_ESP32 =========
-- ================================================

-- https://www.mouser.com/datasheet/2/891/esp-wroom-32_datasheet_en-1223836.pdf
insert into componentes_placas_esp32(id_componente , procesador
, frec_mem , tam_flash , tam_sram  , comunic_protocolos
, prot_wifi, rango_frec, modo_wifi , seg_wifi , prot_bluetooth) values 
(31 ,'ARM Xtensa single-/dual-core 32-bit LX6' , '-' , '-' , '-'  
 , 'UART/SDIO/SPI/I2C/I2S/IR Remote Control' ,'802.11 b/g/n (802.11n up to 150 Mbps)'
 , '2.4G-2.5G ' , 'Station/SoftAP/SoftAP+Station/P2P' , 'WPA/WPA2/WPA2-Enterprise/WPS'
 , 'Bluetooth v4.2 BR/EDR and BLE specification');




select * from componentes;
select * from componentes_detalles;
select * from componentes_placas_esp32;



