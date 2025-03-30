USE AdventureWorks2022
GO

--Use Person.Person table
SELECT * FROM Person.Person;

--Select all the entries where the first name begins with an 'a'.
SELECT *
FROM Person.Person
WHERE FirstName LIKE 'a%';

--Select all the entries where the first name begins with an 'ang'.
SELECT * 
FROM Person.Person
WHERE FirstName LIKE 'ang%';

--Select all the entries where the first name ends with an 'a'.
SELECT * FROM Person.Person
WHERE FirstName LIKE '%a';

--Select all the entries where the first name ends with 'inda'.
SELECT * FROM Person.Person
WHERE FirstName LIKE '%inda';

--Finds the values that have 'inda' in any position.
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%inda%';

--Finds five letter names ending with 'inda'.
SELECT * FROM Person.Person
WHERE FirstName LIKE '_inda';

--Finds six letter names ending with '__inda'.
SELECT *
FROM Person.Person
WHERE FirstName LIKE '__inda'

--Finds five letter names starting with 'D' and the third letter 'v'.
SELECT *
FROM Person.Person
WHERE FirstName LIKE 'D_v__';

--Finds first names starting with letter 'a', 'b', or 'c'.
SELECT * FROM Person.Person
WHERE FirstName LIKE '[abc]%';

--Finds first names starting with letters 'a' through 'c'
SELECT * FROM Person.Person
WHERE FirstName LIKE '[a-c]%';

--Not Like
SELECT * FROM Person.Person
WHERE FirstName NOT LIKE '[a-c]%';

--Without a letter 'a' in any position of the first name
SELECT * FROM Person.Person
WHERE FirstName NOT LIKE '%a%';