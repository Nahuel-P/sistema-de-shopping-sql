--Inserts de datos en la base de datos

INSERT INTO cliente
(id, nombre, fecha_nac, telefono, dni)
VALUES
(1,'Hedvige','1989-08-18',1182564624,37984925),
(2,'Leelah','1977-07-14', 1132260137, 37957950),
(3,'Garey','1995-01-18',1155665156,70507557),
(4,'Brew','1974-08-11',1180446122,92960615),
(5,'Rollo','1965-05-10',1182985042,66671041),
(6,'Elladine','1995-11-11',1198585927,5699601),
(7,'Cristiano','1988-05-02',1185937162,71595964),
(8,'Kristopher','1987-02-27',1175092639,69586516),
(9,'Lonnard','1981-10-11',1185092562,68705684),
(10,'Maisey','1991-01-13',1178492010,92250667);

INSERT INTO informacion_medica
(id, grupo_sanguineo, alergias, obra_social, contacto_emergencia)
VALUES
(1, 'O-', NULL, 'Muiz Sedical', 'cargar@despues.com'),
(2, 'AB+','Dermatitis', 'OSBE', NULL),
(3, 'O+','Urticaria', 'Balero', 'elpepe@contacto.com' ),
(4, 'O-', NULL, 'ODKFH', NULL ),
(5, 'B+', NULL, 'OGJD', 'contacto@dom.edu'),
(6, 'B-', 'Anafilaxia', 'FEMECBA', NULL ),
(7, 'O-', 'Urticaria', 'OSBE', 'contactoA@dom.com'),
(8, 'B+', NULL, NULL, 'cargar@despues.com'),
(9, 'AB-', 'Eccema', NULL, 'contactoB@dom.gob'),
(10, 'A+', 'Rinitis', 'OTLF', 'persona@contacto.com');

INSERT INTO local
(id, sector, tamanho)
VALUES
(1, 'Gastronomia', 40),
(2, 'Ropa', 20),
(3, 'Entretenimiento', 90),
(4, 'Calzado', 30),
(5, 'Gastronomia', 35),
(6, 'Gastronomia', 54),
(7, 'Ropa', 22),
(8, 'Calzado', 16);

INSERT INTO tienda
(id, nombre, local, encargado)
VALUES
(1, 'Olson Inc', 1, NULL),
(2, 'Goyette LLC', 2, NULL),
(3, 'Von-Bradtke', 3, NULL),
(4, 'Jacobs Group', 4, NULL),
(5, 'Boehm-Bosco', 5, NULL),
(6, 'Block Inc', 6, NULL),
(7, 'Hane and Sons', 7, NULL),
(8, 'Maggio Inc,', 8, NULL); 
----Todos los valores de empleado_id estan en NULL para no violar referencias de la tabla empleado

INSERT INTO empleado
(id, nombre, telefono, direccion, tienda_id, informacion_medica_id, rol)
VALUES
(1, 'Jonas', 1123859201, 'Calle falsa 123', 2,4, 'Gerente'),
(2, 'Noah',1158948272, 'Av.Siempreviva 744',7,1,'Duenho'),
(3, 'Ulrich',1184596728, 'Av.Siempreviva 742 ',6,2,'Empleado'),
(4, 'Claudia',1189251290, 'SaticoyStreet 1392',5,3,'Gerente'),
(5, 'Martha', 1195827491, 'Av.Santa fe 2000', 4,6,'Gerente'),
(6, 'Adam', 1194285710, 'Calle falsa 123',2,5, 'Empleado'),
(7, 'Hannah', 1198258205, 'Saenz Penha 352',1,7,'Jefe'),
(8, 'Agnes', 1158271920, 'Av.9 De Julio 920',3,8, 'Gerente');

