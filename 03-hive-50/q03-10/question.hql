-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS data;
CREATE TABLE data (letter    STRING,
                   full_dates STRING,
                   value     INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

CROP TABLE IF EXISTS just_val;
CREATE TABLE just_val AS
SELECT DISTINCT value FROM data 
ORDER BY value
LIMIT 5;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM just_val;