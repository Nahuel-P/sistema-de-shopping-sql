DROP DATABASE tp_pacheco;  --me aseguro que no haya otra base de datos con el mismo nombre

CREATE DATABASE tp_pacheco;
/*
Desde este momento es necesario conectarnos a la base de datos
Dependiendo de donde se este ejercutando el script es necesario tomar uno de dos posibles caminos:

\c tp_pacheco (OPCION DESDE LA CONSOLA)

En caso de la interfaz grafica es necesario introducir contraseña de usuario y poner como nombre de la base de datos tp_pacheco para que se conecte
*/

--CREAMOS LAS TABLAS DE LA BASE DE DATOS:

/*Hay que crear las tablas en orden ya que si se altera se produciria un error, esto sucederia por las CONSTRAINT FOREIGN KEY. Si se dice que una tabla tiene como clave foranea el atributo de una tabla que aun no existe, daría un error. Por ello es importante respetar el orden
 */

CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	nombre varchar(20),
	fecha_nac date,
	telefono int,
	dni int
);

CREATE TABLE informacion_medica(
    id SERIAL PRIMARY KEY,
    grupo_sanguineo varchar(5),
    alergias varchar(200),
    obra_social varchar(20)
);

ALTER TABLE informacion_medica
ADD COLUMN contacto_emergencia varchar(20) DEFAULT NULL;

CREATE TABLE local(
    id SERIAL PRIMARY KEY,
    sector varchar,
    tamanho decimal -- Decidi cambiar la ñ por la nh ya que tienden a generar problemas en las bases de datos
);

CREATE TABLE tienda(
   id SERIAL PRIMARY KEY,
    nombre varchar(20),
    local integer,
    encargado integer,
    CONSTRAINT fk_local FOREIGN KEY (local) REFERENCES local(id)
    -- CONSTRAINT fk_empleado FOREIGN KEY(encargado) REFERENCES empleado(id)  esta constraint la comente ya que no habia relacion entre las claves
);

CREATE TABLE empleado (
    id SERIAL PRIMARY KEY,
    nombre varchar(20),
    telefono int DEFAULT NULL ,
    direccion varchar(20),
	tienda_id integer,
	informacion_medica_id integer, 
    rol varchar(20),
	CONSTRAINT fk_tienda FOREIGN KEY (tienda_id) REFERENCES tienda(id),
    CONSTRAINT fk_informacion_medica FOREIGN KEY (informacion_medica_id) REFERENCES informacion_medica(id)
);

ALTER TABLE tienda 
ADD CONSTRAINT fk_empleado FOREIGN KEY(encargado) REFERENCES empleado(id) --cambiar a encargado empleado_id = encargado
ON UPDATE NO ACTION ON DELETE NO ACTION; --tuve que hacer esta modificacion para agregar la restriccion de clave foreanea y no entre en conflicto con la tabla empleado que no estaba creada anteriormente


CREATE TABLE producto(
    id SERIAL PRIMARY KEY,
    tipo varchar(20),
    nombre varchar(20),
    precio int,
	tienda integer,
	CONSTRAINT fk_tienda FOREIGN KEY (tienda) REFERENCES tienda(id)
);

CREATE TABLE venta(
    fecha date,--datetime no es un tipo de dato valido para postgre por lo tanto lo reemplazo con date.
    descuentos int,
	cliente integer,
	producto integer,
	tienda integer,
    CONSTRAINT venta_pk PRIMARY KEY (cliente, producto, tienda), -- declaro las multiples claves primarias
	CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES cliente(id),
    CONSTRAINT fk_producto FOREIGN KEY (producto) REFERENCES producto(id),
    CONSTRAINT fk_tienda FOREIGN KEY (tienda) REFERENCES tienda(id)
);

--10). Crear una vista que muestre las 5 tiendas que hayan realizado la mayor cantidad de ventas y sumatoria de pesos más alta en el mes de septiembre de 2020 ordenada por ambas 

CREATE VIEW tiendas_mas_exitosas_de_septiembre AS(
SELECT v.tienda, MAX(t.nombre) AS nombre , COUNT(v.tienda) AS contador_de_ventas,SUM(p.precio-v.descuentos) AS sumatoria_de_pesos
FROM producto AS p
JOIN tienda AS t
    ON p.tienda = t.id
JOIN venta AS v
    ON v.tienda = p.tienda
WHERE (v.fecha BETWEEN '2020-09-01' AND '2020-10-01')
GROUP BY v.tienda
ORDER BY contador_de_ventas DESC, sumatoria_de_pesos DESC LIMIT 5); --Considero las tiendas mas exitosas a aquellas que hayan tenido la mayor cantidad de ventas en el mes
