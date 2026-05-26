SELECT DISTINCT nacionalidade
FROM estudantes;

SELECT nome
FROM estudantes
WHERE data_nascimento = (
    SELECT MIN(data_nascimento) FROM estudantes
);