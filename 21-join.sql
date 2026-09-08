-- 21-join.sql
SELECT nome, nacionalidade FROM estudantes;

SELECT e.nome, e.nacionalidade AS Sigla, p.pais, p.gentilico AS Nacionalidade
FROM estudantes AS e INNER JOIN paises AS p
ON e.nacionalidade = p.sigla
ORDER BY e.nome;

SELECT e.nome, e.nacionalidade AS Sigla, p.pais, p.gentilico AS Nacionalidade
FROM estudantes AS e LEFT OUTER JOIN paises AS p
ON e.nacionalidade = p.sigla
ORDER BY e.nome;

SELECT e.nome, e.nacionalidade AS Sigla, p.pais, p.gentilico AS Nacionalidade
FROM estudantes AS e RIGHT OUTER JOIN paises AS p
ON e.nacionalidade = p.sigla
ORDER BY e.nome;