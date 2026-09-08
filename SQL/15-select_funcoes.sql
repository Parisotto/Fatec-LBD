-- SELECT com ALIAS

SELECT nome AS 'Nome do Estudante', email AS 'E-mail'
FROM estudantes;

SELECT UPPER(nome) AS 'Nome em Maiúculas' FROM estudantes;

SELECT LOWER(nome) FROM estudantes;

SELECT nome AS Nome, LENGTH(nome) AS tamanho_do_nome FROM estudantes;

SELECT nome AS Nome, YEAR(data_nascimento) AS Ano FROM estudantes;

SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM estudantes;