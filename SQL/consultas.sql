/* Consultas BDD*/

/* Base de datos: Videojuegos*/

/* Esquema: */
ventas(ventas_id,Nombre,Año,Ventas_NA,Ventas_EU,Ventas_JP,Ventas_Otros,codEditorial,codPlataforma,codGenero)
plataforma(codPlataforma,Plataforma)
genero(codGenero,Genero)
editorial(codEditorial,Editorial)

1.	Total de ventas por género
SELECT Genero,SUM(Ventas_Global) AS total
FROM ventas INNER JOIN genero
ON ventas.codGenero = genero.codGenero
GROUP BY genero.codGenero
ORDER BY total DESC

2.	Comprobación de la consulta 1
SELECT ventas.Ventas_NA+ventas.Ventas_EU+ventas.Ventas_JP+ventas.Ventas_Otros,ventas.Ventas_Global
FROM ventas
WHERE ventas.Ventas_NA+ventas.Ventas_EU+ventas.Ventas_JP+ventas.Ventas_Otros <> ventas.Ventas_Global

3.	Ventas por genero
SELECT Genero,SUM(Ventas_Global) AS total
FROM ventas INNER JOIN genero
ON ventas.codGenero = genero.codGenero
GROUP BY genero.codGenero
ORDER BY total DESC

4.	Ventas por genero y plataforma
SELECT Genero,Plataforma,SUM(ventas.Ventas_NA+ventas.Ventas_EU+ventas.Ventas_JP+ventas.Ventas_Otros) AS totales
FROM ventas INNER JOIN genero
ON ventas.codGenero = genero.codGenero
INNER JOIN plataforma
ON ventas.codPlataforma = plataforma.codPlataforma
GROUP BY genero.codGenero, plataforma.codPlataforma
ORDER BY totales DESC

5.	Detalle ventas

6.	Ventas por región
SELECT "Norte America" AS region, round(SUM(ventas.Ventas_NA),2) AS total
FROM ventas UNION ALL
SELECT "Europa" AS region, round(SUM(ventas.Ventas_EU),2) AS total
FROM ventas UNION ALL
SELECT "Japón" AS region, round(SUM(ventas.Ventas_JP),2) AS total
FROM ventas UNION ALL 
SELECT "Otros" AS region, round(SUM(ventas.Ventas_Otros),2) AS total
FROM ventas

7.	Ventas por año por región
SELECT Año,round(SUM(ventas.Ventas_NA),2) AS America,round(SUM(ventas.Ventas_EU),2) AS 
Europa,round(SUM(ventas.Ventas_JP),2) AS Japón,round(SUM(ventas.Ventas_Otros),2) AS Otros
FROM ventas
GROUP BY Año

8.	Ventas por plataforma por región
SELECT Plataforma,round(SUM(ventas.Ventas_NA),2) AS America,round(SUM(ventas.Ventas_EU),2) AS 
Europa,round(SUM(ventas.Ventas_JP),2) AS Japón,round(SUM(ventas.Ventas_Otros),2) AS Otros
FROM ventas INNER JOIN plataforma
ON ventas.codPlataforma = plataforma.codPlataforma
GROUP BY Plataforma

9.	Ventas por género por región
SELECT Genero,round(SUM(ventas.Ventas_NA),2) AS America,round(SUM(ventas.Ventas_EU),2) AS 
Europa,round(SUM(ventas.Ventas_JP),2) AS Japón,round(SUM(ventas.Ventas_Otros),2) AS Otros
FROM ventas INNER JOIN genero
ON ventas.codGenero = genero.codGenero
GROUP BY Genero

SELECT Plataforma, SUM(Ventas_NA+Ventas_EU+Ventas_JP+Ventas_Otros) AS total, round(SUM(ventas.Ventas_NA),2) AS America,round(SUM(ventas.Ventas_EU),2) AS 
Europa,round(SUM(ventas.Ventas_JP),2) AS Japón,round(SUM(ventas.Ventas_Otros),2) AS Otros
FROM ventas INNER JOIN plataforma
ON ventas.codPlataforma = plataforma.codPlataforma
GROUP BY Plataforma
ORDER BY total DESC

