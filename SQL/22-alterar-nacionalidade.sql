# 22-alterar-nacionalidade.sql

-- Altere o campo "nacionalidade" da tabela "estudantes" para o tipo 
	-- "char" com 3 espaços.
-- Aplique o comando de descrição da tabela criada.
-- Aplique o comando de seleção de todos os registros.
-- Use o comando UPDATE para atualizar os valores de todos os registros 
	-- com campo nacionalidade para "null"
-- Aplique novamente o select para verificar se está tudo certoemail

-- Exclua os campos "email" e "telefone" da tabela "estudantes"
-- Inclua o campo "contato", antes de "nacionalidade" tipo inteiro

-- Insira 'BR" em todos os registros da tabela 'estudantes'
-- Modifique a coluna 'nacionalidade" para ser não nula

ALTER TABLE estudantes DROP COLUMN email;
ALTER TABLE estudantes DROP COLUMN telefone;
ALTER TABLE estudantes DROP COLUMN nacionalidade;

ALTER TABLE estudantes ADD COLUMN contato int;
ALTER TABLE estudantes ADD COLUMN nacionalidade varchar(3) DEFAULT 'BR';

SELECT * FROM estudantes;