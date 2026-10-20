# 30-left-join.sql

-- Quero listar todos os estudantes e suas disciplinas, 
-- inclusive aqueles que ainda não possuem matrícula

SELECT e.nome, d.nome 
FROM estudantes AS e
LEFT JOIN matriculas2 AS m ON e.id = m.estudante
LEFT JOIN disciplinas AS d ON m.disciplina = d.id
ORDER BY e.nome DESC;

-- Quero listar todas AS DICIPLINAS e seus estudantes, 
-- inclusive aquelas que ainda não possuem nenhum
-- estudante matriculado

SELECT d.nome, e.nome 
FROM disciplinas AS d
LEFT JOIN matriculas2 AS m ON d.id = m.disciplina
LEFT JOIN estudantes AS e ON m.estudante = e.id
ORDER BY d.nome;

-- COM RIGHT JOIN
SELECT d.nome, e.nome 
FROM estudantes AS e
RIGHT JOIN matriculas2 AS m ON e.id = m.estudante
RIGHT JOIN disciplinas AS d ON m.disciplina = d.id
ORDER BY d.nome DESC;