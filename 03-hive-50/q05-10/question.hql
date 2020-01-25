-- 
-- Pregunta
-- ===========================================================================
--
-- Realice una consulta que compute la cantidad de veces que aparece cada valor 
-- de la columna `t0.c5`  por año.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;

DROP TABLE IF EXISTS tbl02;

CREATE TABLE tbl02 AS
SELECT YEAR(c4) AS just_year,letter
 FROM tbl0 LATERAL VIEW explode(c5) letter AS letter;
 

DROP TABLE IF EXISTS year_letter_count;

CREATE TABLE year_letter_count AS
SELECT just_year,letter, COUNT(*) AS count
FROM tbl02
GROUP BY
    just_year,letter
ORDER BY
    just_year,letter;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM year_letter_count;
