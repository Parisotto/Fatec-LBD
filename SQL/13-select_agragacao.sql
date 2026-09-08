-- SELECT com Agregação

SELECT COUNT(*) AS total_estudantes
FROM estudantes;

SELECT genero, COUNT(*) AS total
FROM estudantes
GROUP BY genero;