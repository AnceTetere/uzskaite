-- Atvērt savu datubāzi
USE [usd_at]
GO

--Apskata ielasītos datus
SELECT * --VISAS AILES
FROM [dbo].[RAW uzskaite]

-- Noņemt pēdiņas, ja tādas ir
UPDATE [dbo].[RAW uzskaite] SET [ID_num] = REPLACE(nmrkod, '"', '');

-- Izmaina atribūta nosaukumu
EXEC sp_rename [dbo].[RAW uzskaite].[ID_num], 'ID_num', 'COLUMN'


-- Izvēlas pirmo atribūtu un pārbauda tā platumu un datu tipu
SELECT [ID_num], LEN([ID_num]) AS garums 
FROM [dbo].[RAW uzskaite]
ORDER BY garums DESC; 

--Pirmā atribūta max garums = 7 zīmes
-- Nomaina atribūta izmēru uz 7
   ALTER TABLE [dbo].[RAW uzskaite] ALTER COLUMN [ID_num] VARCHAR(7);

-- Izvēlas otru atribūtu un pārbauda tā platumu
SELECT [Iestade], LEN([Iestade]) AS garums 
FROM [dbo].[RAW uzskaite]
ORDER BY garums DESC

--Otrā atribūta max garums = 13 zīmes
-- Nomaina atribūta izmēru uz 13
   ALTER TABLE [dbo].[RAW uzskaite] ALTER COLUMN [Iestade] VARCHAR(13);

-- Izvēlas trešo atribūtu un pārbauda tā platumu
SELECT [Pakalpojums], LEN([Pakalpojums]) AS garums 
FROM [dbo].[RAW uzskaite]
ORDER BY garums DESC

--Trešā atribūta max garums = 24 zīmes
-- Nomaina atribūta izmēru uz 24
   ALTER TABLE [dbo].[RAW uzskaite] ALTER COLUMN [Iestade] VARCHAR(24);

-- Izveido tukšu tabulu
CREATE TABLE uzskaite (
  ID_num varchar(7),
  Iestade varchar (50), --varchar - teksta vērtība
  Pakalpojums varchar (100)
);

-- Pārņem noformētos datus uz jauno tabulu
INSERT INTO [dbo].[uzskaite]
SELECT [ID_num],[Iestade], [Pakalpojums]
FROM [dbo].[RAW uzskaite]

SELECT *
FROM [dbo].[uzskaite]

-- SEKOJOŠAIS IR ATRIBŪTU DEFINĒŠANA UN PĀRBAUDES, KAM VAR IZSEKOT LĪDZ.
SELECT *
FROM [dbo].[R uzskaite_LV]; -- 36 668 rindas

-- Atribūts 1: ID_num
--1 Apskata aili ID_num
SELECT [ID_num] 
FROM [dbo].[R uzskaite_LV];

--2 Pārbauda, cik rakstuzīmes plats ir atribūta resnākais gals
SELECT [ID_num], LEN(ID_num) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; -- DESC sakārto platumu dilstošā secībā 

--3 Pārtaisa un definē aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [ID_num] VARCHAR(7) NOT NULL; -- ID vērtība nedrīkst būt tukša

-- Atribūts 2: Iestade
--4 Apskata aili Iestade
SELECT [Iestade]
FROM [dbo].[R uzskaite_LV];

--5 Pārbauda, cik rakstuzīmes plats ir atribūta resnākais gals
SELECT [Iestade], LEN(Iestade) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; -- 13 zīmes

--6 Pārtaisa un definē aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Iestade] VARCHAR(13); -- Iestade ir teksta vērtība 13 zīmēs

--Atribūts 3: Pakalpojums
--7 Apskata aili Pakalpojums
SELECT [Pakalpojums]
FROM [dbo].[R uzskaite_LV];

--8 Pārbauda, cik rakstuzīmes plats ir atribūta resnākais gals
SELECT [Pakalpojums], LEN(Pakalpojums) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; -- Šis teksta atribūts var variēt tāpēc atvēlēšu tam 50 zīmes.