UPDATE tienda 
SET encargado = 5 WHERE id=1;
UPDATE tienda
SET encargado = 1 WHERE id=2;
UPDATE tienda
SET encargado = 2 WHERE id=3;
UPDATE tienda
SET encargado = 6 WHERE id=4;
UPDATE tienda
SET encargado = 8 WHERE id=5;
UPDATE tienda
SET encargado = 3 WHERE id=6;
UPDATE tienda
SET encargado = 7 WHERE id=7;
UPDATE tienda
SET encargado = 4 WHERE id=8; --Actualizo la tabla con el id del empleado que le quiero poner a la tienda correspondiente



INSERT INTO producto
(id, tipo, nombre, precio, tienda)
VALUES
(1, 'Tercera edad', 'Ce ese', 15000, 3),
(2, 'Perfume','Estarcra', 20000,2 ),
(3, 'Camisa', 'Lefordé', 4000, 5),
(4, 'Sandalia', 'Él pie fresco', 6000, 7),
(5, 'Sandalia', 'La separadedos', 12000, 5),
(6, 'Corbata', 'Litallig', 7000, 4),
(7, 'Traje', 'Darsoul', 90000, 6),
(8, 'Perfume', 'Áromas del arrabal’', 120000, 1),
(9, 'Traje', 'Erreseis', 75000, 8),
(10, 'Zapatilla', 'Woroworcra', 4000, 2),
(11, 'Perfume', 'Áromas del arrabal’', 120000, 2),
(12, 'Perfume', 'Áromas del arrabal’', 130000, 2),
(13, 'Perfume', 'Áromas del arrabal’', 130000, 2);

INSERT INTO venta
(fecha, descuentos, cliente, producto, tienda)
VALUES
('2019-12-30', 2000, 1, 1, 5),
('2019-12-29', 5000, 2, 6, 6),
('2020-09-07', 3600, 3, 3, 8),
('2020-07-05', 3000, 4, 2, 1),
('2020-05-01', 1500, 4, 9, 2),
('2020-01-03', 2300, 5, 8, 6),
('2020-09-05', 3000, 6, 4, 3),
('2020-08-14', 2900, 7, 5, 4),
('2020-09-20', 3000, 8, 4, 4),
('2020-06-20', 100, 8, 10, 4),
('2020-09-04', 300, 7, 2, 4),
('2020-09-05', 900, 7, 7, 2),
('2020-09-24', 100, 7, 7, 3);



--1)Busque los id, nombre y teléfono de los empleados cuya contacto no está cargado o tiene el correo cargar@despues.com para así poder contactarlos.
SELECT id, nombre, telefono 
FROM empleado
WHERE informacion_medica_id IN(SELECT id
                               FROM informacion_medica
                               WHERE contacto_emergencia IS NULL
									OR contacto_emergencia = 'cargar@despues.com'); --Entendi que el contacto de emergencia era un mail y no un numero de telefono, por eso evalue solamente el mail.

--2)Con  el  objetivo  de  ofrecerles  ofertas  y  descuentos,  se  quiere  conseguir  la  información  de  contacto  de aquellos clientes que son mayores de 50 o compraron productos de tipo ’Tercera edad’.

SELECT telefono 
FROM cliente AS c
JOIN venta AS v 
    ON c.id = v.cliente
JOIN producto AS p 
    ON v.producto = p.id
WHERE p.tipo = 'Tercera edad' 
	OR c.fecha_nac < '1970-01-01' ;

--3)Se quiere ver la cantidad de ventas hechas este año de producto de tipo ’Perfume’ y el precio promedio que se dio entre todas las tiendas 

SELECT COUNT(*) AS cantidad_de_compras, ROUND(AVG(p.precio-v.descuentos)) AS promedio_precio
FROM venta AS v 
JOIN producto AS p 
    ON v.producto = p.id
WHERE fecha >= '2020-01-01' 
	AND tipo = 'Perfume';
--Seleccione el de todas las tiendas en total, ya que no especificaba la cantidad de ventas de cada una

--4)Se requieren obtener aquellos empleados que tengan como grupo sanguíneo O- ordenados por apellido y por tienda de forma ascendente 

SELECT e.*  --Seleccione todos los datos de los empleados ya que no se especificaba que columna se queria ver
FROM empleado AS e
JOIN informacion_medica AS im
	ON e.informacion_medica_id = im.id
