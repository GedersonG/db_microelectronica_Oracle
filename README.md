# Base de Datos de microelectronica con el SGDB Oracle XE 21c

</br>

## Descripción


* Base de Datos acerca de Productos de Microelectrónica desarrollado con Oracle XE 21c
* Se Jerarquiza la información según las categorías de diferentes componentes electrónicos y a su vez sus especificaciones técnicas más relevantes.
* El Proyecto está organizado y modularizado para que cualquier cambio se pueda efectuar de forma eficaz y eficiente



</br>

## Descripción Técnica

* Base de Datos acerca de Productos de Microelectrónica desarrollado con el SGDB Oracle XE 21c.
* La Base de Datos describen de forma específica dichos componentes por categoria. Hay componentes que entran en la categoría de Transistores, otros de Capacitores, Resistores, etc.
* Hay tablas que pueden especificar aún más la categoría del componente. Como por ejemplo el componente transistor, los transistores pueden ser de tipo BJT, MOSFET, ETC. Si se crea solamente una tabla por categoría no sería una db normalizada, ya que habría campos que no serían completados porque, en el caso de los transistores, un tipo BJT no tiene las mismas características/parámetros que un MOSFET, este ejemplo aplica para el otros tipos de componentes de la db.
* Se analizó la posibilidad de solamente implementar características genéricas ya que las especificaciones técnicas de todo tipo de componente están indexadas dentro de un datasheet que el fabricante provee, pero teniendo en consideración que esta es una base de datos que puede aplicar como modelo de una real para fabricantes, se toma dichas consideraciones y se agrega un campo para almacenar la hoja de datos del componente y se normaliza con tablas según las categorías de los mismos.
* Una Página de Ejemplo sería http://gmelectronicaweb.com/catalogo/pag108.html , ahí se puede visualizar que se proyectan los datos más relevantes de los componentes sin necesidad de implementar una hoja de datos completa
* Para las Especificaciones de los Transistores me base en la página https://alltransistors.com/es/mosfet/transistor.php?transistor=4 
* Para las Especificaciones de los capacitores y Resistores me base en la página https://ar.mouser.com/c/ds/passive-components/capacitors/aluminum-electrolytic-capacitors/
* Especificaciones de los pics https://www.kynix.com/Detail/10386/PIC18F4520-I%2FPT.html?gclid=Cj0KCQiAxc6PBhCEARIsAH8Hff0_9CtuRscm1qf3-50qS1D_lP8jdspHgQRWw904hpn6nC1sXRh4JnQaAlpxEALw_wcB
* Especificaciones de Arduino https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf
* Especificaciones de los Esp8266 https://cdn-shop.adafruit.com/product-files/2471/0A-ESP8266__Datasheet__EN_v4.3.pdf
* Algunos Valores de los Registros Insertados no son completamente verídicos, se prioriza el desarrollo ágil en relación a la información almacenada (los valores pueden ser modificados rápidamente, el desarrollo de la db no ).
* La Base de Datos puede ser Escalable siguiendo el mismo patrón de Normalización del Proyecto, solo se realizaron 10 tablas a modo de aplicación práctica y se modulariza en DDL, DML(INSERTS, UPDATES, DELETES) y QUERIES.

</br>

#### Diagrama Entidad Relación  `db_microelectronica`

