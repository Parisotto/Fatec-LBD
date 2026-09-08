# 29-estudantes-por-disciplina.sql

-- Quantas disciplinas cada estudante cursa?
SELECT e.nome, COUNT(m.disciplina) AS quantidade
FROM estudantes e
INNER JOIN matriculas m
    ON e.idEstudante = m.estudante
GROUP BY e.idEstudante, e.nome;

-- Quantos estudantes cursam cada disciplina?
SELECT d.disciplina, COUNT(m.estudante) AS quantidade
FROM disciplinas d
INNER JOIN matriculas m
    ON d.idDisciplina = m.disciplina
GROUP BY d.idDisciplina, d.disciplina;