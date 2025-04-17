USE AdventureWorks2022
GO

CREATE TABLE Person.StateProvinceTest(
   StateProvinceID int IDENTITY(1,1) Primary Key NOT NULL,
   StateProvinceCode nchar(3) NOT NULL,
   CountryRegionCode nvarchar(3) NOT NULL,
   IsOnlyStateProvinceFlag dbo.Flag NOT NULL,
   Name nvarchar(50) NOT NULL,
   TerritoryID int NOT NULL,
   ModifiedDate datetime NOT NULL)

--Insert data into a table using subquery
INSERT INTO Person.StateProvinceTest
   SELECT StateProvinceCode,
          CountryRegionCode,
		  IsOnlyStateProvinceFlag,
		  Name,
		  TerritoryID,
		  ModifiedDate
   FROM Person.StateProvince;

SELECT * FROM Person.StateProvinceTest;

--Update table with a subquery
--Change the TerritoryIDog CA to 99
UPDATE Person.StateProvinceTest
SET TerritoryID = 99
WHERE CountryRegionCode IN (SELECT CountryRegionCode
                            FROM Person.StateProvince
							WHERE CountryRegionCode = 'CA');

SELECT * FROM Person.StateProvinceTest;

--Delete data from the table with a subquery.
DELETE FROM Person.StateProvinceTest
WHERE CountryRegionCode IN (SELECT CountryRegionCode
                            FROM Person.StateProvince
							WHERE CountryRegionCode = 'CA');

SELECT *
FROM Person.StateProvinceTest;
            