10.	Total de todas las tablas para graficar correctamente en Power BI
SELECT ventas.Nombre, ventas.Año, ventas.Ventas_EU, ventas.Ventas_JP, ventas.Ventas_Otros, plataforma.Plataforma, genero.Genero, editorial.Editorial
FROM ventas INNER JOIN plataforma
ON ventas.codPlataforma = plataforma.codPlataforma
INNER JOIN genero
ON ventas.codGenero = genero.codGenero
INNER JOIN editorial
ON ventas.codEditorial = editorial.codEditorial


/* Base de datos: Facturación*/

/* Esquema: */
factura_cabecera(nro_factura,cod_cliente,fecha,forma_de_pago)
detalle_factura(nro_factura,linea_factura,cod_producto,cantidad,descuento,precio)
clientes(cod_cliente,nombre,apellidos,calle,nro,piso,puerta,telefono)
productos(cod_producto,nombre,cod_proveedor,cod_categoria,precio,igic)
proveedores(cod_proveedor,nombre)
categorias(cod_categoria,nombre)
impuestos(codigo,descripcion,valor)

1. Precio total de factura por cliente
SELECT factura_cabecera.nro_factura,factura_cabecera.fecha,factura_cabecera.cod_cliente,SUM(detalle_factura.cantidad * detalle_factura.precio) AS total
FROM factura_cabecera INNER JOIN detalle_factura
ON factura_cabecera.nro_factura = detalle_factura.nro_factura
GROUP BY factura_cabecera.nro_factura

2. Precio total de factura por cliente (VISTA 1 - incluyendo descuento e igic)
SELECT factura_cabecera.nro_factura,factura_cabecera.fecha,factura_cabecera.cod_cliente,round(SUM(detalle_factura.cantidad * detalle_factura.precio*(1-detalle_factura.descuento/100)*(1+impuestos.valor/100)),2) AS total
FROM factura_cabecera INNER JOIN detalle_factura
ON factura_cabecera.nro_factura = detalle_factura.nro_factura
INNER JOIN productos
ON detalle_factura.cod_producto = productos.cod_producto
INNER JOIN impuestos
ON productos.igic = impuestos.codigo
GROUP BY factura_cabecera.nro_factura

3. Precio total de la factura 1 (sin aplicar igic)
SELECT SUM(cantidad*precio*(1-descuento/100)) AS total
FROM detalle_factura
WHERE detalle_factura.nro_factura = 1

4. Totales por mes de cada factura
SELECT month(fecha) AS mes, SUM(totalesxfactura.total) AS totalmes
FROM totalesxfactura
GROUP BY mes

5. Producto más vendido (VISTA 2)
SELECT detalle_factura.cod_producto,productos.nombre,SUM(detalle_factura.cantidad) AS total
FROM detalle_factura INNER JOIN productos
ON detalle_factura.cod_producto = productos.cod_producto
GROUP BY detalle_factura.cod_producto
ORDER BY total DESC LIMIT 1

6. Mejor cliente (VISTA 3 - basándose en la VISTA 1)
SELECT totalesxfactura.cod_cliente,clientes.nombre,clientes.apellidos,SUM(totalesxfactura.total) AS total_vendido
FROM totalesxfactura INNER JOIN clientes
ON totalesxfactura.cod_cliente = clientes.cod_cliente
GROUP BY cod_cliente
ORDER BY total_vendido DESC LIMIT 1

7. Productos que nunca se han vendido (con subconsulta)
SELECT *
FROM productos
WHERE productos.cod_producto NOT IN (SELECT cod_producto
                                     FROM detalle_factura)

8. Productos que nunca se han vendido (sin subconsulta)
SELECT DISTINCT productos.cod_producto,productos.nombre,detalle_factura.cod_producto
FROM productos LEFT JOIN detalle_factura
ON productos.cod_producto = detalle_factura.cod_producto
WHERE detalle_factura.cod_producto IS NULL

