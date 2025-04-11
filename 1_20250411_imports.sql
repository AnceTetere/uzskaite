--Sekojošais kods pieslēdzas jūsu datubāzei
USE usd_at
GO

/*1 Importē datni uzskaite.csv
    no G:\USD\!ApmainasFaili\simulatedData\treniņdatne_Uzskaite\Dati.
	
	Importa soļi atrodas: 
	G:\USD\!ApmainasFaili\simulatedData\treniņdatne_Uzskaite\Dati\Imports_SQL
	Precizētas tika ilustrācijas imports7.png, imports9.png, imports18.png.*/

/*2 Apskata importēto datni.
    * izvēlas visus atribūtus (ailes) relācijā (datubāzes tabula).
	Atribūti, korteži un relācija ir datubāžu teorijas termini.*/
    SELECT *   
    FROM [dbo].[RAW uzskaite];

/*3 Te mēs sākām būvēt tukšu tabulu ar funkciju CREATE TABLE uzskaite ().
    Pārskatot importētos datus, tajā tiek definēti atribūti, pievienots datu tips un tā izmērs.
	Te tā tika sākta rakstīt.

	CREATE TABLE uzskaite (
	....)

	To, cik tālu tikām, noliku skripta beigās, kur turpināsim veidot tukšo tabulu, kas saņems importētos datus.
*/

--4 Apskata pirmo atribūtu ID_num
    SELECT ID_num
    FROM [RAW uzskaite];

/* Lieto funkciju LEN(atribūta nosaukums), lai noteiktu zīmju skaitu, kas parādīsies pagaidu ailē, kurai devām nosaukumu platums. 
   Lieto klauzulu ORDER BY LEN(atribūta nosaukums) DESC, lai sakārtotu zīmju skaitu dilstošā secībā.
   Tādējādi var novērtēt šos datus.*/
   SELECT ID_num, LEN(ID_num) AS platums
   FROM [RAW uzskaite]
   ORDER BY LEN(ID_num) DESC;

/* Platākā aile nes 7-tiņas zīmes.
   Attiecīgi tukšajā tabulā uzskaite (skatīt skripta beigas) tiek definēts atribūts ID_num varchar(7), 
   kas saņems datus no šī atribūta.
   varchar ir teksta formāts; skaitlis 7 iekavās rezervē šūnas izmēru.*/
     
--5 Apskata otro atribūtu Iestade
    SELECT Iestade
    FROM [RAW uzskaite];

/* Lieto funkciju LEN(atribūta nosaukums), lai noteiktu zīmju skaitu, kas parādīsies pagaidu ailē, kurai devām nosaukumu [Ailes platums].
   Šo nosaukumu liek kvadrātiekavās, jo tas sastāv no diviem vārdiem ar atstarpi
   Lieto klauzulu ORDER BY LEN(atribūta nosaukums) DESC, lai sakārtotu zīmju skaitu dilstošā secībā.
   Tādējādi var novērtēt datus.*/
   SELECT Iestade, LEN(Iestade) AS [Ailes platums]
   FROM [RAW uzskaite]
   ORDER BY LEN(Iestade) DESC; 
   
/* Atribūts Iestade nes tekstu, kura maksimālais platums ir 13 rakstu zīmes.
   Izvēlējāmies to uzreiz nodefinēt RAW tabulā.
   
   Klauzula ALTER TABLE definē tabulu, kurā tiks veiktas izmaiņas.
   Klauzula ALTER COLUMN definē, kas tiek mainīts atribūts.
   ALTER funkcijas datubāzē ir atļautas tikai ar WRITE tiesībām.*/
   ALTER TABLE [RAW uzskaite] 
   ALTER COLUMN Iestade nvarchar(13);

/* Aile Iestade tika nodefinēta kā nvarchar teksta tips, kas atļauj latviešu burtus, 13 zīmēs.
   Tukšajā tabulā uzskaite tiek nodefinēts identisks atribūts, kas saņems šos datus.*/

--6 Apskata trešo atribūtu Pakalpojums
    SELECT Pakalpojums
    FROM [RAW uzskaite];

/* Lieto funkciju LEN(atribūta nosaukums), lai noteiktu zīmju skaitu, kas parādīsies pagaidu ailē, 
   kurai devām nosaukumu AILES_PLATUMS. Kvadrātiekavas ir liekas, jo atstarpes starp vārdiem nav.
   Lieto klauzulu ORDER BY LEN(atribūta nosaukums) DESC, lai sakārtotu zīmju skaitu dilstošā secībā.
   Tādējādi var novērtēt datus.*/
   SELECT Pakalpojums, LEN(Pakalpojums) AS AILES_PLATUMS
   FROM  [RAW uzskaite]
   ORDER BY LEN(Pakalpojums) DESC;

/* Atribūts Pakalpojums nes tekstu, kura maksimālais platums ir 24 zīmes.
   Tukšajā tabulā ar nosaukumu uzskaite tas tiek nodefinēts kā nvarchar teksta tips, kas atļauj latviešu burtus 24 zīmēs.*/

--7 Apskata ceturto atribūtu Datums_sanemts
    SELECT Datums_sanemts
    FROM [RAW uzskaite];

-- Novērtē ailes platumu, datu tipu un vai standarts atbilst ISO 8601
   SELECT Datums_sanemts, LEN(Datums_sanemts) PLATUMS  -- AS var izlaist
   FROM [RAW uzskaite]
   ORDER BY PLATUMS DESC;

   SELECT Datums_sanemts
   FROM   [RAW uzskaite]
   WHERE   Datums_sanemts NOT LIKE '____-__-__';  --meklē rindas, kas neatbilst šim formātam.

/* Eiropas norma ISO standartam (EN ISO 8601) kopš 2021. gada tiek norādīta tiesisko dokumentu izstrādes vadlīnijās 
   (European Legislation Identifier, 2021).
   
   Ar klauzulu ALTER TABLE šie dati tiek pārdefinēti datuma formātā,
   un lidzīgi tabulā uzskaite tiek definēts atribūts Datums_sanemts datuma formātā.*/
   ALTER TABLE [RAW uzskaite]
   ALTER COLUMN Datums_sanemts DATE;

-- TUKŠĀ TABULA, KO DEFINĒJAM UN AR KURU TURPINĀSIM.
CREATE TABLE uzskaite (
	ID_num varchar(7),
	Iestade nvarchar(13),
	Pakalpojums nvarchar(24),
	Datums_sanemts date,
)

