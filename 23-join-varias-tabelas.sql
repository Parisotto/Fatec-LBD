-- 23-join-varias-tabelas.sql
-- SELECT e.id, e.nome, m.idCurso, c.nome
SELECT e.nome, c.nome 
FROM estudantes e 
JOIN matriculas m 
ON e.id = m.idEstudante
JOIN cursos c 
ON c.id = m.idCurso
ORDER BY e.nome;
