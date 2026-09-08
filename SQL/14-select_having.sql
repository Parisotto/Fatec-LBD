SELECT genero, COUNT(*) AS quantidade
FROM estudantes GROUP BY genero;

SELECT genero, COUNT(*) AS quantidade
FROM estudantes GROUP BY genero
HAVING quantidade > 10;