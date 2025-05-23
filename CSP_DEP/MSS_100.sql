CREATE TABLE Uznemumu_darbinieki (
    uznemuma_nosaukums_txt varchar(4),
    darbinieku_skaits_num int,
	pazime_txt char(4)
)

INSERT INTO Uznemumu_darbinieki (uznemuma_nosaukums_txt, darbinieku_skaits_num, pazime_txt)
VALUES ('UZN1', 10, '1'), ('UZN2', 25, '0'), ('UZN3', 0, 'na1')

SELECT *
FROM Uznemumu_darbinieki

ALTER TABLE Uznemumu_darbinieki
ADD darbinieku_skaits1 INT;

UPDATE Uznemumu_darbinieki
SET darbinieku_skaits1 = darbinieku_skaits_num

UPDATE Uznemumu_darbinieki
SET darbinieku_skaits1 = NULL
WHERE darbinieku_skaits1 = 0

--------------
SELECT *
FROM Uznemumu_darbinieki
WHERE darbinieku_skaits_num >= 0

SELECT *
FROM Uznemumu_darbinieki
WHERE darbinieku_skaits1 >= 0

--PĒC SLAIDA, KUR PĒDĒJAIS VAGONIŅŠ IR NULL, MUMS INTERESĒ APSKATĪTIES, KĀDA IR ATŠĶIRĪBA KODĀ.

--Aprēķinām vidējo darbinieku skaitu uzņēmumos.
SELECT AVG(darbinieku_skaits_num) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
FROM Uznemumu_darbinieki

-- KAS TE NOTIKĀS, NOTEIKTI, KA VIDĒJAIS TE NAV VESELS SKAITLIS.
-- MĒS PAZAUDĒJĀM DATUS, cenšoties iespiest decimālskaitli veselā skaitļa vienībā.
--Rādi bildi: birst vilcienā malka
-- tad divi slaidi ar intiem un weblapā paskatīties izmērus.
-- https://www.w3schools.com/sql/sql_datatypes.asp
--Un te cik lielu vietu uz datora katrs šis formāts aizņem. pašsaprotami, ka 10 bitus 5 bitos nesabāzīsi.
-- pat tad, ja neko nezin par binārā pašinkoda tilpumiem.


---------------
SELECT CAST(AVG(darbinieku_skaits_num) AS NUMERIC) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
FROM Uznemumu_darbinieki

		SELECT CAST(AVG(darbinieku_skaits1) AS NUMERIC) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
        FROM Uznemumu_darbinieki

SELECT AVG(CAST(darbinieku_skaits_num AS NUMERIC)) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
FROM Uznemumu_darbinieki

		SELECT AVG(CAST(darbinieku_skaits1 AS NUMERIC)) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
        FROM Uznemumu_darbinieki

SELECT AVG(CAST(darbinieku_skaits_num AS NUMERIC)) AS [Vidējais darbinieku skaits mūsu uzņēmumos],  
       CAST(AVG(darbinieku_skaits_num) AS NUMERIC) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
FROM Uznemumu_darbinieki

	    SELECT AVG(CAST(darbinieku_skaits1 AS NUMERIC)) AS [Vidējais darbinieku skaits mūsu uzņēmumos],  
	           CAST(AVG(darbinieku_skaits1) AS NUMERIC) AS [Vidējais darbinieku skaits mūsu uzņēmumos]
    	FROM Uznemumu_darbinieki

--NOTĪRIES
UPDATE Uznemumu_darbinieki
SET darbinieku_skaits_num = darbinieku_skaits1

ALTER TABLE Uznemumu_darbinieki
DROP COLUMN darbinieku_skaits1


--------!!!!! Kā nepazaudēt informāciju              !!!!!!!!!!!!!!!
--skaties aili pazime_txt - tā ir teksta informācija
-- bet pieņemsim ka te ir miljons rindas un na1 pazīme ir reta un parādās 3 reizes.
--cilvēks izmeta aci un nepārbaudīja ar distinct, kādas categorijas aile nes, un nosecināja, ka
-- tur tikai nulles un vieninieki - abi veseli skaitļi un loģiski tos pārvērst veselos skaitļos
--INTEGER = vesels skaitlis

--varam lietot CONVERT pēc formulas CONVERT(DatuTipuUzKuruGribuPārvērst(garums/platums_kasNavObligāto), DatiKurusGribuizmainīt)
--Gribam paskatīties, kā ar Convert varam pārvērst tekstu '1' uz veselu skaitli 1.
SELECT CONVERT(int, '1') AS [Pārvērtām tekstu uz veselu skaitli]

--varam lietot funkciju CAST() 
--pēc formulas CAST(DatiKurusGribuizmainīt AS DatuTipuUzKuruGribuPārvērst(garums/platums_kasNavObligāto))
--Gribam paskatīties, kā ar CAST pārvērst tekstu '0' uz veselu skaitli 0.
SELECT CAST ('0' AS int) --------
SELECT CAST ('0' AS int) AS [Pārvērtām tekstu '0' uz veselu skaitli 0]

--Ok, kas Te notikās
--CONVERT()
SELECT CONVERT(int, 5.45) --Kad visi uzrakstīti pievieno AS
SELECT CONVERT(varchar, 5.45)
SELECT CONVERT(float, 5.45)
SELECT CONVERT(datetime, '2025-05-31')

