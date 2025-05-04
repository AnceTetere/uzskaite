USE AdventureWorks2022
GO

--SQL TRANSACTIONS
SELECT * FROM Person.Person;

UPDATE Person.Person
SET FirstName = 'Tom'
WHERE BusinessEntityID = 2;

BEGIN TRANSACTION --Begin Transaction
	UPDATE Person.Person
	SET FirstName = 'Terri'
	WHERE BusinessEntityID = 2
ROLLBACK;

BEGIN TRAN --Begin Transaction
	UPDATE Person.Person
	SET FirstName = 'Tom'
	WHERE BusinessEntityID = 2
COMMIT;

BEGIN TRANSACTION
	UPDATE Person.Person
	SET FirstName = 'Terry'
	WHERE BusinessEntityID = 2
		SAVE TRANSACTION SaveFirstName -- Savepoint for the first name
	UPDATE Person.Person
	SET MiddleName = 'Z'
	WHERE BusinessEntityID = 2
		SAVE TRANSACTION SaveMiddleName -- Savepoint for the middle name
	UPDATE Person.Person
	SET LastName = 'Walker'
	WHERE BusinessEntityID = 2
		SAVE TRANSACTION SaveLastName --Savepoint for the last name
ROLLBACK TRANSACTION SaveMiddleName
ROLLBACK
COMMIT