--9 Pārtaisa un definē aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Pakalpojums] NVARCHAR(50); 
-- NVARCHAR lieto, lai kodējums atļautu latviešu tekstu

--Atribūts 4: Datums_sanemts
--10 Apskata aili Datums_sanemts
SELECT Datums_sanemts
FROM [dbo].[R uzskaite_LV];

/* Tas ir pareizā ISO 8601 formātā, bet importēts kā teksts.
Iesaku izvēlēties šo starptautisko datumu harmonizācijas standartu (International Organization for Standardization, 2019),
jo tas tagad atbilst Eiropas normai (EN ISO 8601) un kopš 2021. gada tiek norādīts tiesisko dokumentu izstrādes vadlīnijās 
(European Legislation Identifier, 2021).*/

--11 Pārbauda, vai importētais šai ailē tiešām ir datums
-- Piemēram, vai visās rindās 5-tā un 8-tā zīme ir svītriņa.
SELECT Datums_sanemts 
FROM [dbo].[R uzskaite_LV]
WHERE Datums_sanemts NOT LIKE '____-__-__'; --Vai visas atribūta vērtības atbilst šim formātam? 
                                            --Neatgriež nevienu rindu.
											--Tātad viss atbilst.

--12 Pārtaisa un definē aili datuma formātā
ALTER TABLE [R uzskaite_LV] ALTER COLUMN Datums_sanemts DATE;
-- SQL datuma formāts 23 atbilst standartam ISO 8601 (https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/).

--Atribūts 5: Iesniegsanas_veids
--13 Apskata aili Iesniegsanas_veids
SELECT Iesniegsanas_veids
FROM [dbo].[R uzskaite_LV];

--14 Pārbauda, cik rakstuzīmes atribūts aizņem.
SELECT [Iesniegsanas_veids], LEN(Iesniegsanas_veids) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; --Redzu latviešu tekstu 13 zīmēs, tāpēc attiecīgi definēšu NVARCHAR(13)

--15 Pārtaisa aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Iesniegsanas_veids] NVARCHAR(15); 

--Atribūts 6: Datums_nosutits
--16 Apskata aili Datums_nosutits
SELECT Datums_nosutits
FROM [dbo].[R uzskaite_LV];

--17 Atkal pārbauda, vai formāts atbilst
SELECT Datums_nosutits 
FROM [dbo].[R uzskaite_LV]
WHERE Datums_sanemts NOT LIKE '____-__-__';  --Neatgriež nevienu rindu. Tātad viss atbilst.

--18 Pārtaisa aili datuma formātā
ALTER TABLE [R uzskaite_LV] ALTER COLUMN Datums_nosutits DATE;

--Atribūts 7: Atbilde
--20 Apskata aili Atbilde
SELECT Atbilde
FROM [dbo].[R uzskaite_LV];

--21 Pārbauda, cik rakstuzīmes atribūts aizņem.
SELECT [Atbilde], LEN(Atbilde) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; --Redzu latviešu tekstu, kur garākais gals ir 49 zīmēs - definēšu kā NVARCHAR(50)

--22 Pārtaisa aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Atbilde] NVARCHAR(55);

--Atribūts 8: atbildets_laika
--23 Apskata aili atbildets_laika
SELECT atbildets_laika
FROM [dbo].[R uzskaite_LV];

--24 Redzu, ka šīs ir Būla vienības, tāpēc mani intresē, vai tur nav kas cits, kā vien Jā un Nē šajā ailē
SELECT atbildets_laika                      -- Izvēlos no tabulas aili [atbildets_laika] 
FROM [dbo].[R uzskaite_LV]
WHERE atbildets_laika != 'Jā' AND atbildets_laika != 'Nē';  --Tādu rindu nav

