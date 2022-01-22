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




-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- =====================================
-- ======= TABLA COMPONENTES ===========
-- =====================================

select * from componentes;

describe componentes;

-- https://alltransistors.com/es/transistor.php?transistor=69829
-- datasheet http://www.datasheet.es/PDF/688909/KSH13005-pdf.html


insert into componentes(codigo , imagen , nro_pieza , categoria , descripcion , fabricante , stock , precio)
values('LLKSH13005' , 'https://images.alldatasheet.es/semiconductor/electronic_parts/datasheet/335783/HUASHAN/KSH13005.GIF' 
,'KSH13005' , 'Transistor' , 'Transistor BJT NPN', 'SHANTOU HUASHAN', 300, 2);


select * from componentes;



