/* -------------------------------
 * ------ MICROELECTRONICA---------
 * --------------------------------
 * 
 * 
 * ========= DML UPDATES =============
 */
 
 

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




-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ===========================================================
-- ======= TABLA RESISTORES DE ALTA FRECUENCIA ===============
-- ===========================================================


select * from componentes;
select * from componentes_detalles;
select * from componentes_resistores_alta_frecuencia;

describe componentes_resistores_alta_frecuencia;



-- Actualizamos la Capacitancia del Resistor segun el numero de pieza FKMGNHT5
update (select capacitancia 
from componentes_resistores_alta_frecuencia inner join componentes 
on componentes_resistores_alta_frecuencia.id_componente = componentes.id
where componentes.nro_pieza = 'FKMGNHT5'
)set capacitancia = '3.3 µF';


-- Actualizamos la Capacitancia del Resistor segun el numero de pieza FKMGNHT5
update (select capacitancia 
from componentes_resistores_alta_frecuencia inner join componentes 
on componentes_resistores_alta_frecuencia.id_componente = componentes.id
where componentes.nro_pieza = 'T0100GTR'
)set capacitancia = '4.0 µF';


-- Actualizamos la Tensión Operativa 
update componentes_resistores_alta_frecuencia set tension_operativa = replace(tension_operativa, 'max.' , 'max. VAC');



select * from componentes_resistores_alta_frecuencia;


-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ================================================================
-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_PICS =========
-- ================================================================

select * from componentes;
select * from componentes_microcontroladores_risc_pics;

describe componentes_microcontroladores_risc_pics;

-- Actualizamos todos los campos de memoria según el nro de pieza KY0-PIC18F4520-I/PT
update (select memoria_programa , memoria_datos , memoria_datos_eeprom 
from componentes_microcontroladores_risc_pics inner join componentes 
on componentes_microcontroladores_risc_pics.id_componente = componentes.id
where componentes.nro_pieza = 'KY0-PIC18F4520-I/PT'
)set memoria_programa = '16400 bytes' , memoria_datos = '800 bytes'
, memoria_datos_eeprom = '260 bytes';



-- Actualizamos todos los campos de memoria según el nro de pieza KY32-PIC-00130-001
 
update (select memoria_programa , memoria_datos , memoria_datos_eeprom 
from componentes_microcontroladores_risc_pics inner join componentes 
on componentes_microcontroladores_risc_pics.id_componente = componentes.id
where componentes.nro_pieza = 'KY32-PIC-00130-001'
)set memoria_programa = '15240 bytes' , memoria_datos = '690 bytes'
, memoria_datos_eeprom = '450 bytes';

-- Actualizamos el set de instrucciones segun el tipo de comunicacion serial
update componentes_microcontroladores_risc_pics set set_instrucciones = replace(set_instrucciones, '75 Instructions' , '60 Instructions')
where comunic_seriales = 'MSSP, Enhanced USART' ;


select * from componentes_microcontroladores_risc_pics;





-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------


-- ================================================================
-- ======= TABLA COMPONENTES_MICROCONTROLADORES_RISC_AVRS =========
-- ================================================================

select * from componentes;
select * from componentes_microcontroladores_risc_avrs;

describe componentes_microcontroladores_risc_avrs;

-- Actualizamos la frecuencia de operacion según el nro de pieza 16AURTR-ND
update (select frec_operacion
from componentes_microcontroladores_risc_avrs inner join componentes 
on componentes_microcontroladores_risc_avrs.id_componente = componentes.id
where componentes.nro_pieza = '16AURTR-ND'
)set frec_operacion = '22 Mhz';


-- Depuramos la frecuencia de operacion de todos los registros existentes
update componentes_microcontroladores_risc_avrs set frec_operacion = replace(frec_operacion, 'Mhz' , ' MHz');




select * from componentes_microcontroladores_risc_avrs;




-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==================================================
-- ======= TABLA COMPONENTES_PLACAS_ARDUINO =========
-- ==================================================

select * from componentes;

select * from componentes_placas_arduinos;

describe componentes_placas_arduinos;


-- Actualizamos los protocolos de comunic. según la descripción del producto
update (select comunic_protocolos
from componentes_placas_arduinos inner join componentes 
on componentes_placas_arduinos.id_componente = componentes.id
where componentes.descripcion = 'Placa Arduino Nano V3.0'
)set comunic_protocolos = 'I2C, UART/USART';

--Depuramos los nombres de los protocolos de comunicacion
update componentes_placas_arduinos set comunic_protocolos = replace(comunic_protocolos, 'I²C' , 'I2C');



select * from componentes_placas_arduinos;





-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==================================================
-- ======= TABLA COMPONENTES_PLACAS_ESP8266 =========
-- ==================================================

select * from componentes;

select * from componentes_placas_esp8266;

describe componentes_placas_esp8266;



-- Modificamos la cantidad de entradas y salidas segun el codigo del producto
update (select cantidad_entr_sal
from componentes_placas_esp8266 inner join componentes 
on componentes_placas_esp8266.id_componente = componentes.id
where componentes.codigo = '2471S0A-ESP8266'
)set cantidad_entr_sal = 12;

-- Depuramos el campo protocolo wifi 
update componentes_placas_esp8266 set prot_wifi = replace(prot_wifi, '802.11 b/g/n' , '802.11');

-- Depuramos el Rango de Frecuencias
update componentes_placas_esp8266 set rango_frec = replace(rango_frec, '2.4G-2.5G (2400M-2483.5M)' , '2.4G- 2.5G'); 


select * from componentes_placas_esp8266;






-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ==================================================
-- ======= TABLA COMPONENTES_PLACAS_ESP32 =========
-- ==================================================

select * from componentes;

select *  from componentes_placas_esp32;


describe componentes_placas_esp32;


-- Agregamos la frecuencia de memoria, tamaño de la flash y sram segun el procesador del producto

update (select frec_mem, tam_flash, tam_sram from componentes_placas_esp32 
where procesador = 'ARM Xtensa single-/dual-core 32-bit LX6')
set frec_mem = '12 Mhz' , tam_flash = '14240 bytes' , tam_sram = '1200 bytes';


-- Depuramos el campo cantidad de entradas y salidas
update componentes_placas_esp32 set cantidad_entr_sal = '-' where cantidad_entr_sal is null;





select *  from componentes_placas_esp32;
