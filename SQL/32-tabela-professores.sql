# 32-tabela-professores.sql

-- Crie uma tabela "professores"
-- Campos: id, nome, efetivo (boleano), email, celular(só número), data_contrato, idCoordenador
-- Crie o relacionamente entre as tabelas "professores" e "disciplinas"
-- Uma disciplina pode ter professores diversos em semestres diferentes
-- Um professor pode ministrar diversas disciplinas

-- Elabore uma consulta usando JOIN que retorne o nome da disciplina e seu professor em todos os semestres registrados

-- Uma consulta que retorne todas as disciplinas de um professor específico.
-- Uma consulta que retorne todos os professores de uma disciplina específica.

# Auto-JOIN
SELECT prof.nome AS Professor, coord.nome AS Coordenador
FROM professores AS prof JOIN professores AS coord
ON prof.id = coord.id WHERE prof.efetivo IS TRUE;