![Index app](https://github.com/andresWeitzel/db_microelectronica_Oracle/blob/master/doc/db_microelectronica_DER.png)




## Más Información

</br>


| **Tecnologías Empleadas** | **Versión** | **Finalidad** |               
| ------------- | ------------- | ------------- |
| Oracle XE | 21 c  | SGDB  |
| Oracle SQL Developer | 21.4.1  | Gestor de Base de Datos | 
| Git Bash | 2.29.1  | Control de Versiones |
| CMD | 10 | Manipular los Servicios de Oracle mediante linea de comandos | 

</br>


## Descarga y Documentacion de las Tecnologías Empleadas:

</br>

| **Tecnologías** | **Descarga** | **Documentación** |               
| ------------- | ------------- | ------------- |
| Git Bash |  https://git-scm.com/downloads |   https://git-scm.com/docs |
| Oracle |  https://www.oracle.com/database/technologies/xe-downloads.html  | https://www.oracle.com/database/technologies/xe-downloads.html  |
| Sql Developer | https://www.oracle.com/ar/database/technologies/appdev/sqldeveloper-landing.html  | https://www.oracle.com/ar/database/technologies/appdev/sqldeveloper-landing.html | 

</br>

<hr>






## `Documentación y Guía Del Proyecto`
#### (Esta Documentación y Guía que Desarrollé es para la Creación, Configuración, Manejo, Funciones, etc de la Base de Datos db_microelectroncia con Oracle XE en SQL Developer. Como así también para el Desarrollo de este Proyecto, DDL, DML, Vistas, Disparadores , Procedimientos, Indices, Gestión y Administración , Aplicaciones del Código, Gestión de Usuarios, Manejo de los Posibles Errores que pudiesen surgir, Uso de Git, Consideraciones y Declaraciones del Proyecto, etc. Recomiendo Leerla y Realizar todo paso a paso como se indica en la misma, cualquier aporte o sugerencia, informar al respecto).

## Indice

  #### Sección 1) Configuración de la Base de Datos

  - [ Paso 1) Configuración de Oracle y Usuarios.](#paso-1-configuración-de-oracle-y-usuarios)


  
   #### Sección Apéndice
   
   -[ Funciones Implementadas Predefinidas para los Logs del Usuario](#funciones-predefinidas-para-los-logs-del-usuario)



</br>

## Sección 1) Configuración de Oracle y Usuarios

</br>

### Paso 1) Configuración de Oracle y Usuarios 
#### (Primeramente deberás descargar el motor de base de datos de oracle  , luego algún GDB como por ej. SQLDeveloper y crear el esquema de conexión del usuario o los usuarios de uso. Recordar que oracle trabaja a nivel base de datos con esquemas de conexión que se diversifican a través de ciertas propiedades habilitadas para poder realizar operaciones de datos en la db. No existe en si una conexion para usar varias dbs como postgres o mysql, el concepto de bases de datos en oracle es mas complejo ).

#### 1.1) Descarga de SQL Developer
* https://www.oracle.com/ar/database/technologies/appdev/sqldeveloper-landing.html
* Descargar, Ejecutar e Instalar (Siguiente, Siguiente).
* Oracle nos pide una contraseña para su uso, en mi caso admin(entorno local), en producción se deberá gestionar roles y otros asuntos


#### 1.2) Descarga de Oracle
* https://www.oracle.com/database/technologies/xe-downloads.html
* Descargar, Ejecutar el setup.exe e Instalar (Siguiente, Siguiente).
* El proceso de configuración de Oracle lleva un tiempo, también depende de los recursos de cada computadora, pero en sí es lento.



#### 1.3) Configuración de Oracle en SQL Developer (Conexión a Oracle).
#### (Como se mencionó anteriormente, el entendimiento de almacenamiento de datos por parte de oracle es más complejo y a su vez acarrea mayor seguridad, por eso cuando nos refiramos a bases de datos, se apunta al esquema de uso en sí, donde se van a poder levantar diferentes tipos de roles(usuarios y permisos), entre otras cosas)

</br>

#### 1.3.1) Creación de una Conexión de tipo System para usos genéricos
* Click sobre Nueva Conexión.
    * --> En `Name` colocamos `system`
    * --> En `Usuario` colocamos `system`
    * --> En `Contraseña` la ingresada al instalar oracle (en mi caso `admin`)
    * --> El resto lo dejamos todo por defecto ( Host, Port, etc ).
    * --> Testear la conexión con el boton `Probar` o `Test`
    * --> Por último click sobre el botón conectar, luego se pedirá Usuario y Contraseña, ingresar
    * --> Ya está la conexión configurada.



#### 1.4) Creación de una Conexión para el Esquemas de la Base de Datos
#### ( Vamos a craer un Esquema de Conexión para el manejo de nuestra db por razones de seguridad, en este caso solamente podrán manejar la misma los administradores de esta db con el usuario y contraseña correspondientes, para asignarles ciertos privilegios sobre la misma)
* Primeramente debemos asegurarnos de que se haya establecido correctamente la conexión de tipo system para poder ejecutar lo siguiente
* Aplicaremos el Esquema de Usuarios Administradores a través de un Script
* Primeramente habilitamos la inserción a través de Scripts..
```sql
-- == HABILITAMOS LOS SCRIPTS ==
alter session set "_ORACLE_SCRIPT"=true;

```
* Seguidamente vamos a crear el usuario con sus privilegios para poder utilizar posteriormente la conexión que crearemos
* Creamos el Usuario administradores con su Contraseña..
```sql
-- == CREACIÓN DE USUARIO ==
create user admin_microelectronica identified by admin_microelectronica
```
* No colocamos las ; ya que es una linea de un comando que lo analizaremos por partes
* Creamos el tablespace por defecto, que es la ubicación de almacenamiento donde se pueden guardar los datos/objetos de la base de datos y el tablespace temporal, para guardar los datos en sesion, cuando se desloguee el usuario estos datos se eliminan. Por último el limite de datos para el mismo, en este caso ilimitado, pero depende el area del usuario se le asignará un tamaño fijo
```sql
default tablespace system 
temporary tablespace temp
quota unlimited on system;
```
* Agregamos los privilegios de sesion, creación de tablas, indices, disparadores, procedimientos, secuencias, vistas, etc

```sql
-- == PRIVILEGIOS DEL USUARIO ==
grant create session to admin_microelectronica;
grant create table to admin_microelectronica;
grant create view to admin_microelectronica;
grant create trigger to admin_microelectronica;
grant create procedure to admin_microelectronica;
grant create sequence to admin_microelectronica;


```
* Comando Completo..
```sql
-- == HABILITAMOS LOS SCRIPTS ==
alter session set "_ORACLE_SCRIPT"=true;

-- == ELIMINAMOS EL O LOS POSIBLES USUARIOS CREADOS CON TABLAS, ETC ==
drop user administradores cascade;

-- == CREACIÓN DE USUARIO ==
create user admin_microelectronica identified by admin_microelectronica
default tablespace system 
temporary tablespace temp
quota unlimited on system;


-- == PRIVILEGIOS DEL USUARIO ==
grant create session to admin_microelectronica;
grant create table to admin_microelectronica;
grant create view to admin_microelectronica;
grant create trigger to admin_microelectronica;
grant create procedure to admin_microelectronica;
grant create sequence to admin_microelectronica;



```

#### 1.5) Conexión del Usuario admin_microelectronica para nuestra db en Oracle 
* Click sobre Nueva Conexión.
    * --> En `Name` colocamos `db_microelectronica`
    * --> En `Usuario` colocamos el nombre del usuario creado `admin_microelectronica`
    * --> En `Contraseña` colocamos  la contraselña del usuario creado `admin_microelectronica`
    * --> El resto lo dejamos todo por defecto ( Host, Port, etc ).
    * --> Testear la conexión con el boton `Probar` o `Test`
    * --> Por último click sobre el botón conectar, luego se pedirá Usuario y Contraseña, ingresar
    * --> Ya está la conexión configurada.