9. Listado de todos los productos, ordenados de más vendido a menos vendido (incluyendo no vendidos)
SELECT productos.cod_producto,productos.nombre,SUM(detalle_factura.cantidad) AS cantidad
FROM productos LEFT JOIN detalle_factura
ON productos.cod_producto = detalle_factura.cod_producto
GROUP BY productos.cod_producto
ORDER BY cantidad DESC

10. Consulta 9 pero cambiando los NULL por 0
SELECT productos.cod_producto,productos.nombre,
IF(SUM(detalle_factura.cantidad) IS NULL,0,SUM(detalle_factura.cantidad)) AS cantidad
FROM productos LEFT JOIN detalle_factura
ON productos.cod_producto = detalle_factura.cod_producto
GROUP BY productos.cod_producto
ORDER BY cantidad DESC

11. Filtro segun las ventas de cada articulo (muy vendido, poco vendido, quitar)
SELECT productos.cod_producto,productos.nombre,
IF(SUM(detalle_factura.cantidad) IS NULL,0,SUM(detalle_factura.cantidad)) AS cantidad,
CASE
	WHEN SUM(detalle_factura.cantidad) > 30 THEN "Articulo muy vendido"
    WHEN SUM(detalle_factura.cantidad) > 10 THEN "Articulo poco vendido"
    ELSE "Hay que quitarse este articulo de encima"
END AS comentario
FROM productos LEFT JOIN detalle_factura
ON productos.cod_producto = detalle_factura.cod_producto
GROUP BY productos.cod_producto

12. Obtener longitud del campo nombre
SELECT productos.nombre,length(productos.nombre)
FROM productos

13. Unir los campos nombre y apellidos
SELECT concat(apellidos,",",nombre)
FROM productos

14. Obtener la posicion de los espacios en blanco
SELECT nombre,instr(nombre," ") AS posicion
FROM productos

15. Cortar la palabra desde la primera posicion hasta encontrar el espacios (traer primera palabra)
SELECT SUBSTRING(nombre,1,instr(nombre," ")) AS texto
FROM productos

16. Cortar la palabra desde el primer espacio hasta el final (traer segunda palabra)
SELECT SUBSTRING(nombre,1,instr(nombre," ")) AS texto1,
SUBSTRING(nombre,instr(nombre," ")+1) AS texto2
FROM productos

17. Convertir texto de minúsculas a mayúsculas (ucase o upper)
SELECT ucase(nombre) AS nombre
FROM productos

18. Convertir texto de mayúsculas a minúsculas (lcase o lower)
SELECT lcase(nombre) AS nombre
FROM productos

19. Darle formato a un número (redondea a 2 decimales como ROUND y TRUNCATE) -> CEIL redondea al entero superior
SELECT productos.cod_producto,productos.nombre,productos.precio,productos.precio*1.07 AS pvp1,
ROUND(productos.precio*1.07,2) AS "pvp-round",
FORMAT(productos.precio*1.07,2) AS "pvp-format",
CEIL(productos.precio*1.07) AS "pvp-ceil",
TRUNCATE(productos.precio*1.07,2) AS "pvp-truncate"
FROM productos

20. Mes,año, dia y dia de la semana actuales
SELECT month(curdate()) AS mes,
year(curdate()) AS año,
dayofmonth(curdate()) AS dia,
dayofweek(curdate()) AS dia_de_la_semana

21. Calcular edad, sumando 10 dias a la fecha actual
SELECT TIMESTAMPDIFF(YEAR,"1996/03/07",CURDATE()) AS edad,
DATEDIFF(CURDATE(),"1996/03/07") AS dias,
DATE_ADD(CURDATE(), INTERVAL 10 DAY) AS "+10 dias"

22. Actualizar valores de una columna
UPDATE factura_cabecera
SET factura_cabecera.forma_de_pago = 3
WHERE factura_cabecera.forma_de_pago = 15

