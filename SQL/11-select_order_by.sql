SELECT nome, data_nascimento 
FROM estudantes
ORDER BY data_nascimento;

SELECT nome, data_nascimento 
FROM estudantes
ORDER BY nome;

SELECT nome, data_nascimento
FROM estudantes
WHERE nacionalidade = 'Brasil'
ORDER BY nome DESC;