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



-- Reemplazamos el caracter 'a' por el  '-' del campo VOLTAJE_RECOMENDADO
update (select voltaje_recomendado, voltaje_min_entrada, voltaje_max_entrada 
, componentes.nro_pieza, componentes.categoria 
from componentes_detalles inner join componentes 
on componentes_detalles.id_componente = componentes.id
where (componentes.nro_pieza = '3CD010G' and componentes.categoria = 'Transistores BJT')
)set voltaje_recomendado = '3.5-5 VDC', voltaje_min_entrada = '3.5 VDC', voltaje_max_entrada = '12 VDC';




update componentes_detalles set voltaje_recomendado = replace(voltaje_recomendado, 'a' , '-');



select * from componentes;
select * from componentes_detalles;




-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===========================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_BIPOLARES===========
-- ===========================================================

select * from componentes;
select * from componentes_detalles;
select * from componentes_transistores_bipolares;

describe componentes_transistores_bipolares;


-- Cambiamos el voltaje de colector emisor, voltaje colector base y voltaje emisor base segun el nro de pieza 
-- y la descripcion determinado en la tabla componentes y el voltaje en componentes_detalles
update (select voltaje_colec_emis, voltaje_colec_base , voltaje_emis_base
, componentes.nro_pieza, componentes.descripcion
, componentes_detalles.voltaje_recomendado
from componentes_transistores_bipolares 
inner join componentes on  componentes.id = componentes_transistores_bipolares.id_componente
inner join componentes_detalles on componentes_detalles.id_componente = componentes_transistores_bipolares.id_componente 
where (componentes.nro_pieza = '3CD010G' and componentes.descripcion = 'Transistor BJT PNP' 
and componentes_detalles.voltaje_recomendado = '3.5-5 VDC')
)set voltaje_colec_emis = '5.5 VDC', voltaje_colec_base = '5.5 VDC', voltaje_emis_base ='-5.5 VDC' ;


-- Cambiamos la Temperatura de Juntura según el nro de pieza

update (select temp_juntura
, componentes.nro_pieza
from componentes_transistores_bipolares
inner join componentes on componentes.id = componentes_transistores_bipolares.id_componente
where (componentes.nro_pieza = 'KSH13006')
)set temp_juntura = '160°C';


select * from componentes_transistores_bipolares;






-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===========================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_MOSFET===========
-- ===========================================================

select * from componentes;
select * from componentes_detalles;
select * from componentes_transistores_mosfet;

describe componentes_transistores_mosfet;


-- Nuleeamos campos sin descripcion
update componentes_transistores_mosfet set conduct_drenaje_sustrato = null 
where conduct_drenaje_sustrato = '-';

update componentes_transistores_mosfet set resist_drenaje_fuente = null 
where resist_drenaje_fuente = '-';


-- Pasamos cadenas a Mayuscula
update componentes_transistores_mosfet set tipo = upper(tipo);


select * from componentes_transistores_mosfet;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===========================================================
-- ======= TABLA COMPONENTES_CAPACITORES_ELECTROLITICOS=======
-- ===========================================================

select * from componentes;
select * from componentes_detalles;
select * from componentes_capacitores_electroliticos;

describe componentes_capacitores_electroliticos;


-- Actualizamos los caracteres del campo capacitancias de los capacitores 
update componentes_capacitores_electroliticos set capacitancia = replace(capacitancia, '?' , 'µ');



-- Actualizamos la Capacitancia del Capacitor segun el numero de serie BS6DVBDG
update (select capacitancia 
from componentes_capacitores_electroliticos inner join componentes 
on componentes_capacitores_electroliticos.id_componente = componentes.id
where componentes.nro_pieza = 'BS6DVBDG'
)set capacitancia = '25 µF a 10 000 µF';


select * from componentes_capacitores_electroliticos;




