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
where ganancia_hfe < 100;

