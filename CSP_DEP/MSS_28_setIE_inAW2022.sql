USE AdventureWorks2022
GO

--INTERSECT
--1 The table below is the one that will be used.
SELECT * FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee
WHERE Gender = 'M';  -- Job titles for males (206 rows).

SELECT JobTitle
FROM HumanResources.Employee
WHERE Gender = 'F';  -- Job titles for females (84 rows).

--2 Job titles for all positions held by both men and women will be extracted from the table.
SELECT JobTitle
FROM HumanResources.Employee
WHERE Gender = 'M'   --Job titles held by males (206 rows).
INTERSECT   --26 job titles
SELECT JobTitle
FROM HumanResources.Employee
WHERE Gender = 'F';  --Job titles held by females (84 rows).

--3 An equivalent result can be obtained by employing a self join.
SELECT DISTINCT EM.JobTitle
FROM HumanResources.Employee AS EM
JOIN HumanResources.Employee AS EF
ON EM.JobTitle = EF.JobTitle
	AND EM.Gender = 'M'
	AND EF.Gender = 'F';

--EXCEPT
SELECT JobTitle
FROM HumanResources.Employee
WHERE Gender = 'M'    --Job titles held by males (206 rows).
EXCEPT                -- 31 job titles are held only by males.
SELECT JobTitle
FROM HumanResources.Employee
WHERE Gender = 'F';   --Job titles held by females (84 rows).