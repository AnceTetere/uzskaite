USE [usd_at]
GO

CREATE TABLE CSP_struktura (
	Darbinieka_ID varchar(4),
	D_vārds nvarchar(50),
	D_uzvārds nvarchar(50),
	D_pozīcija nvarchar(100),
	TelefonaNr nvarchar(17),
	DepID varchar(5),
	CSP_Daļa nvarchar(100),
	CSP_Departments nvarchar(100)
);



BULK INSERT CSP_struktura
FROM 'C:\Users\atetere\Documents\R_Training\CSP_struktura.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001', 
	TABLOCK
);

INSERT INTO CSP_struktura
SELECT * FROM [dbo].[RAW CSP_struktura]

SELECT * FROM CSP_struktura

SELECT COUNT(*) 
FROM v2_ZDN2023;

SELECT COUNT(*)
FROM (SELECT DISTINCT *  FROM v2_ZDN2023) AS t;
