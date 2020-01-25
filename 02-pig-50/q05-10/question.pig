-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (upper_case:CHARARRAY, lower_case:BAG{tup:TUPLE(letter:CHARARRAY)},obs:CHARARRAY);

data2 = FOREACH data GENERATE FLATTEN(lower_case) AS letter;

grouped = GROUP data2 BY letter;

letter_count = FOREACH grouped GENERATE group, COUNT($1);

STORE letter_count INTO 'output';