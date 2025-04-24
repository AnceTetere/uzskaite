--Date conversion
SELECT GETDATE();
SELECT CONVERT(varchar, GETDATE());
SELECT CONVERT(varchar, GETDATE(), 1);

SELECT
   CONVERT(varchar, GETDATE(), 1) AS 'Format-1',
   CONVERT(varchar, GETDATE(), 2) AS 'Format-2',
   CONVERT(varchar, GETDATE(), 3) AS 'Format-3',
   CONVERT(varchar, GETDATE(), 4) AS 'Format-4',
   CONVERT(varchar, GETDATE(), 5) AS 'Format-5',
   CONVERT(varchar, GETDATE(), 6) AS 'Format-6',
   CONVERT(varchar, GETDATE(), 7) AS 'Format-7',
   CONVERT(varchar, GETDATE(), 10) AS 'Format-10'

USE AdventureWorks2022
GO

SELECT BirthDate FROM HumanResources.Employee;
SELECT CONVERT(varchar, BirthDate, 1) FROM HumanResources.Employee;
SELECT DATEDIFF(YEAR, CONVERT(varchar, BirthDate, 10), GETDATE()) FROM HumanResources.Employee;

--Time Conversion
SELECT
   CONVERT(varchar, GETDATE(), 8) AS 'Format-8',
   CONVERT(varchar, GETDATE(), 14) AS 'Format-14',
   CONVERT(varchar, GETDATE(), 24) AS 'Format-24',
   CONVERT(varchar, GETDATE(), 108) AS 'Format-108'

--Datetime Conversion
SELECT
   CONVERT(varchar, GETDATE(), 0) AS 'Format-0',
   CONVERT(varchar, GETDATE(), 9) AS 'Format-9',
   CONVERT(varchar, GETDATE(), 13) AS 'Format-13',
   CONVERT(varchar, GETDATE(), 20) AS 'Format-20',
   CONVERT(varchar, GETDATE(), 21) AS 'Format-21',
   CONVERT(varchar, GETDATE(), 22) AS 'Format-22',
   CONVERT(varchar, GETDATE(), 25) AS 'Format-25'