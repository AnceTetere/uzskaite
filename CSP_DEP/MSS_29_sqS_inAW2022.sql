USE AdventureWorks2022
GO

SELECT * FROM Sales.SalesOrderDetail;
SELECT * FROM Production.Product WHERE Name = 'Cable Lock';
SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = 843;

SELECT * FROM Production.Product WHERE Name = 'Blade';
SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = 316;

SELECT *
FROM Sales.SalesOrderDetail
WHERE ProductID = (SELECT ProductID
                   FROM Production.Product
				   WHERE Name = 'Blade');

SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = (SELECT ProductID
                   FROM Production.Product
				   WHERE Name = 'Cable Lock');

SELECT COUNT(*) FROM Sales.SalesOrderDetail
WHERE ProductID = (SELECT ProductID
                   FROM Production.Product
				   WHERE Name = 'Cable Lock');

------*****-----
SELECT * FROM Sales.SalesOrderDetail;
SELECT * FROM Production.Product
WHERE Name = 'Cable Lock';
SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = 843;

SELECT * FROM Production.Product
 WHERE Name = 'Blade';
SELECT * FROM Sales.SalesOrderDetail
 WHERE ProductID = 316;

SELECT * FROM Sales.SalesOrderDetail
 WHERE ProductID = (SELECT ProductID
                     FROM Production.Product
					 WHERE Name = 'Cable Lock');