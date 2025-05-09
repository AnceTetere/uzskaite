USE usd_at
GO

SELECT * FROM dbo.[RAW uzskaite]

--9 Apskata ceturto atribūtu Datums_nosutits
    SELECT Datums_nosutits
    FROM [RAW uzskaite];

/*Funkcija ISDATE() atgriež 1, ja šūnas saturs atbilst datumam, 0 - ja nē.*/
SELECT Datums_nosutits, ISDATE(Datums_nosutits) AS [Datuma pārbaude]
FROM [RAW uzskaite];

--Tiek atlasītas rindas, kurām funkcija ISDATE() atgriež 1 - tas nozīmē, ka šūnas saturs atbilst datumam.
SELECT Datums_nosutits, ISDATE(Datums_nosutits) AS [Datuma pārbaude]
FROM [RAW uzskaite]
WHERE ISDATE(Datums_nosutits) = 1;

--Saskaita kortežus (rindas) ar funkciju COUNT(), kurās izpildās datuma nosacījums ISDATE()
SELECT COUNT(ISDATE(Datums_nosutits)) AS [Datuma rindas]
FROM [RAW uzskaite]
WHERE ISDATE(Datums_nosutits) = 1;

--Rindu skaits tabulā [RAW uzskaite] tiek noteikts jau pēc apstrādātā atribūta ID_num, ko saskaita ar funkciju COUNT().
SELECT COUNT(*) AS [Tabulas rindas]
FROM [RAW uzskaite];

/* Eiropas norma ISO standartam (EN ISO 8601) kopš 2021. gada tiek norādīta tiesisko dokumentu izstrādes vadlīnijās 
   (European Legislation Identifier, 2021).

Pārbauda ISO8601 */

----Funkcija CONVERT() pārvērš jebkuru datumu attiecīgajā formātā
SELECT CONVERT(nvarchar, Datums_nosutits, 126) AS ISO8601
FROM [RAW uzskaite];

----Pagaidu tabula, kas līdzās atribūtam Datums_nosutits, veido pagaidu aili ar konvertēto datumu
----Abām ailēm dod pagaidu nosaukumus, lai var saprast, ko katra no tām rāda.
SELECT Datums_nosutits AS [Oriģinālais datums],     
       CONVERT(nvarchar, Datums_nosutits, 126) AS [ISO8601 formātā]
FROM [RAW uzskaite];

--Sekojošā ir pārbaude, kur tiek noskaidrots, vai visi datums_sanemts ieraksti atbilst ISO 8601 formātam
--Funkciju COUNT() saskaita ierakstus ISO8601 formātā, kur ir identiski ar ierakstiem ailē Datums_sanemts...
SELECT COUNT(CONVERT(nvarchar, Datums_nosutits, 126)) AS [Rindu skaits ISO8601]
FROM [RAW uzskaite]
WHERE CONVERT(nvarchar, Datums_nosutits, 126) = Datums_nosutits;

--...un tas tiek salīdzināt ar visiem ierakstiem atribūtam Datums_sanemts 
SELECT COUNT(Datums_nosutits) AS [Visi ieraksti Datums_nosutits]
FROM [RAW uzskaite];

/* Pārbaude izieta, jo ierakstu skaits sakrīt. 

Pārdefinē atribūtu Datums_nosutits uz datu tipu DATE.
Definē atribūtu tabulā uzskaite, kas skripta beigās būvējas, lai pārņemtu semi-iztīrītos datus no [RAW uzskaite].*/
ALTER TABLE [RAW uzskaite]
ALTER COLUMN Datums_sanemts DATE;

				--Mazliet par datumiem: Funkcija GETDATE() nolasa sistēmas laiku, to var lietot uzskaitēm un aprēķiniem (piemēram, cik mēneši pagājuši no saņemšanas datuma līdz šodienai.)
				SELECT GETDATE()

------ ***********----------- SEKOJOŠAIS NEGATAVS
CREATE TABLE uzskaite (
    ID_num varchar(7),
    Iestade nvarchar(13), 
    Pakalpojums nvarchar(24),
	Datums_sanemts date,
	Iesniegsanas_veids nvarchar(13),
	Datums_nodots date,
 ...
);
