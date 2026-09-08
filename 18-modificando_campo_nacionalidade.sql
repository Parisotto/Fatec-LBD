# 21-alterar-nacionalidade.sql

-- Antere o campo "nacionalidade" da tabela "estudantes" para o tipo "char" com 3 espaços.
-- Aplique o comando de descrição da tabela criada.
-- Aplique o comando de seleção de todos os registros.
-- Use o comando UPDATE para atualizar os valores de todos os registros com campo nacionalidade para "null"

ALTER TABLE estudantes MODIFY nacionalidade CHAR(3);
describe estudantes;
select * from estudantes;