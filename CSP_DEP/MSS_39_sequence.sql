--Create a Sequence
CREATE SEQUENCE SequenceObject
START WITH 1
INCREMENT BY 1

--Next sequence value
SELECT NEXT VALUE FOR SequenceObject

--Sequence current value
SELECT * FROM sys.sequences
WHERE NAME = 'SequenceObject'

SELECT current_value FROM sys.sequences
WHERE NAME = 'SequenceObject'

--Restart sequence value
ALTER SEQUENCE SequenceObject
RESTART WITH 1

--Sequence value in INSERT Statement
INSERT INTO HumanResources.Departments
VALUES (
	NEXT VALUE FOR SequenceObject, 'S'
)

INSERT INTO HumanResources.Departments
VALUES (
	NEXT VALUE FOR SequenceObject, 'P'
)

INSERT INTO HumanResources.Departments
VALUES (
	NEXT VALUE FOR SequenceObject, 'K'
)

--Create decrement sequence
CREATE SEQUENCE DecSequence AS INT
START WITH 100 INCREMENT BY -1

SELECT NEXT VALUE FOR DecSequence

--Create a sequence with min and max value
CREATE SEQUENCE MinMaxSeq
START WITH 100
INCREMENT BY 20
MinValue 100
MaxValue 200

SELECT NEXT VALUE FOR MinMaxSeq

ALTER SEQUENCE MinMaxSeq
INCREMENT BY 20
MinValue 100 MaxValue 200
CYCLE

SELECT NEXT VALUE FOR MinMaxSeq

--Drop sequence
DROP SEQUENCE DecSequence
DROP SEQUENCE MinMaxSeq













