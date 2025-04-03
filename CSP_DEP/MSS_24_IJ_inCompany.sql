USE Company
GO

SELECT * FROM tableEmployees;
SELECT * FROM tableDepartments;
SELECT * FROM tableEmployees, tableDepartments;

SELECT EmployeeID, EmployeeName, DepartmentName
FROM tableEmployees, tableDepartments;

SELECT EmployeeID, EmployeeName, DepartmentName
FROM tableEmployees
JOIN tableDepartments
ON tableEmployees.DepID = tableDepartments.DepID;

SELECT EmployeeID, EmployeeName, DepartmentName
FROM tableEmployees AS A
JOIN tableDepartments AS B
ON A.DepID = B.DepID;



----------------************--------------------
USE AdventureWorks2022
GO

SELECT * FROM Person.Person;
SELECT * FROM Person.EmailAddress;

SELECT * 
FROM Person.Person
INNER JOIN Person.EmailAddress
ON Person.BusinessEntityID = EmailAddress.BusinessEntityID;

SELECT FirstName, LastName, EmailAddress
FROM Person.Person
JOIN Person.EmailAddress
ON Person.BusinessEntityID = EmailAddress.BusinessEntityID;

----------
USE Company
GO

--JOIN / INNER JOIN
SELECT * FROM tableEmployees;
SELECT * FROM tableDepartments;

SELECT * FROM tableEmployees, 
              tableDepartments;

SELECT EmployeeID, EmployeeName, DepartmentName
FROM tableEmployees,
     tableDepartments;

SELECT EmployeeID, EmployeeName, DepartmentName
FROM tableEmployees
JOIN tableDepartments
ON tableEmployees.DepID = tableDepartments.DepID;
