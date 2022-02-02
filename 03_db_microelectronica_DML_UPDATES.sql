/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= DML UPDATES =============
 */
 
 -- JOINS Y UPDATES https://www.educba.com/oracle-update-with-join/
 
 
 
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- =====================================
-- ======= TABLA COMPONENTES ===========
-- =====================================

select * from componentes;

describe componentes;

-- Actualizamos los codigos segun el ID
update componentes set codigo = 'HDGHFK-KSH13006' where id = 1;
update componentes set nro_pieza = 'KSH13006' where id = 1;


select * from componentes;




-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==============================================
-- ======= TABLA COMPONENTES_DETALLES ===========
-- ==============================================

select * from componentes_detalles;

describe componentes_detalles;

-- Actualizamos los voltajes recomendados segun el valor anterior
update (select voltaje_recomendado 
from componentes_detalles inner join componentes 
on componentes_detalles.id_componente = componentes.id
where voltaje_recomendado = '25 VDC'
)set voltaje_recomendado = '20-25 VDC';


-- Actualizamos 2 Registros Voltajes Minimos y Maximos
update (select voltaje_recomendado, voltaje_min_entrada, voltaje_max_entrada
from componentes_detalles inner join componentes 
on componentes_detalles.id_componente = componentes.id
where voltaje_recomendado = '20-25 VDC'
)set voltaje_min_entrada = '20 VDC', voltaje_max_entrada = '25 VDC';


-- Actualizamos los Voltajes Recomendados, Minimos y Maximos del Transistor BJT 3CD010G
update (select voltaje_recomendado, voltaje_min_entrada, voltaje_max_entrada 
, componentes.nro_pieza, componentes.categoria 
from componentes_detalles inner join componentes 
on componentes_detalles.id_componente = componentes.id
where (componentes.nro_pieza = '3CD010G' and componentes.categoria = 'Transistores BJT')
)set voltaje_recomendado = '3.5-5 VDC', voltaje_min_entrada = '3.5 VDC', voltaje_max_entrada = '12 VDC';




select * from componentes;
select * from componentes_detalles;


