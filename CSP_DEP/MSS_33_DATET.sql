--DATE CONVERSION
SELECT CONVERT(varchar, GETDATE());

--Date only formats
--1: 12/30/06
SELECT CONVERT(varchar, GETDATE(), 1);

--2: 25.04.29
SELECT CONVERT(varchar, GETDATE(), 2);

--3: 29/04/25
SELECT CONVERT(varchar, GETDATE(), 3);

--4: 29.04.25
SELECT CONVERT(varchar, GETDATE(), 4);

--5: 29-04-25
SELECT CONVERT(varchar, GETDATE(), 5);

--6: 29 Apr 25
SELECT CONVERT(varchar, GETDATE(), 6);

--7: Apr 29, 25
SELECT CONVERT(varchar, GETDATE(), 7);

--10: 04-29-25
SELECT CONVERT(varchar, GETDATE(), 10);

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
SELECT CONVERT(varchar, BirthDate, 10) FROM HumanResources.Employee;

SELECT DATEDIFF(year, CONVERT(varchar, BirthDate, 10), GETDATE())
FROM HumanResources.Employee;

--Date only formats (cont.)
--11: 25/05/01
SELECT CONVERT(varchar, GETDATE(), 11);

--12: 250501
SELECT CONVERT(varchar, GETDATE(), 12);

--23: 2025-05-01
SELECT CONVERT(varchar, GETDATE(), 23);

--101: 05/01/2025
SELECT CONVERT(varchar, GETDATE(), 101);

--102: 2025.05.01
SELECT CONVERT(varchar, GETDATE(), 102);

--103: 01/05/2025
SELECT CONVERT(varchar, GETDATE(), 103);

--104: 01.05.2025
SELECT CONVERT(varchar, GETDATE(), 104);

--Time only formats
--8: 12:05:45
SELECT CONVERT(varchar, GETDATE(), 8);

--14: 12:06:31:457
SELECT CONVERT(varchar, GETDATE(), 14);

--24: 12:07:14
SELECT CONVERT(varchar, GETDATE(), 24);

--108: 12:07:54
SELECT CONVERT(varchar, GETDATE(), 108);

--114: 12:08:29:870
SELECT CONVERT(varchar, GETDATE(), 114);

--Time Conversion
SELECT
	CONVERT(varchar, GETDATE(), 8) AS 'Format-8',
	CONVERT(varchar, GETDATE(), 14) AS 'Format-14',
	CONVERT(varchar, GETDATE(), 24) AS 'Format-24',
	CONVERT(varchar, GETDATE(), 108) AS 'Format-108'

--Date and time formats
--0: May  1 2025 12:42PM
SELECT CONVERT(varchar, GETDATE(), 0);

--9: May  1 2025 12:43:13:287PM
SELECT CONVERT(varchar, GETDATE(), 9);

--13: 01 May 2025 12:43:54:187
SELECT CONVERT(varchar, GETDATE(), 13);

--20: 2025-05-01 12:44:37
SELECT CONVERT(varchar, GETDATE(), 20);

--21: 2025-05-01 12:46:37.890
SELECT CONVERT(varchar, GETDATE(), 21);

--22: 05/01/25 12:47:18 PM
SELECT CONVERT(varchar, GETDATE(), 22);

--25: 2025-05-01 12:47:52.553
SELECT CONVERT(varchar, GETDATE(), 25);

SELECT
	CONVERT(varchar, GETDATE(), 0) AS 'Format-0',
	CONVERT(varchar, GETDATE(), 9) AS 'Format-9',
	CONVERT(varchar, GETDATE(), 13) AS 'Format-13',
	CONVERT(varchar, GETDATE(), 20) AS 'Format-20',
	CONVERT(varchar, GETDATE(), 21) AS 'Format-21',
	CONVERT(varchar, GETDATE(), 22) AS 'Format-22',
	CONVERT(varchar, GETDATE(), 25) AS 'Format-25'

------------***************-----------------
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