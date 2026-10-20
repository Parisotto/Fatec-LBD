# 35-joins-anihados.sql

/*
Joins também podem ser usados em tabelas que criamos. 
Para combinar tabelas aninhadas com joins, precisamos 
adicionar AS para identificar a consulta aninhada com um nome.
*/
SELECT t1.col1, t2.col2 FROM t1, (SELECT * FROM tabela) AS t2 WHERE t1.id = t2.id;

/*
Calcule a nota média de cada estudante e retorne o nome e a nota média de cada um.
Nomeie as colunas como student, grade.
Arredonde a média para 2 casas decimais e ordene o resultado pela nota média em ordem crescente.
*/

SELECT students.name as student, avg_grades.grade 
FROM students, (SELECT student_id, ROUND(AVG(grade), 2) AS grade 
FROM grades GROUP BY student_id) AS avg_grades
WHERE students.id = avg_grades.student_id ORDER BY grade;
