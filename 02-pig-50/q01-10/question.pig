-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (letter:CHARARRAY, date:CHARARRAY, number:INT);

letters = FOREACH data GENERATE letter;

grouped = GROUP letters BY letter;

wordcount = FOREACH grouped GENERATE group, COUNT(letters);

STORE wordcount INTO 'output';

