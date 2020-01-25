-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (letter:CHARARRAY,date:CHARARRAY,number:INT);

numbers = FOREACH data GENERATE number;

ordered_numbers = ORDER numbers BY number;

first_numbers = LIMIT ordered_numbers 5;

STORE first_numbers INTO 'output';