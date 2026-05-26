drop table nacionalidade;

create table nacionalidade (
	sigla char(3) unique not null primary key,
    pais varchar(30) unique not null,
    gentilico varchar(30) unique not null
) engine=InnoDB;

describe nacionalidade;

insert into nacionalidade values
('BR','Brasil','brasileira'),
('IT','Itália','italiana'),
('AR','Argentina','argentina'),
('EUA','Estados Unidos da América','estadunidense'),
('FR','França','francesa'),
('CH','China','chinesa');

select * from nacionalidade;