--Lai pārtaisītu aili Būla formāta, būtu jāmaina Jā uz TRUE un Nē uz FALSE - pagaidām lai paliek.
--26 Saglabāju NVARCHAR 2-ās zīmēs
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN atbildets_laika NVARCHAR(3);

--Atribūts 9: apstridets
--27 Apskata aili apstridets
SELECT apstridets
FROM [dbo].[R uzskaite_LV];

--28 Pārbaudu platumu
-- no lielākās uz mazāko
SELECT apstridets, LEN(apstridets) AS garums
FROM [dbo].[R uzskaite_LV]
ORDER BY garums DESC; 

--no mazākās uz lielāko
SELECT apstridets, LEN(apstridets) AS garums
FROM [dbo].[R uzskaite_LV]
ORDER BY garums ASC; 

-- Izrādās, ka aile nes tukšumus.
--Tos pārdefinē par NULL.
UPDATE [R uzskaite_LV]
SET [apstridets] = NULL
WHERE apstridets = '';

--Un apskata
SELECT apstridets
FROM [dbo].[R uzskaite_LV]
ORDER BY apstridets ASC; 

--29 Te pārtaisu par Būla vērtībām
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN apstridets BIT;

SELECT *
FROM [dbo].[R uzskaite_LV]
WHERE ID_num = '1131730'

-- SEKOJOŠAIS IR ATRIBŪTU DEFINĒŠANA UN PĀRBAUDES, KAM VAR IZSEKOT LĪDZ.
SELECT *
FROM [dbo].[R uzskaite_LV]; -- 36 668 rindas

-- Atribūts 1: ID_num
--1 Apskata aili ID_num
SELECT [ID_num] 
FROM [dbo].[R uzskaite_LV];

--2 Pārbauda, cik rakstuzīmes plats ir atribūta resnākais gals
SELECT [ID_num], LEN(ID_num) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; -- DESC sakārto platumu dilstošā secībā 

--3 Pārtaisa un definē aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [ID_num] VARCHAR(7) NOT NULL; -- ID vērtība nedrīkst būt tukša

-- Atribūts 2: Iestade
--4 Apskata aili Iestade
SELECT [Iestade]
FROM [dbo].[R uzskaite_LV];

--5 Pārbauda, cik rakstuzīmes plats ir atribūta resnākais gals
SELECT [Iestade], LEN(Iestade) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; -- 13 zīmes

--6 Pārtaisa un definē aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Iestade] VARCHAR(13); -- Iestade ir teksta vērtība 13 zīmēs

--Atribūts 3: Pakalpojums
--7 Apskata aili Pakalpojums
SELECT [Pakalpojums]
FROM [dbo].[R uzskaite_LV];

--8 Pārbauda, cik rakstuzīmes plats ir atribūta resnākais gals
SELECT [Pakalpojums], LEN(Pakalpojums) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; -- Šis teksta atribūts var variēt tāpēc atvēlēšu tam 50 zīmes.

--9 Pārtaisa un definē aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Pakalpojums] NVARCHAR(50); 
-- NVARCHAR lieto, lai kodējums atļautu latviešu tekstu

--Atribūts 4: Datums_sanemts
--10 Apskata aili Datums_sanemts
SELECT Datums_sanemts
FROM [dbo].[R uzskaite_LV];

/* Tas ir pareizā ISO 8601 formātā, bet importēts kā teksts.
Iesaku izvēlēties šo starptautisko datumu harmonizācijas standartu (International Organization for Standardization, 2019),
jo tas tagad atbilst Eiropas normai (EN ISO 8601) un kopš 2021. gada tiek norādīts tiesisko dokumentu izstrādes vadlīnijās 
(European Legislation Identifier, 2021).*/

--11 Pārbauda, vai importētais šai ailē tiešām ir datums
-- Piemēram, vai visās rindās 5-tā un 8-tā zīme ir svītriņa.
SELECT Datums_sanemts 
FROM [dbo].[R uzskaite_LV]
WHERE Datums_sanemts NOT LIKE '____-__-__'; --Vai visas atribūta vērtības atbilst šim formātam? 
                                            --Neatgriež nevienu rindu.
											--Tātad viss atbilst.

