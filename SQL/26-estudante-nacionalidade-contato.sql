# 27-estudante-nacionalidade-contato.sql

-- Estudante + nacionalidade
SELECT e.nome, p.pais, p.gentilico
FROM estudantes AS e
INNER JOIN paises AS p
ON e.nacionalidade = p.sigla;

-- Estudante + contato
SELECT e.nome, c.email_principal, c.celular
FROM estudantes AS e
INNER JOIN contato AS c
ON e.contato = c.idContato;

-- Estudante + nacionalidade + contato
SELECT
    e.nome,
    p.pais,
    p.gentilico,
    c.email_principal,
    c.celular
FROM estudantes AS e
INNER JOIN paises AS p
    ON e.nacionalidade = p.sigla
INNER JOIN contato AS c
    ON e.contato = c.idContato;
    
