/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= QUERIES =============
 */
 
 
 -- ==================================
-- ======= TABLA COMPONENTES =========
-- ===================================

select * from componentes;

-- ===================== LIKE ===================

-- Todos los componentes que sean Transistores
select * from componentes where categoria like '%Transistores%';

--Todos los componentes que sean Capacitores
select * from componentes where categoria like '%Capacitores%';

--Todos los componentes que sean Resistores
select * from componentes where categoria like '%Resistores%';

--Todos los componentes que sean Microcontroladores
select * from componentes where categoria like '%Microcontroladores%';

--Todos los componentes que sean  Arduino
select * from componentes where categoria like '%Arduino%';

--Todos los componentes que sean Esp8266
select * from componentes where categoria like '%Esp8266%';

--Todos los componentes que sean Esp32
select * from componentes where categoria like '%Esp32%';



-- ===================== REGISTRO RESUMIDO ==========================

select  codigo , descripcion, precio from componentes where categoria like '%Transistores%';
select  codigo , descripcion, precio from componentes where categoria like '%Capacitores%';
select  codigo , descripcion, precio from componentes where categoria like '%Resistores%';
select  codigo , descripcion, precio from componentes where categoria like '%Arduino%';
select  codigo , descripcion, precio from componentes where categoria like '%Esp8266%' or categoria like '%Esp32%';



-- ===================== ORDER BY ===================
select * from componentes order by categoria asc;


--  Registros Ordenados según su categoría con Stock mayor a 30
select * from componentes where stock > 30 order by categoria asc;

--  Registros Ordenados según su categoría con Stock menor a 10
select * from componentes where stock < 10 order by categoria asc;



-- Registros Ordenados según su categoría con precio menores a 10 dolares 
select * from componentes where precio < 10 order by categoria asc;


-- Registros Ordenados según su categoría con Stock mayor a 30
select * from componentes where stock > 30 order by categoria asc;


-- Registros Ordenados según su categoría del fabricante Microchip
select * from componentes where fabricante = 'Microchip' order by categoria asc;




-- ===================== VARCHAR TO INTEGER/DECIMAL ===================

select * from componentes;


-- Componentes con stock menor a 10
select  nro_pieza, descripcion, fabricante,  cast(stock as integer) as stock from componentes 
where stock <= 10 ;


-- Componentes con stock menor a 100
select  nro_pieza, descripcion, fabricante,  cast(stock as integer) as stock from componentes 
where stock <= 100 ;


-- Componentes cuyo stock este entre 100 a 200
select  nro_pieza, descripcion, fabricante,  cast(stock as integer) as stock from componentes 
where (stock <= 200 and stock >= 100);



-- Componentes con stock menor a 10 y cuyo precio sea mayor a 10 dolares
select  nro_pieza, descripcion, fabricante,  cast(stock as integer) as stock, cast(precio as decimal) as precio 
from componentes where (stock <= 10 and precio >=10 );





-- ===================== JOINS Y LIKE ===================

-- ===================== Microcontroladores_risc_pics ======================


select * from componentes;
select * from componentes_microcontroladores_risc_pics;


-- Seleccionamos los componentes segun la memoria del programa
select codigo, categoria, descripcion,componentes_microcontroladores_risc_pics.memoria_programa 
, componentes_microcontroladores_risc_pics.memoria_datos from componentes 
inner join componentes_microcontroladores_risc_pics
on componentes.id = componentes_microcontroladores_risc_pics.id_componente
where memoria_programa like '%16400%' ;


-- ===================== Microcontroladores_risc_avrs ======================

select * from componentes;
select * from componentes_microcontroladores_risc_avrs;


-- Seleccionamos los componentes segun el tamaño del nucleo
select codigo, categoria, descripcion,componentes_microcontroladores_risc_avrs.frec_operacion 
, componentes_microcontroladores_risc_avrs.tam_nucleo, componentes_microcontroladores_risc_avrs.tipo_memoria
from componentes inner join componentes_microcontroladores_risc_avrs
on componentes.id = componentes_microcontroladores_risc_avrs.id_componente
where tam_nucleo like '%8%' ;




-- Seleccionamos los componentes segun el tamaño del nucleo y la frecuencia de operacion
select codigo, categoria, descripcion,componentes_microcontroladores_risc_avrs.frec_operacion 
, componentes_microcontroladores_risc_avrs.tam_nucleo, componentes_microcontroladores_risc_avrs.tipo_memoria
from componentes inner join componentes_microcontroladores_risc_avrs
on componentes.id = componentes_microcontroladores_risc_avrs.id_componente
where tam_nucleo like '%8%' and frec_operacion like '%20%'  ;










 -- ===========================================
-- ======= TABLA COMPONENTES_DETALLES =========
-- ============================================



-- ===================== JOINS Y LIKE ===================


select * from componentes_detalles;



