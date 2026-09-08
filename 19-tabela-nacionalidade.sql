-- 19-tabela-paises.sql
drop table if exists paises;

create table paises (
    sigla char(3) unique not null primary key,
    pais varchar(30) unique not null,
    gentilico varchar(30) unique not null
) engine=InnoDB;

describe paises;

-- Insira, pelo menos, uns 5 dados na tabela "paises"
-- por exemplo: 
	-- 'BR', 'Brasil', 'brasileira'
	-- 'IT', 'Italia', 'italiana'
-- Depois, aplique a instrução de seleção de todos os registros da tabela

insert into paises values
('BR','Brasil','brasileira'),
('IT','Itália','italiana'),
('AR','Argentina','argentina'),
('EUA','Estados Unidos da América','estadunidense'),
('FR','França','francesa'),
('CH','China','chinesa');

select * from paises;