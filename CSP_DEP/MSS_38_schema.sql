USE AdventureWorks2022
GO

--Create schema
CREATE SCHEMA TestSchema
AUTHORIZATION Test_User;

--Create a table In A Schema
CREATE TABLE dbo.Departments
(
	ID int Not Null,
	DepartmentName varchar Not Null
)

CREATE TABLE TestSchema.Departments
(
	ID int Not Null,
	DepartmentName varchar Not Null
)

--Change schema name of a table
CREATE SCHEMA NewSchema

ALTER SCHEMA NewSchema
TRANSFER TestSchema.Departments;

--Drop a schema
DROP SCHEMA TestSchema
DROP SCHEMA NewSchema

ALTER SCHEMA HumanResources
TRANSFER NewSchema.Departments


--Create view
GO
CREATE VIEW VPersonWithMailAddress AS
SELECT FirstName, LastName, EmailAddress 
FROM Person.Person AS P
JOIN Person.EmailAddress AS E
ON P.BusinessEntityID = E.BusinessEntityID
GO

SELECT * FROM VPersonWithMailAddress
DROP VIEW VPersonWithMailAddress























---------------
--Create Login and User
CREATE LOGIN Test_User WITH PASSWORD = '7279';
GO
USE AdventureWorks2022;
GO
CREATE USER Test_User FOR LOGIN Test_User;

--Create Schema
CREATE SCHEMA TestSchema
AUTHORIZATION Test_User

--Create table in a schema
CREATE TABLE Departments  --A table created in the default schema as dbo.Departments
	(ID int Not Null,
	  DepartmentName varchar Not Null)

CREATE TABLE TestSchema.Departments --A table is created in the TestSchema as TestSchema.Departments
   (ID INT Not Null,
	DepartmentName varchar Not Null)

--Change schema name of a table
CREATE SCHEMA NewTestSchema

ALTER SCHEMA NewTestSchema
TRANSFER TestSchema.Departments

--Drop a schema
DROP SCHEMA TestSchema

ALTER SCHEMA HumanResources
TRANSFER NewTestSchema.Departments

DROP SCHEMA NewTestSchema

--Create view
SELECT * FROM Person.Person
SELECT * FROM Person.EmailAddress

SELECT * FROM Person.Person AS P
JOIN Person.EmailAddress AS E
ON P.BusinessEntityID = E.BusinessEntityID

CREATE VIEW VPersonWithEmailAddress AS
	SELECT FirstName, LastName, EmailADdress
	FROM Person.Person AS P
	JOIN Person.EmailAddress AS E
	ON P.BusinessEntityID = E.BusinessEntityID

SELECT * FROM VPersonWithEmailAddress

DROP VIEW VPersonWithEmailAddress