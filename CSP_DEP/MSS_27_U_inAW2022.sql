USE AdventureWorks2022
GO

--Look at the tables that are going to be used.
SELECT * FROM Sales.CountryRegionCurrency; --109 rows
SELECT * FROM Sales.Currency;              --105 rows

--UNION
SELECT CurrencyCode 
FROM Sales.CountryRegionCurrency
UNION
SELECT CurrencyCode
FROM Sales.Currency; --105 rows because UNION returns distinct rows

--UNION ALL
SELECT CurrencyCode  --109 rows
FROM Sales.CountryRegionCurrency
UNION ALL
SELECT CurrencyCode  --105 rows
FROM Sales.Currency;

SELECT 109 + 105; --214 rows
