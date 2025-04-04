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