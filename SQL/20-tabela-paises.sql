# 20-tabela-paises.sql

-- Crie uma tabela "paises" com os seguintes campos:
	-- "sigla" tipo "char" com 3 espaços, unico, não nulo, chave primária.
	-- "pais" tipo "varchar" com 30 espaços, unico, não nulo,
	-- "gentilico", tipo "varchar", com 30 espaços, unico, não nulo
	-- Sempre defina a "engine" como InnoDB
	-- Depois de criada, aplique a instrução de descrição da tabela criada.
    
-- create table paises ( id int ) engine InnoDB;
CREATE TABLE paises (
    sigla char(3) primary key,
    pais varchar(30) unique not null,
    gentilico varchar(30) unique not null
) ENGINE InnoDB;

DESCRIBE paises;
    
-- Insira, pelo menos, uns 5 dados na tabela "paises"
-- por exemplo: 
	-- 'BR', 'Brasil', 'brasileira'
	-- 'IT', 'Italia', 'italiana'
-- Depois, aplique a instrução de seleção de todos os registros da tabela

INSERT INTO paises (sigla, pais, gentilico) VALUES
('BR', 'Brasil', 'brasileira'),
('IT', 'Itália', 'italiana'),
('FR', 'França', 'francesa'),
('DE', 'Alemanha', 'alemã'),
('ES', 'Espanha', 'espanhola'),
('PT', 'Portugal', 'portuguesa'),
('AR', 'Argentina', 'argentina'),
('CL', 'Chile', 'chilena'),
('JP', 'Japão', 'japonesa'),
('US', 'Estados Unidos', 'estadunidense');

SELECT * FROM paises;