23. Facturas que esten en factura_cabecera y no esten en detalle_factura
SELECT *
FROM factura_cabecera
WHERE nro_factura NOT IN(SELECT nro_factura
                         FROM detalle_factura)

24. Duplicar tabla detalle_factura y copiar el contenido de detalle_factura en auxiliar
CREATE TABLE auxiliar LIKE detalle_factura;
INSERT INTO auxiliar
SELECT *
FROM detalle_factura

25. Actualizar el campo nro_factura de auxiliar
UPDATE auxiliar
SET auxiliar.nro_factura = auxiliar.nro_factura+20

26. Borrar campos de la tabla auxiliar donde nro_factura sea > 32
DELETE
FROM auxiliar
WHERE auxiliar.nro_factura > 32

27. Añadir lo creado en auxiliar hacia detalle_factura
INSERT INTO detalle_factura
SELECT *
FROM auxiliar

28. Conectar la vista totalesxfactura con las tablas fpago y fpagocuota
SELECT *
FROM totalesxfactura INNER JOIN fpago
ON totalesxfactura.forma_de_pago = fpago.fdepago
INNER JOIN fpagocuota
ON totalesxfactura.forma_de_pago = fpagocuota.fdepago

29. Calcular fecha de pago de la factura
SELECT totalesxfactura.nro_factura,totalesxfactura.fecha,totalesxfactura.cod_cliente,
DATE_ADD(totalesxfactura.fecha,INTERVAL fpagocuota.dias DAY) AS fecha_pago
FROM totalesxfactura INNER JOIN fpago
ON totalesxfactura.forma_de_pago = fpago.fdepago
INNER JOIN fpagocuota
ON totalesxfactura.forma_de_pago = fpagocuota.fdepago

30. Añadir la columna de cuanto es la factura (a pagar), el cobro (tipo de pago) y el total, ordenado por numero de factura
SELECT totalesxfactura.nro_factura,totalesxfactura.fecha,totalesxfactura.cod_cliente,fpago.fdepago_descripcion AS "tipo pago",totalesxfactura.total,
DATE_ADD(totalesxfactura.fecha,INTERVAL fpagocuota.dias DAY) AS fecha_pago,
totalesxfactura.total*fpagocuota.cuota/100 AS "a pagar"
FROM totalesxfactura INNER JOIN fpago
ON totalesxfactura.forma_de_pago = fpago.fdepago
INNER JOIN fpagocuota
ON totalesxfactura.forma_de_pago = fpagocuota.fdepago
ORDER BY totalesxfactura.nro_factura

31. Vista de total ventas por mes
SELECT month(fecha) AS mes, SUM(totales_a_cobrar.total) AS totalmes
FROM totales_a_cobrar
GROUP BY mes;

32. Vista de total cobros por mes
SELECT month(fecha) AS mes, SUM(totales_a_cobrar.total) AS totalmes
FROM totales_a_cobrar
GROUP BY mes;

33. Función para unificar nombre y apellidos de los clientes
CREATE FUNCTION nombre_completo(nombre VARCHAR(20),apellido VARCHAR(50))
RETURNS VARCHAR(100)
RETURN CONCAT(apellido,nombre)

34. Función de saludo con el nombre del cliente
CREATE FUNCTION saludo(nombre varchar(20))
RETURNS varchar(100)
BEGIN
	DECLARE saludar text;
	SET saludar := "Hola";
	RETURN concat(@saludar," ",nombre);
END;
//

35. Función para calcular la letra del dni
CREATE FUNCTION dni(numero int)
RETURNS varchar(10)
BEGIN
	DECLARE letras text;
	SET letras := "TRWAGMYFPDXBNJZSQVHLCKET";
	RETURN substring(letras,numero mod 23,1);
END;
//

