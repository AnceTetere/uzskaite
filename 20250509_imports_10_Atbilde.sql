--Atribūts 7: Atbilde
--20 Apskata aili Atbilde
SELECT Atbilde
FROM [dbo].[R uzskaite_LV];

--21 Pārbauda, cik rakstuzīmes atribūts aizņem.
SELECT [Atbilde], LEN(TRIM(Atbilde)) AS platums 
FROM [dbo].[R uzskaite_LV]
ORDER BY platums DESC; --Redzu latviešu tekstu, kur garākais gals ir 49 zīmēs - definēšu kā NVARCHAR(50)

--22 Pārtaisa aili
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN [Atbilde] NVARCHAR(50);

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
ALTER TABLE [dbo].[R uzskaite_LV] ALTER COLUMN atbildets_laika NVARCHAR(2);

--Atribūts 9: apstridets
--27 Apskata aili apstridets
SELECT apstridets
FROM [dbo].[R uzskaite_LV];

--28 Pārbaudu platumu
-- no lielākās uz mazāko
SELECT apstridets, LEN(TRIM(apstridets)) AS garums
FROM [dbo].[R uzskaite_LV]
ORDER BY garums DESC; 

--no mazākās uz lielāko
SELECT apstridets, LEN(apstridets) AS garums
FROM [dbo].[R uzskaite_LV]
ORDER BY garums ASC; 

PĀRBAUDA V
UZ NULLĒM!!!!

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
