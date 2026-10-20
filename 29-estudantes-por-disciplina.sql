# 29-estudantes-por-disciplina.sql

-- Quantas disciplinas cada estudante cursa?
SELECT e.nome, COUNT(m.disciplina) AS QuantidadeDisciplina
FROM estudantes AS e INNER JOIN matriculas2 AS m
ON e.id = m.estudante
GROUP BY m.estudante, e.nome;

-- Quantos estudantes cursam cada disciplina?
SELECT d.nome, COUNT(m.estudante) AS quantidade
FROM disciplinas AS d
INNER JOIN matriculas2 AS m 
ON d.id = m.disciplina
GROUP BY m.disciplina, d.nome;






 