-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
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

DROP TABLE IF EXISTS ordered_data;

CREARE TABLE ordered_data AS
SELECT * FROM data ORDER BY letter, value;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM ordered_data;