35. Función para calcular el total de ventas
CREATE FUNCTION totalventas(articulo INT)
RETURNS INT
BEGIN
	-- Paso 1. Declaramos una variable local
	DECLARE total INT UNSIGNED;
    -- Paso 2. Contamos las ventas
    SET total = (SELECT SUM(cantidad)
                 FROM detalle_factura
                 WHERE cod_producto = articulo);
    -- Paso 3. Devolvemos el resultado
    RETURN total;
END
//

36. Función para calcular el total vendido (en dinero)
CREATE FUNCTION totalfacturado(articulo INT)
RETURNS INT
BEGIN
	-- Paso 1. Declaramos una variable local
	DECLARE total float;
    -- Paso 2. Contamos las ventas
    SET total = (SELECT SUM(cantidad*precio*(1-detalle_factura.descuento/100))
                 FROM detalle_factura
                 WHERE cod_producto = articulo);
    -- Paso 3. Devolvemos el resultado
    RETURN total;
END
//

37. -- totalfacturadomes(cod_producto,fecha_desde,fecha_hasta)
    -- que sirva tanto para pasarle el cod_producto solo o con las fechas
CREATE FUNCTION totalfacturadomes(articulo INT,fechadesde DATE, fechahasta DATE)
RETURNS INT
BEGIN
	DECLARE total FLOAT;
    CASE
    	WHEN !(fechadesde IS NULL AND fechahasta IS NULL) THEN 
    		SET total = (SELECT SUM(cantidad*precio*(1-detalle_factura.descuento/100))
                 	 	 FROM detalle_factura INNER JOIN factura_cabecera
                    	 ON detalle_factura.nro_factura = factura_cabecera.nro_factura
                 		 WHERE detalle_factura.cod_producto = articulo AND factura_cabecera.fecha >= fechadesde
                   	  	 AND factura_cabecera.fecha <= fechahasta);
    		RETURN total;
    END CASE;
END
//

38. Función para calcular el factorial de un numero
CREATE FUNCTION factorial(numero INT)
RETURNS INT
BEGIN
	DECLARE total INT;
    SET total = 1;
    REPEAT
    	SET total = total * numero;
        SET numero = numero -1; 
        UNTIL numero = 1
    END REPEAT;
    RETURN total;
END
//

39. Procedimiento para añadir nuevas filas a las tablas factura_cabecera y detalle_factura
DROP PROCEDURE IF EXISTS altafactura
DELIMITER //
CREATE PROCEDURE altafactura(nro_factura INT, cod_cliente INT, fecha DATE, pago INT, producto INT, cantidad INT, descuento INT, precio FLOAT)
BEGIN
	INSERT INTO factura_cabecera(nro_factura,cod_cliente,fecha,forma_de_pago)
	VALUES (nro_factura,cod_cliente,fecha,pago);
    INSERT INTO detalle_factura(nro_factura,linea_factura,cod_producto,cantidad,descuento,precio)
    VALUES (nro_factura,1,producto,cantidad,descuento,precio);
END
//

40. Llamar a un procedimiento creado
CALL altafactura(33,1,"2023/10/09",1,1,1,0,50)

41. Proteger un campo dentro de un bloque de transacción
BEGIN
SET autocommit = off
START TRANSACTION;
	INSERT INTO factura_cabecera(nro_factura,cod_cliente,fecha,forma_de_pago)
	VALUES (nro_factura,cod_cliente,fecha,pago);
    INSERT INTO detalle_factura(nro_factura,linea_factura,cod_producto,cantidad,descuento,precio)
    VALUES (nro_factura,1,producto,cantidad,descuento,precio);
COMMIT;
END

42. Clonar una tabla con todo su contenido
CREATE TABLE historico AS SELECT * FROM ultimo;

43. Crear un trigger para la tabla historico
DELIMITER //
CREATE TRIGGER historico
BEFORE UPDATE
ON ultimo FOR EACH ROW
BEGIN
END
//

44. Trigger para actualizar los valores antiguos
DELIMITER //
CREATE TRIGGER historico
BEFORE UPDATE
ON ultimo FOR EACH ROW
BEGIN
	INSERT INTO historico (contador,fecha,nombre)
    VALUES (old.contador,now(),old.nombre);
