USE usd_at
GO

SELECT * FROM CSP_Darbinieki;

CREATE TABLE CSP_Algas (
    DarbiniekaID varchar(4),
	Samaksa_EUR numeric(10, 2),
	Samaksas_veids nvarchar(10)
);

-- Import Algas
-- Apskatās
SELECT * FROM [RAW Algas]

--Ievieto datus
INSERT INTO CSP_Algas
SELECT * FROM [RAW Algas];

--Pārbauda un dzēš
SELECT * FROM CSP_Algas;
DROP TABLE [RAW Algas];

-- Pilnais savienojums
-- 1 izveido un apskata
SELECT *
FROM CSP_Darbinieki AS A
FULL JOIN CSP_Algas AS B
ON A.Darbinieka_ID = B.DarbiniekaID;

--2 sakopj
SELECT A.Darbinieka_ID, A.D_vārds, A.D_uzvārds, A.D_pozīcija, A.TelefonaNr, B.Samaksa_EUR, B.Samaksas_veids, A.DepID
FROM CSP_Darbinieki AS A
FULL JOIN CSP_Algas AS B
ON A.Darbinieka_ID = B.DarbiniekaID;

--3 Formējamies uz 2-ro normālformu
SELECT A.Darbinieka_ID, A.D_vārds, A.D_uzvārds, A.D_pozīcija, A.TelefonaNr, B.Samaksa_EUR, B.Samaksas_veids, A.DepID
INTO Darbinieki
FROM CSP_Darbinieki AS A
FULL JOIN CSP_Algas AS B
ON A.Darbinieka_ID = B.DarbiniekaID;

-- 4 apskata un nokopjas
SELECT * FROM Darbinieki;
DROP TABLE CSP_Algas;
DROP TABLE CSP_Darbinieki;

-- Darbinieki: pārbauda pirmo normālformu
SELECT COUNT(*)
FROM Darbinieki;

SELECT COUNT(*)
FROM (SELECT DISTINCT *
      FROM Darbinieki) AS T;

-- Ja pirmā normālforma izpildās, pārsauc tabulu
EXEC sp_rename 'Darbinieki', 'Darbinieki_1NF';
--ATSVAIDZINA

--2 normālforma identificējam primāro atslēgu
SELECT * FROM Darbinieki_1NF;

-- Apskata jauno tabulu, kur izpildās priekšnoteikumi primārajai  atslēgai
SELECT Darbinieka_ID, 
       D_vārds, 
	   D_uzvārds, 
	   TelefonaNr, 
       SUM(Samaksa_EUR) AS Samaksa_EUR, 
	   DepID 
FROM Darbinieki_1NF
GROUP BY Darbinieka_ID, D_vārds, D_uzvārds, TelefonaNr, DepID;

-- DEFINĒ OTRO NORMĀLFORMU UN UZLIEK PRIMĀRO ATSLĒGU
SELECT Darbinieka_ID, 
       D_vārds, 
	   D_uzvārds, 
	   TelefonaNr, 
       SUM(Samaksa_EUR) AS Samaksa_EUR, 
	   DepID 
INTO Darbinieki_2NF
FROM Darbinieki_1NF
GROUP BY Darbinieka_ID, D_vārds, D_uzvārds, TelefonaNr, DepID;

------ IEROBEŽOJUMI
-- Pirms apskata dizainu, te ir miskaste priekš 2NF
-- mums ir jāsadefinē ailes tālāk
-- Attiecīgi izformē ailes tālāk, definējot primāro atslēgu.
-- AILE darbinieka_ID
ALTER TABLE Darbinieki_2NF 
ALTER COLUMN Darbinieka_ID varchar(4) Not Null;

ALTER TABLE Darbinieki_2NF 
ADD CONSTRAINT PK_DarbiniekaID Primary Key (Darbinieka_ID);

-- AILE D_vārds - darbinieks nevar būt bez vārda
ALTER TABLE Darbinieki_2NF
ALTER COLUMN D_vārds nvarchar(50) Not Null;

-- AILE D_uzvārds - darbinieks nevar būt bez uzvārda
ALTER TABLE Darbinieki_2NF
ALTER COLUMN D_uzvārds nvarchar(50) Not Null;

-- AILE TelefoaNr - var arī nebūt, vai ne - taču ja tas ir, tad šajā līmenī tam ir jābūt katram vadītājam savs
ALTER TABLE Darbinieki_2NF
ADD CONSTRAINT U_TelefonaNr 
UNIQUE(TelefonaNr);

-- AILE Samaksa nāks ar masku - jo 'tām ir laikam likumos noteiktas robežas, cilvēki nestrādā pa brīvu, jo citādi viņi nav
--darbinieki

-- Attiecīgi aile nevar nest nulles vērtības
ALTER TABLE Darbinieki_2NF
ALTER COLUMN Samaksa_EUR numeric(10, 2) Not Null;

-- Aile pārbauda vai nav sarakstīti brīnumi
ALTER TABLE Darbinieki_2NF
ADD CONSTRAINT CHK_Samaksa 
CHECK(Samaksa_EUR BETWEEN 1000 AND 10000);

-- depID par ārējo atslēgu noformēsim kad departamentu tabula būs sakārtota, jo citādi mums neļaus,
-- bet šajā solī mēs zinām, ka arī tā nedrīkst būt tukša. attiecīgi
ALTER TABLE Darbinieki_2NF
ALTER COLUMN DepID varchar(5) Not Null;

--!!!ATSVAIDZINA UN PĀRBAUDA DIZAINU