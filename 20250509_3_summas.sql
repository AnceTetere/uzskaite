SELECT COUNT(*)
FROM [dbo].[R summas_uzskaitei_LV]; -- 33 074 rindas

-- Atribūts 1: ID_num
--1 Apskata aili ID_num
SELECT [ID_num] 
FROM [dbo].[R summas_uzskaitei_LV];

--2 Pārbauda, vai ailē rakstu zīmju nav vairāk par 7
SELECT [ID_num], LEN(ID_num) AS platums 
FROM [dbo].[R summas_uzskaitei_LV];
WHERE LEN(ID_num) > 7

--3 Pārtaisa un definē aili
ALTER TABLE [dbo].[R summas_uzskaitei_LV] ALTER COLUMN [ID_num] VARCHAR(7) NOT NULL; -- ID vērtība nedrīkst būt tukša

-- Atribūts 2: Summa
--4 Apskata aili Summa
SELECT [Summa]
FROM [dbo].[R summas_uzskaitei_LV];

--5 Definē atribūtu
ALTER TABLE [dbo].[R summas_uzskaitei_LV] ALTER COLUMN [Summa] float(8); 

--6 Izveido tukšu tabulu
CREATE TABLE summas_LV (
  ID_num varchar(7) NOT NULL,
  summa float(8));

--7 Pārņem noformētos datus uz jauno tabulu
INSERT INTO summas_LV
SELECT *
FROM [dbo].[R summas_uzskaitei_LV]
--33 074 rindas
