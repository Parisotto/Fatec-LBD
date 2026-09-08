# 23-where-um-para-um.sql

SET @n = 0;
UPDATE estudantes
SET contato = (@n := @n + 1)
ORDER BY id;

SELECT * FROM estudantes, contato
WHERE estudantes.contato = contato.idContato;

SELECT e.nome, c.email_principal 
FROM estudantes AS e, contato AS c
WHERE e.contato = c.idContato;

SELECT e.nome, c.email_principal 
FROM estudantes AS e JOIN contato AS c
ON e.contato = c.idContato;
