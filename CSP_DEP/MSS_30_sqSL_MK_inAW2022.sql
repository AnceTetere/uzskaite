USE AdventureWorks2022
GO

--The subquery returns a single row.
SELECT COUNT(*)
FROM Sales.SalesOrderDetail
WHERE ProductID = (SELECT ProductID
                   FROM Production.Product
				   WHERE Name = 'Cable Lock');

/*Which products have not been ordered yet?
  The subquery that returns multiple rows.*/

--1 The following query retrieves all products that have been ordered.
SELECT *
FROM Production.Product
WHERE ProductID IN (SELECT ProductID
                    FROM Sales.SalesOrderDetail);

--2 The following query retrieves all producs that have not been ordered.
SELECT *
FROM Production.Product
WHERE ProductID NOT IN (SELECT ProductID
                        FROM Sales.SalesOrderDetail);

--3 In the following SELECT statement, the subquery is correlated.
SELECT *
FROM Production.Product AS P
WHERE NOT EXISTS (SELECT ProductID
                 FROM Sales.SalesOrderDetail AS S
				 WHERE P.ProductID = S.ProductID);