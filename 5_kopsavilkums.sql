ALTER TABLE aprekini ALTER COLUMN Iestade NVARCHAR(13);

SELECT Iestade, ROUND(SUM(gala_summa)/1000000, 1) AS EUR_miljonos
INTO Kopsavilkums
FROM aprekini
GROUP BY Iestade;

SELECT *
FROM Kopsavilkums;
