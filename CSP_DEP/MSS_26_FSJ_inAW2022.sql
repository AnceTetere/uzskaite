--Full (Outer) Join
--Product table is the left table.
--SalesOrderDetail is the right table
SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
FULL JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

--Self Join that finds products with the same listed price
SELECT * 
FROM Production.Product P1
JOIN Production.Product P2
ON P1.ListPrice = P1.ListPrice
	AND P1.ListPrice <> 0   --Excludes products with no price
	AND P1.Name <> P2.Name --Exclude the same product
ORDER BY P1.ListPrice;

--Self join with alias
SELECT P1.Name, P2.Name, P1.ListPrice
FROM Production.Product AS P1, Production.Product AS P2
WHERE P1.ListPrice = P2.ListPrice
	AND P1.ListPrice <> 0
	AND P1.Name <> P2.Name
ORDER BY ListPrice;

---------------*************----------
--Full (Outer) Join
SELECT Name, SalesOrderDetailID
FROM Production.Product AS P
FULL JOIN Sales.SalesOrderDetail AS S
ON P.ProductID = S.ProductID;

--Self Join
SELECT P1.Name, P2.Name, P1.ListPrice
FROM Production.Product AS P1
JOIN Production.Product AS P2
ON P1.ListPrice = P2.ListPrice 
   AND P1.ListPrice <> 0   --Excludes products without a price
   AND P1.Name <> P2.Name --Excludes the same products
ORDER BY ListPrice;

--Self Join with Alias
SELECT P1.Name, P2.Name, P1.ListPrice
FROM Production.Product AS P1, Production.Product AS P2
WHERE P1.ListPrice = P2.ListPrice
      AND P1.ListPrice <> 0     -- Excludes the products with the same price
	  AND P1.Name <> P2.Name;   -- Excludes the same products