END
//

45. Comprobar funcionamiento del trigger
UPDATE ultimo SET nombre = "Pedro"
WHERE contador = 1

46. Contador para eliminación
DELIMITER //
CREATE TRIGGER historico_ultimo_eliminacion
BEFORE DELETE ON ultimo FOR EACH ROW
BEGIN
	INSERT INTO historico (contador,fecha,tipo,nombre)
    VALUES (old.contador,now(),"E",old.nombre);
END
//

47. Trigger para actualizar en historico_productos
DELIMITER //
CREATE TRIGGER before_productos
BEFORE UPDATE
ON productos FOR EACH ROW
BEGIN
	INSERT INTO historico_productos (cod_producto,fecha,tipo,nombre,cod_proveedor,cod_categoria,precio,igic)
    VALUES (old.cod_producto,now(),"M",old.nombre,old.cod_proveedor,old.cod_categoria,old.precio,old.igic);
END
//

48. Trigger para borrar en historico_productos
DELIMITER //
CREATE TRIGGER before_delete
BEFORE DELETE
ON productos FOR EACH ROW
BEGIN
	INSERT INTO historico_productos (cod_producto,fecha,tipo,nombre,cod_proveedor,cod_categoria,precio,igic)
    VALUES (old.cod_producto,now(),"E",old.nombre,old.cod_proveedor,old.cod_categoria,old.precio,old.igic);
END
//

49. Actualizar el precio de los productos del proveedor 23
UPDATE productos
SET precio = precio * 1.10
WHERE cod_proveedor = 23

50. Procedimiento para devolver una cantidad de valores
DELIMITER //
CREATE PROCEDURE ventas_articulos(IN cod_producto INT)
BEGIN
	SELECT fecha,cantidad,descuento,precio
    FROM factura_cabecera INNER JOIN detalle_factura
    ON factura_cabecera.nro_factura = detalle_factura.nro_factura
    WHERE detalle_factura.cod_producto = cod_producto
    ORDER BY fecha;
END
//

51. Llamada al procedimiento
CALL ventas_articulos(22)

52. Actualizar la cantidad total del producto sumandolo con el total anterior
SET @total = 0;
SELECT cod_producto,cantidad,@total := @total + cantidad AS total,descuento,precio
FROM detalle_factura
WHERE cod_producto = 3;

53. Inlcuir la cantidad total en el procedimiento realizado anteriormente
BEGIN
SET @total = 0;
	SELECT fecha,cantidad,@total := @total + cantidad AS total,descuento,precio
    FROM factura_cabecera INNER JOIN detalle_factura
    ON factura_cabecera.nro_factura = detalle_factura.nro_factura
    WHERE detalle_factura.cod_producto = cod_producto
    ORDER BY fecha;
END

54. Particionar las facturas por mes
SELECT month(fecha) AS mes,factura_cabecera.nro_factura,COUNT(*) OVER(PARTITION BY month(fecha)) AS cantidad
FROM factura_cabecera

55. Porcentaje del total de facturas, particionadas por mes (porcentaje_ventas)
SELECT totalesxfactura.nro_factura,totalesxfactura.fecha,total,ROUND(total / SUM(total) OVER(PARTITION BY month(fecha)) *100,2) AS porcentaje
FROM totalesxfactura

56. Igual pero particionando por cod_cliente y añadiendo las columnas de nombre y apellido
SELECT totalesxfactura.cod_cliente,nombre,apellidos,totalesxfactura.nro_factura,totalesxfactura.fecha,total,ROUND(total / SUM(total) OVER(PARTITION BY totalesxfactura.cod_cliente) *100,2) AS porcentaje
FROM totalesxfactura INNER JOIN clientes
ON totalesxfactura.cod_cliente = clientes.cod_cliente

