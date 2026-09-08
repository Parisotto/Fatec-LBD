-- SELECT com LIKE

SELECT nome FROM estudantes
WHERE nome LIKE 'a%';

SELECT nome FROM estudantes
WHERE nome LIKE '%o';

SELECT nome FROM estudantes
WHERE nome LIKE '%os%';

SELECT nome FROM estudantes
WHERE nome LIKE '%os_%';

SELECT nome FROM estudantes
WHERE nome LIKE '__ca%';

SELECT nome FROM estudantes
WHERE nome LIKE '%_ca%';

SELECT nome FROM estudantes
WHERE nome LIKE '%Silva%';