--CAST()
SELECT CAST(5.45 AS int) --Kad visi uzrakstīti pievieno AS
SELECT CAST(5.45 AS varchar)
SELECT CAST(5.45 AS float)
SELECT CAST('2025-05-31' AS datetime)

--MAN: reālie skaitļi atbilst punktiem uz bezgalīgas taisnes.
--     peldošais decimālpunkts ir reāla skaitļa aptuvena reprezentācija.

SELECT 
	CONVERT(int, 5.45) AS [Decimālskaitlis konvertēts uz veselu skaitli],
    CONVERT(varchar, 5.45) AS [Decimālskaitlis pārvērsts par tekstu],
    CONVERT(float, 5.45) AS [Decimālskaitlis pārvērsts uz peldošais decimālpunkta vērtību],
    CONVERT(datetime, '2025-05-31') AS [Datumam pievienotas laika vienības];
SELECT
    CAST(5.45 AS int) AS [Decimālskaitlis konvertēts uz veselu skaitli],
    CAST(5.45 AS varchar) AS [Decimālskaitlis pārvērsts par tekstu],
    CAST(5.45 AS float) AS [Decimālskaitlis pārvērsts uz peldošais decimālpunkta vērtību],
    CAST('2025-05-31' AS datetime) AS [Datumam pievienotas laika vienības];

SELECT *
FROM Uznemumu_darbinieki

---**************************skatam vilcieniņu
-- Uztaisām treniņaili līdzās pazīme_txt
-- OPTIONAL Izmainījām struktūru tabulai - jauns vilcieniņs ar tukšiem vagoniem, kas var vest 4 burtus.
-- OPTIONALvar vest mazāk, bet ir tikai 4 sēdeklīši
ALTER TABLE Uznemumu_darbinieki
ADD pazime1 CHAR(4)

SELECT *
FROM Uznemumu_darbinieki

--aizpildam aili ar informāciju - izvēlējāmies to pārkopēt no pazime_txt
UPDATE Uznemumu_darbinieki
SET pazime1 = pazime_txt

--Tagad mēs varētu nezināt, ka šie viens un nulle ir teksta formātā
--Mēs gribam vienkārši ailes summu, jo tad mēs zināsim cik vieninieku tur ir.
SELECT SUM(pazime_txt) AS [Vienieki ailē pazime_txt]
FROM Uznemumu_darbinieki  --UJ, VAI, NEATBILSTOŠS DATU tips - ko darīt vajag mainīt uz ciparu.

--Nu tātad vajag pārtaisīt CHAR par skaitli, un to mēs jau zinām kā darīt.
ALTER TABLE Uznemumu_darbinieki
ALTER COLUMN pazime1 INT;  -- BĀC MET KĻŪDU

--labi pamēģināsim citādi
UPDATE Uznemumu_darbinieki
SET pazime1 = CONVERT(int, pazime1)  -- atkal met kļūdu un kaut ko nesaprotamu raksta
 
--Nu labi pamēģināsim ar CAST
UPDATE Uznemumu_darbinieki
SET pazime1 = CAST (pazime1 AS int)  -- atkal met kļūdu

--Nu nekas, pajautāsim ChatGPT un viņš mums piedāvā pamēģināt ar TRY_CAST
UPDATE Uznemumu_darbinieki 
SET pazime1 = TRY_CAST(pazime1 AS int)

--un viss aiziet tagad var summēt vieniniekus
SELECT SUM(pazime1) AS [Vienieki ailē pazime1]
FROM Uznemumu_darbinieki  --UJ, VAI, NEATBILSTOŠS DATU tips - ko darīt vajag mainīt uz ciparu.

--KAS TAD NU - TIKKO TAČU PĀRVĒRTĀM PAR CIPARU, LAI VAR SASKAITĪT.
--1 atsvaidzinām tabulu - nu nav izmainījies

-- taisām čekus vai rindas sakrīt
SELECT COUNT(pazime_txt) AS [Ierakstu skaits aile pazime_txt]
FROM Uznemumu_darbinieki --it kā viss atbilst

SELECT COUNT(pazime_txt) AS [Ierakstu skaits aile pazime_txt], 
       COUNT(pazime1) AS [Ierakstu skaits aile pazime1]
FROM Uznemumu_darbinieki  -- uj vaj, kas noruja

--2 paskatamies tabulā - uj vai, kas tās par NULL parādījušās
SELECT *
FROM Uznemumu_darbinieki

-- Visi na1 ieraksti pārvērsti uz NULL.
--Tas ko jūs tikko novērojāt ir COERCION - piespiešana, caur spaidiem tika piespiests 
--SQL pašam tikt galā ar teksta vērtību, ka nepakārtojas vesela skaitļa definējumam.

--tas jums iemācīs mīlēt kļūdas, kuras SSMS jums met,
--taču coercion ir visās valodās, tie ir iekšējie noteikumi, kas iestrādāti valodā,
--kā tai darboties, kad citu nosacījumu nav.

--šis gan neizmainīja datu tipu, but iekšēji izdarīja riņķi un mēs pazaudējām vērtību,
--ko try_cast neatpazona kā ciparu.

SELECT *
FROM Uznemumu_darbinieki
