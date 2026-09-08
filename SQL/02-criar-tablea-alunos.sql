create table alunos (
	nome varchar(30) not null,
    data_nasc date,
    genero enum('M', 'F', 'N'),
    peso decimal(5, 2),
    altura decimal (3, 2),
    email varchar(40) unique,
    nacionalidade varchar(20) default 'Brasil'
) engine=InnoDB;

describe alunos;

drop table alunos;