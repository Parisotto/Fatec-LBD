# 30-left-join.sql

-- "Quero listar todos os estudantes, inclusive aqueles que ainda não possuem matrícula."
SELECT e.nome, d.disciplina
FROM estudantes e
LEFT JOIN matriculas m
    ON e.idEstudante = m.estudante
LEFT JOIN disciplinas d
    ON m.disciplina = d.idDisciplina;
