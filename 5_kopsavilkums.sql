--Veidojam kopsavilkumu no aprekini, kas rāda kādas summas finansu iestādes te apgroza.
--1 Apskata tabulu
SELECT *
FROM aprekini;

--2 Nošķir ailes, no kurām rēķinās
SELECT Iestade, summa
FROM aprekini;

--3 Grupē uz uz Iestade, summējot summas
SELECT Iestade, SUM(summa)
FROM aprekini
GROUP BY Iestade;

--4 Summas norādīt miljonos
SELECT Iestade, SUM(summa)/1000000
FROM aprekini
GROUP BY Iestade;

--5 Nosauc summēto aili par EUR_miljonos
SELECT Iestade, SUM(summa)/1000000 AS EUR_miljonos
FROM aprekini
GROUP BY Iestade;

--6 Vērtības ailē EUR_miljonos noapaļo līdz vienam ciparam aiz decimālpunkta
SELECT Iestade, ROUND(SUM(summa)/1000000, 1) AS EUR_miljonos
FROM aprekini
GROUP BY Iestade;

--7 No tabulas aprekini atvasināto tabulu ieliek tabulā kopsavilkums
SELECT Iestade, ROUND(SUM(summa)/1000000, 1) AS EUR_miljonos
INTO kopsavilkums
FROM aprekini
GROUP BY Iestade;

--8 Apskata, kā jaunā tabula kopsavilkums izskatās
SELECT *
FROM kopsavilkums;

--9 Eksportam uzspiež teksta formātu
ALTER TABLE kopsavilkums ALTER COLUMN EUR_miljonos NVARCHAR(10);

--10 Eksportē un izdzēš
DROP TABLE kopsavilkums;


----
ALTER TABLE aprekini ALTER COLUMN Iestade NVARCHAR(13);

SELECT Iestade, ROUND(SUM(gala_summa)/1000000, 1) AS EUR_miljonos
INTO Kopsavilkums
FROM aprekini
GROUP BY Iestade;

SELECT *
FROM Kopsavilkums;
