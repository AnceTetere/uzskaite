--String Function
--LEN() function
SELECT LEN('OAK ACADEMY 2020')

--LEFT() function
SELECT LEFT('OAK ACADEMY 2020', 3)
SELECT LEFT('OAK ACADEMY 2020', 11)

--TRIM() function
SELECT TRIM('OAK ACADEMY                      ')

--LOWER() function
SELECT LOWER('OAK ACADEMY 2020')

--UPPER() function
SELECT UPPER('oak academy 2020')

USE AdventureWorks2022
GO

SELECT FirstName, LastName FROM Person.Person;
SELECT UPPER(FirstName), UPPER(LastName)
FROM Person.Person;

--REVERSE() function
SELECT REVERSE('OAK ACADEMY 2020');

--REPLACE() function
SELECT REPLACE('OAK ACADEMY 2020', '2020', '2021');

--SUBSTRING() function
SELECT SUBSTRING('OAK ACADEMY 2020', 5, 12);

----------------------*********************------------------------
--String Functions
--Len function
SELECT LEN('OAK ACADEMY 2020');

--Left function
SELECT LEFT('OAK ACADEMY 2020', 3)
SELECT LEFT('OAK ACADEMY 2020', 11)

--Trim function
SELECT TRIM('OAK ACADEMY         ')

--Lower function
SELECT LOWER('OAK ACADEMY 2020')

--Upper function
SELECT UPPER('oak academy 2020')

USE AdventureWorks2022
GO

SELECT FirstName, LastName FROM Person.Person;
SELECT UPPER(FirstName), UPPER(LastName) FROM Person.Person;

--Reverse function
SELECT REVERSE('OAK ACADEMY 2020')

--Replace function
SELECT REPLACE('OAK ACADEMY 2020', '2020', '2021');

--Substring function
SELECT SUBSTRING('OAK ACADEMY 2020', 5, 12);