57. Ventas totales por cliente, con porcentaje sobre el total
SET @total = (SELECT SUM(total) FROM totalesxfactura);
SELECT clientes.cod_cliente,nombre,apellidos,ROUND(SUM(totalesxfactura.total)/@total*100,2) AS total
FROM totalesxfactura INNER JOIN clientes
ON totalesxfactura.cod_cliente = clientes.cod_cliente
GROUP BY totalesxfactura.cod_cliente

58. Procedimiento para la consulta 57
DELIMITER //
CREATE PROCEDURE porcentajes_por_cliente()
BEGIN
	SET @total = (SELECT SUM(total) FROM totalesxfactura);
	SELECT clientes.cod_cliente,nombre,apellidos,ROUND(SUM(totalesxfactura.total)/@total*100,2) AS total
	FROM totalesxfactura INNER JOIN clientes
	ON totalesxfactura.cod_cliente = clientes.cod_cliente
	GROUP BY totalesxfactura.cod_cliente
    ORDER BY total DESC;
END
//

59. Crear una tabla con el resultado de una consulta
CREATE TABLE subclientes AS
SELECT *
FROM mejor_cliente

/* Base de datos: Proyectos*/

/* Esquema: */
empleado(dni,nombre,categoria,titulacion,ciudad,salario,cod_suc)
sucursal(cod_suc,ciudad,nombre,telefono,dni_dir)
ciudades(cod_ciudad,ciudad)
proyecto(cod_pro,nombre,descripcion,dni_resp,meses)
desarrolla(cod_pro,dni)

1. Actualizar el campo dni_dir a 8 digitos
UPDATE sucursal
SET sucursal.dni_dir = LEFT(sucursal.dni_dir,8)

2. Proyectos por ciudad
SELECT ciudades.cod_ciudad,ciudades.ciudad,COUNT(*) AS proyectos
FROM proyecto INNER JOIN empleado
ON proyecto.dni_resp = empleado.dni
INNER JOIN sucursal
ON empleado.dni = sucursal.dni_dir
INNER JOIN ciudades
ON sucursal.ciudad = ciudades.cod_ciudad
GROUP BY ciudades.cod_ciudad

3. Total gastos responsable por proyecto
SELECT proyecto.cod_pro,proyecto.nombre,(proyecto.meses * empleado.salario) AS total
FROM proyecto INNER JOIN empleado
ON proyecto.dni_resp = empleado.dni

4. Total gastos empleados por proyecto
SELECT proyecto.cod_pro,proyecto.nombre,SUM(proyecto.meses * empleado.salario) AS total
FROM proyecto INNER JOIN desarrolla
ON proyecto.cod_pro = desarrolla.cod_pro
INNER JOIN empleado
ON desarrolla.dni = empleado.dni
GROUP BY proyecto.cod_pro

5. Total gastos personal por proyecto
SELECT cod_pro,nombre,SUM(total) AS gastos_personal
FROM (SELECT proyecto.cod_pro,proyecto.nombre,(proyecto.meses * empleado.salario) AS total
      FROM proyecto INNER JOIN empleado
      ON proyecto.dni_resp = empleado.dni

UNION ALL

	SELECT proyecto.cod_pro,proyecto.nombre,SUM(proyecto.meses * empleado.salario) AS total
	FROM proyecto INNER JOIN desarrolla
	ON proyecto.cod_pro = desarrolla.cod_pro
	INNER JOIN empleado
	ON desarrolla.dni = empleado.dni
	GROUP BY proyecto.cod_pro) AS gastos

GROUP BY cod_pro

6. Añadir responsables de proyectos
INSERT into desarrolla
(SELECT proyecto.cod_pro,proyecto.dni_resp AS dni,1 AS responsable
FROM proyecto)

7. Nuevo cálculo de gastos personal
SELECT proyecto.cod_pro,proyecto.nombre,SUM(proyecto.meses * empleado.salario) AS total
FROM proyecto INNER JOIN desarrolla
ON proyecto.cod_pro = desarrolla.cod_pro
INNER JOIN empleado
ON desarrolla.dni = empleado.dni
GROUP BY proyecto.cod_pro
