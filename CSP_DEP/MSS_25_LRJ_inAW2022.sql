USE AdventureWorks2022
GO

SELECT * FROM Production.Product;
SELECT * FROM Sales.SalesOrderDetail;

SELECT *
FROM Production.Product
LEFT JOIN Sales.SalesOrderDetail
ON Product.ProductID = SalesOrderDetail.ProductID;

SELECT Name, SalesOrderDetailID
FROM Production.Product
LEFT JOIN Sales.SalesOrderDetail
ON Product.ProductID = SalesOrderDetail.ProductID;

SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
LEFT JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
LEFT OUTER JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

--Right Outer Join
SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
RIGHT OUTER JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID; --Šis atgriež 121 317 rindas, kamēr kreisajā savienojumā bija 121 555

--Tas tāpēc, ka Product tabulā ir produkti ar ID, kas nav SalesOrderDetail tabulā, un attiecīgi uzrādās kā nulles.
--To var pārbaudīt kreisajā savienojumā.
SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
LEFT OUTER JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID
WHERE SalesOrderDetailID IS NULL; --238 rindas

--Attiecīgi:
SELECT 238 + 121317 -- =121555

---------------------------------*******************-------------------------------
--Left (Outer) Join
SELECT * FROM Production.Product;
SELECT * FROM Sales.SalesOrderDetail;

SELECT * 
FROM Production.Product
LEFT JOIN Sales.SalesOrderDetail
ON Product.ProductID = SalesOrderDetail.ProductID;

SELECT Name, SalesOrderDetailID
FROM Production.Product
LEFT JOIN Sales.SalesOrderDetail
ON Product.ProductID = SalesOrderDetail.ProductID;

SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
LEFT JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
LEFT OUTER JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

--Right (Outer) Join
SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
RIGHT OUTER JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

--Pārbaude
SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
LEFT OUTER JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL; -- Te rodas rindu atšķirība no LEFT JOIN

SELECT Name, salesOrderDetailID
FROM Production.Product AS P
RIGHT JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;









