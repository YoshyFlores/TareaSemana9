
--BY: Yosselin Roxana Flores García
USE Northwind;
--***********************************************************************************
--Ejercicio 1: Utilice la función DATEDIFF para obtener la diferencia en días entre OrderData y
--RequiredDate de la tabla orders
--DATEDIFF() obtiene la diferencia entre rangos de fecha
SELECT OrderID, CustomerID, DATEDIFF(day, OrderDate, RequiredDate) dias FROM Orders;

--*************************************************************************************
--Ejercicio 2: Muestra el número de clientes, la primera fecha y la fecha más reciente de la tabla orders.
SELECT COUNT(CustomerID) Clientes, MIN(OrderDate) PrimeraFecha, MAX(OrderDate) FechaReciente
FROM Orders;

--**************************************************************************************
--Ejercicio 3: Mostrar companyName de la tabla customers, en donde City sea diferente de
--Country y country no sea Mexico.

SELECT CompanyName, City, Country FROM Customers
WHERE City!=Country AND NOT Country='Mexico';


--**************************************************************************************
--Ejercicio 4: Mostrar la cantidad de pedidos realizados por un cliente de la tabla orders en donde
--los pedidos sean mayores a 5 y menores a 10 (Muestre 3 resultados, el primero
--utilizando >=,<=; el segundo utilizando BETWEEN y el tercero utilizando IN).

--Utilizando >= , <=
SELECT CustomerID, COUNT(OrderID) Pedidos FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID)>=5 AND COUNT(OrderID)<=10;

--Utilizando BETWEEN
SELECT CustomerID, COUNT(OrderID) Pedidos FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) BETWEEN 5 AND 10;


--Utilizando IN
SELECT CustomerID, COUNT(OrderID) FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) IN(5,6,7,8,9,10);


--********************************************************************************************
--Ejercicio5: Mostrar el código del cliente y la fecha que realizo la orden de la tabla orders,
--deberá mostrar solo las del año 1998, utilice el operador LIKE y la función YEAR

--Utilizando solo el operador LIKE
SELECT CustomerID, OrderDate FROM Orders WHERE OrderDate LIKE '%1998%'; 

--Utilizando solo la funcion YEAR
SELECT CustomerID, OrderDate FROM Orders
WHERE YEAR(OrderDate)=1998;

--Haciendo uso del operador LIKE y la función YEAR
SELECT CustomerID, OrderDate FROM Orders
WHERE YEAR(OrderDate) LIKE '%1998';
