--MATH FUNCTIONS

--ABS() function
SELECT ABS(-202);

--AVG() function: What is the average list price of the all products?
SELECT ListPrice FROM Production.Product;
SELECT AVG(ListPrice) FROM Production.Product;

--CEILING() function
SELECT CEILING(15.75)
SELECT CEILING(15.01)

--COUNT() function
SELECT COUNT(*) FROM Production.Product;

--FLOOR() function
SELECT FLOOR(15.75)
SELECT FLOOR(15.99)

--MAX() function: Max list price?
SELECT MAX(ListPrice) FROM Production.Product;

--MIN() function: Min list price?
SELECT MIN(ListPrice) FROM Production.Product;

--POWER() function
SELECT POWER(2,2) -- 2^2 = 4
SELECT POWER(2,5) -- 2^5 = 32

--RAND() function
SELECT RAND()  --Return a random number between 0 and 1

SELECT RAND(5)  --Return the same random number
SELECT RAND(5)
SELECT RAND(5)

SELECT RAND() * 10 --Returns a random number between 0 and 10.

SELECT FLOOR(RAND()*10) --Returns a random integer 0-10.

--ROUND() function
SELECT ROUND(123.321,3)
SELECT ROUND(123.321,2)
SELECT ROUND(123.321,0)
SELECT ROUND(123.321,-1)

--SQRT() function
SELECT SQRT(9) --3
SELECT SQRT(36) --6

--SQUARE() function
SELECT SQUARE(3)  --3*3 = 9
SELECT SQUARE(5)  --5*5 = 25

--SUM() function: Total of the List Price?
SELECT SUM(ListPrice) FROM Production.Product;



-----------***************------------
--MATH FUNCTIONS

--ABS() function
SELECT ABS(-202)

--AVG() function
SELECT ListPrice FROM Production.Product;
SELECT AVG(ListPrice) FROM Production.Product;

--CEILING() function
SELECT CEILING(15.75)
SELECT CEILING(15.01)

--COUNT() function
--How many products are in the Product table?
SELECT COUNT(*) FROM Production.Product;

--FLOOR() function
SELECT FLOOR(15.75)
SELECT FLOOR(15.99)

--MAX() function
--Max list price?
SELECT MAX(ListPrice) FROM Production.Product;

--MIN() function
SELECT MIN(ListPrice) FROM Production.Product;

--POWER() function
SELECT POWER(2,2);

--RAND() function
SELECT RAND()  --returns a random number between 0 and 1.

SELECT RAND(5)  --returns the same random number each time
SELECT RAND(5)
SELECT RAND(5)

SELECT RAND()*10  --returns a random decimal number between 0 and 10. 
                  --(0 and 10 not included)

SELECT FLOOR(RAND()*10) --returns a random integer between 1 and 10

--ROUND() function
SELECT ROUND(123.321, 0)

--SQRT() function
SELECT SQRT(9)
SELECT SQRT(36)

--SQUARE() function
SELECT SQUARE(3)
SELECT SQUARE(5)

--SUM() function
--Total of the List Prices?
SELECT SUM(ListPrice) FROM Production.Product;