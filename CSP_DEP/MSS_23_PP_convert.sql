﻿USE AdventureWorks2022
GO

SELECT CONVERT(int, 5.45);
SELECT CAST(5.45 AS int);

SELECT CONVERT(float, 5.45);
SELECT CAST(5.45 AS float);

SELECT CONVERT(varchar, 5.45);
SELECT CAST(5.45 AS varchar);

SELECT CONVERT(varchar, '2020-01-07') AS TextToDateTime;
SELECT CAST('2020-01-07' AS varchar) AS TextToDateTime;

SELECT * FROM Person.Person;
SELECT FirstName, LastName, ModifiedDate FROM Person.Person;

--Pilns datums konvertēts
SELECT FirstName, LastName, ModifiedDate,
	CAST (ModifiedDate as varchar) AS DateToText
FROM Person.Person;

--Konvertētā datuma pirmās 7 zīmes.
SELECT FirstName, LastName, ModifiedDate,
	CAST (ModifiedDate as varchar(7)) AS DateToText
FROM Person.Person;

--Konvertēts datums 11 zīmēs.
SELECT FirstName, LastName, ModifiedDate,
	CONVERT(varchar(11), ModifiedDate) DateToText
FROM Person.Person;