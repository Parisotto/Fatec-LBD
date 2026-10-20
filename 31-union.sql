# 31-union.sql

-- Liste todos os estudantes e suas disciplinas, inclusive os
-- estudantes sem matrícula e as disciplinas sem matriculados

SELECT e.nome AS Estudante, d.nome AS Disciplina
FROM estudantes AS e
LEFT JOIN matriculas2 AS m ON e.id = m.estudante
LEFT JOIN disciplinas AS d ON m.disciplina = d.id

UNION

SELECT e.nome, d.nome
FROM disciplinas AS d
LEFT JOIN matriculas2 AS m ON d.id = m.disciplina
LEFT JOIN estudantes AS e ON m.estudante = e.id

ORDER BY Estudante DESC, Disciplina ASC