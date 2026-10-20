-- select * from matriculas2;
-- INSIRA 5 NOVOS REGISTROS EM MATRÍCULAS;

-- Consulta Estudantes + Nacionalidade
-- Selecione nome do aluno, o pais da nacionalidade e o gentilico
SELECT e.nome, p.pais, p.gentilico
FROM estudantes AS e
JOIN paises AS p
ON e.nacionalidade = p.sigla;

-- Consulta Estudante + Contato
-- Selecione o nome do estudante, seu email principal e celular
SELECT e.nome, c.email_principal, c.celular
FROM estudantes AS e
JOIN contato AS c
ON e.contato = c.idContato;

-- Consulta Estudante + Nacionalidade + Contato
-- Selecione o nome do estudante, o pais por extenso, o gentilico, 
-- o email principal e o celular;
SELECT e.nome, p.pais, p.gentilico, c.email_principal, c.celular
FROM estudantes AS e INNER JOIN paises AS p ON e.nacionalidade = p.sigla
INNER JOIN contato AS c ON e.contato = c.idContato;
