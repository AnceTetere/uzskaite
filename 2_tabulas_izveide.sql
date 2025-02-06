USE [usd_at]
GO

-- Te, izveido jaunu tabulu, kas uz paņems izformētos datus no [dbo].[R uzskaite_LV].

--1 Izveido tukšu tabulu
CREATE TABLE uzskaite_LV (
  ID_num varchar(7) NOT NULL,
  Iestade varchar(13),
  Pakalpojums nvarchar(50),
  Datums_sanemts date,
  Iesniegsanas_veids nvarchar(13),
  Datums_nosutits date,
  Atbilde nvarchar(50),
  atbildets_laika nvarchar(2),
  apstridets bit
);

--2 Pārņem noformētos datus uz jauno tabulu
INSERT INTO uzskaite_LV
SELECT *
FROM [dbo].[R uzskaite_LV]
--36 668 rindas

--3 Apskata un pārbauda
SELECT *
FROM [uzskaite_LV]

--4 Sākotnējo importu var dzēst.
DROP TABLE [dbo].[R uzskaite_LV]
