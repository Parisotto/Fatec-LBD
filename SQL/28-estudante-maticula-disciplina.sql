# 28-estudante-matricula-disciplina.sql

-- Estudante + matricula + disciplina
SELECT e.nome, d.disciplina
FROM estudantes AS e
INNER JOIN matriculas AS m
    ON e.idEstudante = m.estudante
INNER JOIN disciplinas AS d
    ON m.disciplina = d.idDisciplina;
    
