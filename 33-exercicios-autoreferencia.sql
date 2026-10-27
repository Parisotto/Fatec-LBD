/*
# Nome do coordenador de cada professor 
# Conceito: INNER JOIN com autorreferência.Como os professores sem coordenador não possuem correspondência na segunda referência à tabela, eles não aparecem no resultado.
-- Escreva uma consulta SQL que retorne o nome de cada professor e o nome de seu respectivo coordenador. 
-- Os professores que são coordenadores não devem aparecer no resultado.

# Professores subordinados a cada coordenador 
# Conceito: autorreferência com INNER JOIN e filtro IS NULL. A condição identifica os coordenadores principais, enquanto a junção encontra os professores associados a cada um deles.
-- Escreva uma consulta que retorne o nome de cada coordenador e os nomes dos professores que ele coordena. Coordenadores sem subordinados também devem aparecer.

# Identificar os coordenadores
# Conceito: filtragem com IS NULL, sem necessidade de junção. De acordo com a regra de negócio, os professores sem coordenador definido são os próprios coordenadores.
-- Escreva uma consulta SQL que retorne o nome e o e-mail dos professores que exercem a função de coordenador.
*/


















SELECT p.nome AS Professor, c.nome AS Coordenador
FROM professores AS p
INNER JOIN professores AS c
ON p.id_coordenador = c.id
ORDER BY c.nome, p.nome;



SELECT c.nome AS Coordenador, p.nome AS Professor
FROM professores AS c
INNER JOIN professores AS p
ON p.id_coordenador = c.id
WHERE c.id_coordenador IS NULL
ORDER BY c.nome, p.nome;




SELECT nome AS Coordenador, email AS Email
FROM professores
WHERE id_coordenador IS NULL
ORDER BY nome;




SELECT prof.nome AS Professor, coord.nome AS Coordenador
FROM professores AS prof 
INNER JOIN professores AS coord
ON prof.id = coord.id 
WHERE prof.efetivo IS TRUE;