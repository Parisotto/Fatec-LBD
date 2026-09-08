-- 23-join-varias-tabelas.sql
-- SELECT e.id, e.nome, ec.idCurso, c.nome
SELECT e.nome, c.nome 
FROM estudantes e 
JOIN estudantes_cursos ec 
ON e.id = ec.idEstudante
JOIN cursos c 
ON c.id = ec.idCurso
ORDER BY e.nome;