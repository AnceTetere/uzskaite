SELECT *
FROM [dbo].[CSP_Departamenti]

-- Departamenti: pārbauda pirmo normālformu
SELECT COUNT(*)
FROM CSP_Departamenti;

SELECT COUNT(*)
FROM (SELECT DISTINCT *
      FROM CSP_Departamenti) AS T;

-- Ja pirmā normālforma izpildās, pārsauc tabulu
EXEC sp_rename 'CSP_Departamenti', 'Departamenti_1NF';

-- Ja neizpildās, tad
SELECT *
INTO Departamenti_1NF
FROM (SELECT DISTINCT *
      FROM CSP_Departamenti) AS T;

--ATSVAIDZINA

--2 normālforma identificējam primāro atslēgu
SELECT * FROM Departamenti_1NF;

-- TE IR IEKŠĒJA HIERARHIJA
-- aile CSP_departments atkārto vērtības - te būtu jāskalda sīkāk, kur zem  katra departamenta pakārtojas daļas
-- es izvēlos atvieglot mums dzīvi, un pārstrukturizēt ailes, lai tiekam līdz primārajai atslēgai
-- šādu lēmumu pieņemšanu sauc par -- operacionalizāciju
--mazliet kā dievam būt

-- APSKATA
SELECT DepID, CONCAT(CSP_Departaments, ': ', CSP_Daļa) AS Dep_Daļa_csp
FROM [dbo].[Departamenti_1NF];

-- 2NF tabula
SELECT DepID, CONCAT(CSP_Departaments, ': ', CSP_Daļa) AS Dep_Daļa_csp
INTO Departamenti_2NF
FROM [dbo].[Departamenti_1NF];

--apskata 
select * from Departamenti_2NF

-- Uzreiz izformējam - nav null, unikāla, garums
--1 pārbauda platumu
SELECT Dep_Daļa_csp, LEN(Dep_Daļa_csp) AS ailes_platums 
FROM [dbo].[Departamenti_2NF]
ORDER BY LEN(Dep_Daļa_csp) DESC   --NO GARĀKĀ NOSAUKUMA UZ LEJU, LAI APJAUSTU AILES PLATUMU

--nedrīkst būt nulle
ALTER TABLE Departamenti_2NF 
ALTER COLUMN Dep_Daļa_csp nvarchar(200) Not Null;


-- 2 izformē primāro atslēgu
-- atlasa tās vērtības, kas iepriekš attiecās uz departamentiem
SELECT DepID
FROM Departamenti_2NF
WHERE LEN(DepID) = 1;

-- pārveido atlasītās vērtības
SELECT DepID, CONCAT(DepID, '-0') as depID
FROM Departamenti_2NF
WHERE LEN(DepID) = 1;

-- Apvieno vecās ar jaunām vērtībām
SELECT DepID
FROM [dbo].[Departamenti_2NF];

SELECT DepID,
   CASE
      WHEN LEN(DepID) = 1 THEN CONCAT(DepID, '-0')
	  WHEN LEN(DepID) > 1 THEN DepID
	END AS new_DepID
FROM [dbo].[Departamenti_2NF];

-- Izveido jaunu aili
ALTER TABLE Departamenti_2NF ADD new_DepID varchar(3);

-- apskata
SELECT *
FROM [dbo].[Departamenti_2NF];

-- Ievieto atvasinātos datus ailē new_depId
UPDATE Departamenti_2NF
SET new_DepID =
   CASE
      WHEN LEN(DepID) = 1 THEN CONCAT(DepID, '-0')
	  WHEN LEN(DepID) > 1 THEN DepID
	END;

-- apskata
SELECT *
FROM [dbo].[Departamenti_2NF];

-- izdzēš veco dep_id
ALTER TABLE [dbo].[Departamenti_2NF] DROP COLUMN DepID;

-- pārsauc aili
EXEC sp_rename 'Departamenti_2NF.new_DepID', 'DepID', 'COLUMN';

-- apskata
SELECT *
FROM [dbo].[Departamenti_2NF];

-- Sakārto tabulu ar definētām ailēm
CREATE TABLE DEP2 (
     DepID varchar(3) Primary Key,
     Dep_Daļa_csp nvarchar(200) Not Null
)

INSERT INTO DEP2
SELECT DepID, Dep_Daļa_csp
FROM Departamenti_2NF

DROP TABLE [dbo].[Departamenti_2NF]

EXEC sp_rename 'DEP2', 'Departamenti_2NF';

-- jābūt unikālai
ALTER TABLE Departamenti_2NF
ADD CONSTRAINT U_Dep_Daļa 
UNIQUE(Dep_Daļa_csp);


--------------------------------------------------------------------------
-- apskata
SELECT *
FROM [dbo].[Darbinieki_2NF];

-- Ievieto atvasinātos datus ailē new_depId
UPDATE Departamenti_2NF
SET new_DepID =
   CASE
      WHEN LEN(DepID) = 1 THEN CONCAT(DepID, '-0')
	  WHEN LEN(DepID) > 1 THEN DepID
	END;

-- apskata
SELECT *
FROM [dbo].[Darbinieki_2NF];

-- izdzēš veco dep_id
ALTER TABLE [dbo].[Darbinieki_2NF] DROP COLUMN DepID;

-- pārsauc aili
EXEC sp_rename 'Darbinieki_2NF.new_DepID', 'DepID', 'COLUMN';


-- Sekundārā atslēga
ALTER TABLE Departamenti_2NF 
ADD CONSTRAINT FK_DepID FOREIGN KEY (DepID) REFERENCES Departamenti_2NF(DepID);

---------------------------------------------
- Pilnais savienojums
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
