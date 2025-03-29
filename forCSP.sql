SELECT *
FROM console_games;

ALTER TABLE console_games
ADD COLUMN global_sales1 float8;

UPDATE console_games
SET global_sales1 = na_sales + eu_sales + jp_sales + other_sales;

ALTER TABLE console_games
ADD COLUMN ten_percent float;

UPDATE console_games
SET ten_percent = na_sales/global_sales1
WHERE global_sales1 > 0;