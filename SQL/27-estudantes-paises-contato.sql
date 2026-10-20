# 27-estudantes-paises-contato.sql

#- Estudante + nacionalidade
-- Selecione nome, pais e nacionalide
-- Use INNER JOIN para ligar as tabelas
-- Use o alias "e" para estudante,"p" para paises
SELECT e.nome, p.pais, p.gentilico
FROM estudantes AS e
INNER JOIN paises AS p
ON e.nacionalidade = p.sigla;

#- Estudante + contato
-- Selecione e.nome, c.email_principal, c.celular
SELECT e.nome, c.email_principal, c.celular
FROM estudantes AS e
INNER JOIN contato AS c
ON e.contato = c.idContato;

#- estudantes + paises + contato
-- Selecione nome, gentilico, email_principal, celular
SELECT e.nome, p.pais, p.gentilico, c.email_principal, c.celuar
FROM estudantes AS e 
INNER JOIN paises AS p ON e.nacionalidade = p.sigla
INNER JOIN contato AS c ON e.contato = c.idContato;

