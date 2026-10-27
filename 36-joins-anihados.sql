# 36-joins-anihados.sql

/*
Joins também podem ser usados em tabelas que criamos. 
Para combinar tabelas aninhadas com joins, precisamos 
adicionar AS para identificar a consulta aninhada com um nome.
*/
SELECT t1.col1, t2.col2 
FROM t1, (SELECT * FROM tabela) AS t2 
WHERE t1.id = t2.id;

/*
Escreva uma consulta SQL que calcule a nota média de cada estudante, arredondando o resultado para duas casas decimais. Utilize uma consulta aninhada para calcular as médias e relacione o resultado com a tabela estudantes utilizando apenas a cláusula WHERE, sem utilizar JOIN.

Apresente o nome de cada estudante e sua respectiva nota média, ordenando o resultado pela média em ordem decrescente, da maior para a menor.
*/

 
 
 






SELECT e.nome AS Aluno, medias.nota 
FROM estudantes AS e, 
(SELECT estudante, ROUND(AVG(nota), 2) AS nota 
FROM matriculas2 GROUP BY estudante) AS medias
WHERE e.id = medias.estudante
ORDER BY nota DESC;