-- Seleccionamos los componentes segun el voltaje recomendado de la tabla componentes_detalles
select * from componentes inner join componentes_detalles
on componentes.id = componentes_detalles.id
where voltaje_recomendado = '20-25 VDC' ;



-- Seleccionamos los componentes segun el voltaje(uso de LIKE) recomendado de la tabla componentes_detalles
select * from componentes inner join componentes_detalles
on componentes.id = componentes_detalles.id
where voltaje_recomendado like '%20%' or voltaje_recomendado like '%25%';


-- Seleccionamos los componentes que tengan un voltaje minimo de entrada de 20 y un maximo de 
--100 para la tabla componentes_detalles
select * from componentes inner join componentes_detalles
on componentes.id = componentes_detalles.id
where voltaje_min_entrada like '%20%' and voltaje_max_entrada like '%100%';


-- Seleccionamos los componentes que tengan un voltaje minimo de entrada de 20 y un maximo de
--50 para la tabla componentes_detalles
select * from componentes inner join componentes_detalles
on componentes.id = componentes_detalles.id
where voltaje_min_entrada like '%20%' and voltaje_max_entrada like '%50%';


-- Componentes que tengan un voltaje maximo de entrada de 25 o 100 para la tabla componentes_detalles
select * from componentes inner join componentes_detalles
on componentes.id = componentes_detalles.id
where voltaje_max_entrada like '%25%' or voltaje_max_entrada like '%100%';






-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ============================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_BIPOLARES ===========
-- ============================================================

select * from componentes_transistores_bipolares;

describe componentes_transistores_bipolares;


-- Transistores de tipo NPN con una ganancia de 200 (hfe)
select * from componentes_transistores_bipolares where tipo = 'NPN' and ganancia_hfe='200';

-- Transistores de tipo NPN con una ganancia de 200 (hfe)
select tipo, voltaje_colec_emis , ganancia_hfe from componentes_transistores_bipolares 
where tipo = 'NPN' and ganancia_hfe='200';



-- https://docs.aws.amazon.com/es_es/redshift/latest/dg/r_CAST_function.html

-- Transistores de tipo NPN con una ganancia(hfe) menor que 100
select  tipo,voltaje_colec_emis, cast(ganancia_hfe as integer) as ganancia_hfe from componentes_transistores_bipolares 
where ganancia_hfe < 100 and tipo = 'NPN';


-- Transistores de tipo PNP con una ganancia(hfe) mayor que 100
select  tipo,voltaje_colec_emis, cast(ganancia_hfe as integer) as ganancia_hfe from componentes_transistores_bipolares 
where ganancia_hfe > 100 and tipo = 'PNP';




-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ============================================================
-- ======= TABLA COMPONENTES_TRANSISTORES_MOSFET ==============
-- ============================================================

select * from componentes_transistores_mosfet;

describe componentes_transistores_mosfet;



-- Transistores de tipo PMOS
select tipo, corriente_cc_drenaje, disip_max from componentes_transistores_mosfet where tipo = 'PMOS';


-- Transistores de tipo NMOS
select tipo, corriente_cc_drenaje, disip_max from componentes_transistores_mosfet where tipo = 'NMOS';




-- ================================================================
-- ======= TABLA COMPONENTES_CAPACITORES_ELECTROLITICOS ===========
-- ================================================================

select * from componentes_capacitores_electroliticos;
select * from componentes;

describe componentes_capacitores_electroliticos;


-- Capacitores de Tipo Radial
select tipo, capacitancia from componentes_capacitores_electroliticos where tipo like '%Radial%';


-- Capacitores de Tipo Axial
select tipo, capacitancia from componentes_capacitores_electroliticos where tipo like '%Axial%';





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===========================================================
-- ======= TABLA RESISTORES DE ALTA FRECUENCIA ===============
-- ===========================================================


select * from componentes;
select * from componentes_detalles;
select * from componentes_resistores_alta_frecuencia;

describe componentes_resistores_alta_frecuencia;


-- Resistores que tengan un rango de tolerancia de +-10 %
select capacitancia, rango_tolerancia, rango_resis_gral from componentes_resistores_alta_frecuencia 
where rango_tolerancia like '%+-10%' or rango_tolerancia like '%+- 10%';

-- Resistores que tengan un rango de resistencia general hasta 100
select capacitancia, rango_tolerancia, rango_resis_gral from componentes_resistores_alta_frecuencia 
where rango_resis_gral like '%100%';


-- Resistores que tengan un rango de resistencia general a partir de 20 y capacitancia de 1.1 uf
select capacitancia, rango_tolerancia, rango_resis_gral from componentes_resistores_alta_frecuencia 
where rango_resis_gral like '%20%' and capacitancia like '%1.1%';



-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ================================================================
-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_PICS =========
-- ================================================================


select * from componentes_microcontroladores_risc_pics;

describe componentes_microcontroladores_risc_pics;

select * from componentes;


