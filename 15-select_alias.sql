SELECT nome AS Nome_Estudante, email AS Email
FROM estudantes;

SELECT UPPER(nome) AS nome_maiusculo
FROM estudantes;

SELECT UPPER(nome) as Nome, LENGTH(nome) AS tamanho_nome
FROM estudantes;

SELECT nome, YEAR(data_nascimento) AS ano
FROM estudantes;

SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM estudantes;