-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS data;
CREATE TABLE data (letter    STRING,
                   full_date STRING,
                   value     INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

DROP TABLE IF EXISTS word_count;

CREATE TABLE word_count AS
SELECT letter, COUNT(1) AS count
FROM data
GROUP BY
    letter
ORDER BY
    letter;
    
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM word_count;