WHERE grupo_sanguineo='O-'
ORDER BY nombre, tienda_id ASC;

--5) Seleccione aquellas camisas (productos de tipo camisa) cuyo precio superen los $ 800 que no hayan sido vendidas en el mes de octubre 2020.

SELECT nombre --Hice esta seleccion ya que interprete que se queria saber el nombre de las camisas que cumplan la condicion
FROM producto AS p
JOIN venta AS v
    ON p.id = v.producto
WHERE tipo = 'Camisa' 
	AND precio > 800 
	AND fecha NOT BETWEEN '2020-10-01' 
	AND '2020-10-31'; --Interprete que se vendieron en otra fecha que no sea en el mes de octubre.

--6)Seleccione aquellas tiendas que hayan realizado un descuento de 50 % sobre sandalias Él pie fresco ó ’La separadedos’y que ademas haya hecho descuentos en cualquier zapatilla

SELECT t.nombre -- Selecciono las tiendas que haya hecho un descuento de 50% sobre sandalias Él pie fresco ó La separadedos
FROM tienda AS t
JOIN venta AS v 
    ON v.tienda = t.id
JOIN producto AS p 
    ON p.id = v.producto
WHERE (p.nombre='Él pie fresco' 
	OR p.nombre = 'La separadedos') 
	AND v.descuentos = (p.precio/2)
INTERSECT --Hago una interesccion para solamente dejar las tuplas que aparecen en la primera tabla y aparecen en la segunda 
(SELECT t.nombre --Selecciono las tiendas que hayan hecho descuentos en cualquier zapatilla
FROM tienda AS t
JOIN venta AS v 
    ON v.tienda = t.id 
JOIN producto AS p 
    ON p.id = v.producto
WHERE p.tipo = 'Zapatilla' 
	AND v.descuentos > 0);

--7) Seleccione aquellas tiendas que vendan trajes, pero no corbatas. 

SELECT t.nombre -- Selecciono todas las tiendas que vendan traje
FROM tienda AS t
JOIN producto AS p
    ON p.tienda = t.id
WHERE p.tipo = 'Traje'
EXCEPT -- Hago una resta como en AR en el cual elimina las tuplas de las tiendas que venden corbata
SELECT t.nombre --Selecciono todas las tiendas que vendan corbata
FROM tienda AS t
JOIN producto AS p
    ON p.tienda = t.id
WHERE p.tipo = 'Corbata';

--8)Obtener las 3 tiendas  que tengan los productos más caros. 

SELECT t.id, MAX(t.nombre) AS nombre_de_tienda
FROM tienda AS t
JOIN producto AS p
	ON p.tienda = t.id
GROUP BY t.id --Agrupo por las tiendas para que no hayan tiendas repetidas
ORDER BY MAX(precio) DESC LIMIT 3;


--9) Obtener el promedio de precio del perfume Áromas del arrabal’de acuerdo al tamaño del local 
	
SELECT p.nombre AS nombre, ROUND(AVG(p.precio)) AS promedio_de_precio, l.tamanho
FROM producto AS p
JOIN tienda AS t
    ON p.tienda = t.id
JOIN local AS l
	ON l.id = t.local
WHERE p.nombre = 'Áromas del arrabal’'
GROUP BY p.nombre, l.tamanho --Hice un group by con l.tamanho ya que no queria que dos tiendas del mismo tamanho aparezcan repetidas
ORDER BY l.tamanho DESC;

--10) Crear una vista que muestre las 5 tiendas que hayan realizado la mayor cantidad de ventas y sumatoria de pesos más alta en el mes de septiembre de 2020 ordenada por ambas . La creacion de la vista se encuentra en el archivo pacheco_alan_shopping_DDL, de todas maneras, hago un select para mostrar el resultado de la vista creada

SELECT * FROM tiendas_mas_exitosas_de_septiembre;