--12 Pārtaisa un definē aili datuma formātā
ALTER TABLE [R uzskaite_LV] ALTER COLUMN Datums_sanemts DATE;
-- SQL datuma formāts 23 atbilst standartam ISO 8601 (https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/).

--Atribūts 5: Iesniegsanas_veids
--13 Apskata aili Iesniegsanas_veids
SELECT Iesniegsanas_veids
FROM [dbo].[R uzskaite_LV];

--14 Pārbauda, cik rakstuzīmes atribūts aizņem.
SELECT [Iesniegsanas_veids], LEN(Iesniegsanas_veids) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; --Redzu latviešu tekstu 13 zīmēs, tāpēc attiecīgi definēšu NVARCHAR(13)

--15 Pārtaisa aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Iesniegsanas_veids] NVARCHAR(15); 

--Atribūts 6: Datums_nosutits
--16 Apskata aili Datums_nosutits
SELECT Datums_nosutits
FROM [dbo].[R uzskaite_LV];

--17 Atkal pārbauda, vai formāts atbilst
SELECT Datums_nosutits 
FROM [dbo].[R uzskaite_LV]
WHERE Datums_sanemts NOT LIKE '____-__-__';  --Neatgriež nevienu rindu. Tātad viss atbilst.

--18 Pārtaisa aili datuma formātā
ALTER TABLE [R uzskaite_LV] ALTER COLUMN Datums_nosutits DATE;

--Atribūts 7: Atbilde
--20 Apskata aili Atbilde
SELECT Atbilde
FROM [dbo].[R uzskaite_LV];

--21 Pārbauda, cik rakstuzīmes atribūts aizņem.
SELECT [Atbilde], LEN(Atbilde) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; --Redzu latviešu tekstu, kur garākais gals ir 49 zīmēs - definēšu kā NVARCHAR(50)

--22 Pārtaisa aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Atbilde] NVARCHAR(55);

--Atribūts 8: atbildets_laika
--23 Apskata aili atbildets_laika
SELECT atbildets_laika
FROM [dbo].[R uzskaite_LV];

--24 Redzu, ka šīs ir Būla vienības, tāpēc mani intresē, vai tur nav kas cits, kā vien Jā un Nē šajā ailē
SELECT atbildets_laika                      -- Izvēlos no tabulas aili [atbildets_laika] 
FROM [dbo].[R uzskaite_LV]
WHERE atbildets_laika != 'Jā' AND atbildets_laika != 'Nē';  --Tādu rindu nav

--Lai pārtaisītu aili Būla formāta, būtu jāmaina Jā uz TRUE un Nē uz FALSE - pagaidām lai paliek.
--26 Saglabāju NVARCHAR 2-ās zīmēs
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN atbildets_laika NVARCHAR(3);

--Atribūts 9: apstridets
--27 Apskata aili apstridets
SELECT apstridets
FROM [dbo].[R uzskaite_LV];

--28 Pārbaudu platumu
-- no lielākās uz mazāko
SELECT apstridets, LEN(apstridets) AS garums
FROM [dbo].[R uzskaite_LV]
ORDER BY garums DESC; 

--no mazākās uz lielāko
SELECT apstridets, LEN(apstridets) AS garums
FROM [dbo].[R uzskaite_LV]
ORDER BY garums ASC; 

-- Izrādās, ka aile nes tukšumus.
--Tos pārdefinē par NULL.
UPDATE [R uzskaite_LV]
SET [apstridets] = NULL
WHERE apstridets = '';

--Un apskata
SELECT apstridets
FROM [dbo].[R uzskaite_LV]
ORDER BY apstridets ASC; 

--29 Te pārtaisu par Būla vērtībām
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN apstridets BIT;

SELECT *
FROM [dbo].[R uzskaite_LV]
WHERE ID_num = '1131730'