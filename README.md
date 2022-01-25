# Base de Datos de microelectronica con el SGDB Oracle XE 21c

* Base de Datos acerca de Productos de Microelectrónica desarrollado con el SGDB Oracle XE 21c
* La Base de Datos consta de tablas que describen de forma genérica los componentes y otras tablas que especifícan dichos componentes por categoria. Hay componentes que entran en la categoría de sensores, otros de circuito integrado, transistores, etc. Hay tablas que pueden especificar aún más la categoría del componente. Como por ejemplo el componente transistor, los transistores pueden ser de tipo BJT, MOSFET, ETC. Si se crea solamente una tabla por categoría no sería una db normalizada, ya que habría campos que no serían completados porque, en el caso de los transistores, un tipo BJT no tiene las mismas características/parámetros que un MOSFET, este ejemplo aplica para el otros tipos de componentes de la db.
* Se analizó la posibilidad de solamente implementar características genéricas ya que las especificaciones técnicas de todo tipo de componente están indexadas dentro de un datasheet que el fabricante provee, pero teniendo en consideración que esta es una base de datos que puede aplicar como modelo de una real para fabricantes, se toma dichas consideraciones y se agrega un campo para almacenar la hoja de datos del componente y se normaliza con tablas según las categorías de los mismos.
* Una Página de Ejemplo sería http://gmelectronicaweb.com/catalogo/pag108.html , ahí se puede visualizar que se proyectan los datos más relevantes de los componentes sin necesidad de implementar una hoja de datos completa
* Para las Especificaciones de los Transistores me base en la página https://alltransistors.com/es/mosfet/transistor.php?transistor=4 
* Para las Especificaciones de los capacitores y Resistores me base en la página https://ar.mouser.com/c/ds/passive-components/capacitors/aluminum-electrolytic-capacitors/
* Algunos Valores de los Registros Insertados no son completamente verídicos, se prioriza el desarrollo ágil en relación a la información almacenada(los valores pueden ser modificados rápidamente, el desarrollo de la db no).
* La Base de Datos puede ser Escalable siguiendo el mismo patrón de Normalización del Proyecto, solo se realizaron 10 tablas a modo de aplicación.




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
#### (Primeramente deberás descargar el motor de base de datos de oracle  , luego algún GDB como por ej. SQLDeveloper y crear la db ).

#### 1.1) Descarga de SQL Developer
* https://www.oracle.com/ar/database/technologies/appdev/sqldeveloper-landing.html
* Descargar, Ejecutar e Instalar (Siguiente, Siguiente).
* Oracle nos pide una contraseña para su uso, en mi caso admin(entorno local), en producción se deberá gestionar roles y otros asuntos


#### 1.2) Descarga de Oracle
* https://www.oracle.com/database/technologies/xe-downloads.html
* Descargar, Ejecutar el setup.exe e Instalar (Siguiente, Siguiente).
* El proceso de configuración de Oracle lleva un tiempo, también depende de los recursos de cada computadora, pero en sí es lento.



#### 1.3) Configuración de Oracle en SQL Developer (Conexión a Oracle).
* Click sobre Nueva Conexión.
    * --> En `Name` colocamos `SYSTEM`
    * --> En `Usuario` colocamos `system`
    * --> En `Contraseña` la ingresada al instalar oracle (en mi caso `admin`)
    * --> El resto lo dejamos todo por defecto ( Host, Port, etc ).
    * --> Testear la conexión con el boton `Probar` o `Test`
    * --> Por último click sobre el botón conectar, luego se pedirá Usuario y Contraseña, ingresar
    * --> Ya está la conexión configurada.



#### 1.4) Creación de Esquemas de Usuarios
#### ( Vamos a craer un Esquema de Usuarios por razones de seguridad, en este caso solamente de administradores de bases de datos, para asignarles ciertos privilegios sobre la misma, podriamos crear un usuario para desarrolladores, otro para otra área, etc. En mi caso solamente para administradores )
* Aplicaremos el Esquema de Usuarios a través de Scripts
* Primeramente habilitamos la inserción a través de Scripts..
```sql
-- == HABILITAMOS LOS SCRIPTS ==
alter session set "_ORACLE_SCRIPT"=true;

```
* Seguidamente vamos a crear un usuario con sus privilegios
* Creamos un Usuario con su Contraseña..
```sql
-- == CREACIÓN DE USUARIO ==
create user administradores identified by administradores
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
grant create session to administradores;
grant create table to administradores;
grant create view to administradores;
grant create trigger to administradores;
grant create procedure to administradores;
grant create sequence to administradores;

```
* Comando Completo..
```sql
-- == HABILITAMOS LOS SCRIPTS ==
alter session set "_ORACLE_SCRIPT"=true;

-- == CREACIÓN DE USUARIO ==
create user administradores identified by administradores
default tablespace system 
temporary tablespace temp
quota unlimited on system;


-- == PRIVILEGIOS DEL USUARIO ==
grant create session to administradores;
grant create table to administradores;
grant create view to administradores;
grant create trigger to administradores;
grant create procedure to administradores;
grant create sequence to administradores;


```

#### 1.5) Conexión del Usuario Administradores en Oracle 
* Click sobre Nueva Conexión.
    * --> En `Name` colocamos `ADMINISTRADORES`
    * --> En `Usuario` colocamos `administradores`
    * --> En `Contraseña` colocamos  `administradores`
    * --> El resto lo dejamos todo por defecto ( Host, Port, etc ).
    * --> Testear la conexión con el boton `Probar` o `Test`
    * --> Por último click sobre el botón conectar, luego se pedirá Usuario y Contraseña, ingresar
    * --> Ya está la conexión configurada.