--11)Identificar a los clientes que hayan gastado mas de $ 100.000 mensuales (nombre, dni y teléfono y la sumatoria de compras aplicados los descuentos) 
SELECT MAX(c.nombre) AS nombre,c.dni,c.telefono, SUM(p.precio-v.descuentos) AS gasto_total,EXTRACT(month from v.fecha) AS mes_de_compra
FROM venta AS v
JOIN cliente AS c 
	ON v.cliente = c.id
JOIN producto AS p 
	ON v.producto = p.id
GROUP BY c.dni, c.telefono,mes_de_compra --Hago group by en mes_de_compra para que las sumatoria sea del mismo mes y no se sume distintos meses. No hice un group by de nombre ya que podria haber clientes con mismo nombre
HAVING (SUM(p.precio-v.descuentos)>100000);

--12)Obtener los empleados que trabajan en alguna de las 5 tiendas más exitosas 
SELECT e.nombre,v.tienda, MAX(t.nombre) AS nombre , COUNT(v.tienda) AS contador_de_ventas,SUM(p.precio-v.descuentos) AS sumatoria_de_pesos
FROM producto AS p
JOIN tienda AS t
    ON p.tienda = t.id
JOIN venta AS v
    ON v.tienda = p.tienda
JOIN empleado AS e
	ON v.tienda = e.tienda_id
GROUP BY v.tienda, e.nombre
ORDER BY contador_de_ventas DESC, sumatoria_de_pesos DESC LIMIT 5; --Considero las tiendas mas exitosas a aquellas que hayan tenido la mayor cantidad de ventas

--13)Es necesario identificar a los empleados convivientes, es decir que viven en la misma direccion 

SELECT  MAX(e1.nombre), STRING_AGG('convive con:', ','),MAX(e2.nombre)
FROM empleado AS e1
JOIN empleado AS e2 
    ON e1.direccion = e2.direccion 
		AND e1.id != e2.id
WHERE e1.tienda_id = e2.tienda_id -- Hice la seleccion de que sean de la misma tienda ya que es la manera que interprete el enunciado
GROUP BY e1.id;

--14).A partir del DNI de un cliente se busca obtener todos los puntos ha acumulado. Los puntos se calculan de la siguiente forma: se suma un punto por cada venta si ésta supera un límite de $ 500 el puntaje el válido solamente en el año calendario. 

	WITH compras_de_clientes AS (
		SELECT c.id,c.dni, SUM(p.precio-v.descuentos) AS costo_de_compra
		FROM cliente AS c
		JOIN venta AS v
	   		ON v.cliente = c.id
		JOIN producto AS p
	   		ON v.producto = p.id
		GROUP BY c.id, v.fecha
		HAVING SUM(p.precio-v.descuentos) > 500 
			AND v.fecha BETWEEN '2020-01-01' 
			AND '2020-12-31'
	) --Utilizo CTE (Common Table Expressions) para evitar anidacion de subconsultas // Selecciono aquellos clientes que su costo de compra sea mayor a 500 en el anho 2020
	SELECT compras_de_clientes.dni, COUNT(compras_de_clientes.id) AS cantidad_de_puntos
	FROM compras_de_clientes
	GROUP BY compras_de_clientes.dni; 

--15)15. Por cuestiones CoVID-19, debemos identificar las tiendas cuyo número de local sea par para que pueda abrir los días miércoles, viernes y domingo, y las impares martes, jueves y sábado. Los dias lunes el shopping no abrirá. La consulta debe calcular los días de apertura que se asignan como texto, y ordenarla por fecha de apertura. La leyenda debe ser ‘miercoles, viernes y domingo’, y ‘martes, jueves y sábado’ y la columna se llamará dias_de_actividad. 

SELECT id, t.nombre, STRING_AGG('miércoles, viernes y domingo', ',') AS dias_de_actividad
FROM tienda AS t
WHERE local % 2 = 0
GROUP BY id
UNION
SELECT id,t.nombre, STRING_AGG('martes, jueves y sábado', ',') AS dias_de_actividad
FROM tienda AS t
WHERE local %2 !=0
GROUP BY id
ORDER BY dias_de_actividad;