SELECT nome, nacionalidade FROM estudantes;

SELECT e.nome, e.nacionalidade AS Sigla, n.pais, n.gentilico AS Nacionalidade
FROM estudantes AS e INNER JOIN nacionalidade AS n
ON e.nacionalidade = n.sigla
ORDER BY e.nome;

SELECT e.nome, e.nacionalidade AS Sigla, n.pais, n.gentilico AS Nacionalidade
FROM estudantes AS e LEFT OUTER JOIN nacionalidade AS n
ON e.nacionalidade = n.sigla
ORDER BY e.nome;

SELECT e.nome, e.nacionalidade AS Sigla, n.pais, n.gentilico AS Nacionalidade
FROM estudantes AS e RIGHT OUTER JOIN nacionalidade AS n
ON e.nacionalidade = n.sigla
ORDER BY e.nome;