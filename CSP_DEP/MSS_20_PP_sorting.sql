USE AdventureWorks2022
GO

--Use Person.Person table
SELECT * FROM Person.Person;

SELECT DISTINCT PersonType
FROM Person.Person;

SELECT DISTINCT PersonType, FirstName
FROM Person.Person;

SELECT TOP (20) *
FROM Person.Person;

SELECT FirstName, MiddleName, LastName
FROM Person.Person;

SELECT FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY FirstName; --Orders in ascending order by default

--Ascending sorting
SELECT FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY FirstName ASC; --Ascending order by the FirstName as before.

--Descending sorting
SELECT FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY FirstName DESC; --Orders in descending order using DESC.


SELECT * FROM Production.ProductInventory;

SELECT SUM(Quantity)
FROM Production.ProductInventory;

SELECT Shelf, SUM(Quantity)
FROM Production.ProductInventory; --Returns error

SELECT Shelf, SUM(Quantity)
FROM Production.ProductInventory
GROUP BY Shelf
ORDER BY Shelf;

SELECT Shelf, 
      SUM(Quantity) AS Quantity,
	  SUM(Bin) AS Bin
FROM Production.ProductInventory
GROUP BY Shelf
ORDER BY Shelf;

SELECT Shelf,
	   SUM(Quantity) AS Quantity,
	   SUM(Bin) AS Bin
FROM Production.ProductInventory
GROUP BY Shelf
HAVING Shelf = 'A'
ORDER BY Shelf;

SELECT Shelf,
       SUM(Quantity) AS Quantity,
	   SUM(Bin) AS Bin
FROM Production.ProductInventory
WHERE Shelf = 'A'
GROUP BY Shelf;

SELECT Shelf,
       SUM(Quantity) AS Quantity,
	   SUM(Bin) AS Bin
FROM Production.ProductInventory
GROUP BY Shelf
HAVING SUM(Quantity) > 10000
ORDER BY Shelf;

SELECT Shelf,
       SUM(Quantity) AS Quantity,
	   SUM(Bin) AS Bin
FROM Production.ProductInventory
WHERE Shelf = 'A'
GROUP BY Shelf;