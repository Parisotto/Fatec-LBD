# 28-estudante-matricula-disciplina.sql

-- Estudante + matricula + disciplina
SELECT e.nome, d.disciplina
FROM estudantes e
INNER JOIN matriculas m
    ON e.idEstudante = m.estudante
INNER JOIN disciplinas d
    ON m.disciplina = d.idDisciplina;
    
