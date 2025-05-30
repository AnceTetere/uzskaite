-- Savieno tabulas uzskaite_LV un summas_LV caur kreiso savienojumu:
-- Tas ir pirmā tabula (uzskaite_LV) saglabā visas rindas, kamēr no summas_LV pievelk klāt tikai tās, 
-- kurām ID_num atribūts sakrīt.

--1 Pirmā savienošanā savieno uz ID_num visus atribūtus no abām tabulām.
--  Rezultātā ir divas ID_num ailes

SELECT uzskaite_LV.*, summas_LV.*
FROM [dbo].[uzskaite_LV]
LEFT JOIN [dbo].[summas_LV]
ON A.ID_num = B.ID_num;

--2 Tabulu nosaukumus var saīsināt: te uz burtu A un B.

SELECT A.*, B.*
FROM [dbo].[uzskaite_LV] AS A
LEFT JOIN [dbo].[summas_LV] AS B
ON A.ID_num = B.ID_num;

--3 To pašu savienojumu var veidot, izvēloties tikai dažas ailes no visām

SELECT A.ID_num, 
       A.Iestade, 
       A.Pakalpojums, 
       A.Atbilde, 
       B.Summa
FROM [dbo].[uzskaite_LV] AS A
LEFT JOIN [dbo].[summas_LV] AS B
ON A.ID_num = B.ID_num;

-- 4 Kad izkārtojums apmierina, to noglabā jaunā tabulā ar nosaukumu aprekini.
SELECT A.ID_num, 
		A.Iestade, 
		A.Pakalpojums, 
		A.Atbilde, 
		B.Summa
INTO aprekini
FROM [dbo].[uzskaite_LV] AS A
LEFT JOIN [dbo].[summas_LV] AS B
ON A.ID_num = B.ID_num;

-- 5 Apskata jaunizveidoto tabulu aprekini
SELECT *
FROM aprekini;

-- 6 Tai pievieno tukšu aili ar nosaukumu procenti, kas nesīs skaitļus ar decimālpunktu
ALTER TABLE aprekini
ADD procenti float;

-- 7 Aili procenti aizpilda ar aprēķinu, kas ir 10% no summas vērtības ailē summa
UPDATE aprekini
SET procenti = summa / 10;

-- 8 Tabulā aprekini izveido vēl vienu aili ar nosaukumu gala_summa.
ALTER TABLE aprekini
ADD gala_summa float;

-- 9 Atribūts gala_summa nes aiļu summa un procenti kopsummu - bet tikai tiem, kas saņēma finansiālu atvieglojumu.
UPDATE aprekini
SET gala_summa = summa + procenti
WHERE Atbilde = 'Pieteikums slēgts ar finansiālu atvieglojumu';

-- 10 Atribūts nes aiļu summa - procenti visiem, kas nesaņēma finansiālu atvieglojumu.
UPDATE aprekini
SET gala_summa = summa - procenti
WHERE Atbilde != 'Pieteikums slēgts ar finansiālu atvieglojumu';

-- 11 Lai milzīgais cipars būtu izlasāms, to noapaļo līdz 2 zīmēm aiz decimālpunkta.
UPDATE aprekini
SET gala_summa = ROUND(gala_summa,2,0);


-----------------
SELECT A.[ID_num], A.[Iestade], A.[Pakalpojums], A.[Atbilde], A.[apstridets], B.Summa
FROM [dbo].[uzskaite_LV] AS A
LEFT JOIN [dbo].[summas_LV] AS B
ON A.ID_num = B.ID_num;

SELECT A.[ID_num], A.[Iestade], A.[Pakalpojums], A.[Atbilde], A.[apstridets], B.Summa
INTO aprekini
FROM [dbo].[uzskaite_LV] AS A
LEFT JOIN [dbo].[summas_LV] AS B
ON A.ID_num = B.ID_num;

SELECT *
FROM aprekini;

ALTER TABLE aprekini
ADD procenti float;

UPDATE aprekini
SET procenti = summa / 10;

ALTER TABLE aprekini
ADD gala_summa float;

UPDATE aprekini
SET gala_summa = summa + procenti
WHERE Atbilde = 'Pieteikums slēgts ar finansiālu atvieglojumu';

UPDATE aprekini
SET gala_summa = summa - procenti
WHERE Atbilde != 'Pieteikums slēgts ar finansiālu atvieglojumu';

UPDATE aprekini
SET gala_summa = ROUND(gala_summa,2,0);
