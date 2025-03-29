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
