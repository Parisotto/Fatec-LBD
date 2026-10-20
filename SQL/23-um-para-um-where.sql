# 23-um-para-um-where.sql

set @n = 0;
UPDATE estudantes
SET contato = (@n := @n + 1)
ORDER BY id;

SELECT * FROM estudantes;
SELECT nome, contato FROM estudantes WHERE nome = 'Tamires';

SELECT * FROM estudantes, contato
WHERE estudantes.contato = contato.idContato;

SELECT e.nome, c.email_principal
FROM estudantes AS e, contato AS c
WHERE e.contato = c.idContato;

SELECT e.nome, c.email_principal
FROM estudantes AS e INNER JOIN contato AS c
ON e.contato = c.idContato; 

-- Selecione o nome do estudante, o email secundário, 
-- o número de celular e se tem whatssapp.

SELECT e.nome, c.email_alternativo, c.celular, c.whatsapp
FROM estudantes AS e INNER JOIN contato AS c
ON e.contato = c.idContato
WHERE c.whatsapp = 1 OR e.nome = 'Sofia'; 

select * from estudantes;
