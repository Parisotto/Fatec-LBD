# 28-muitos-para-muitos.sql
# Tabela associativa ou de junçao

-- Mude o nome da tabela cursos para disciplinas
-- ALTER TABLE cursos RENAME TO disciplinas

# RENAME TABLE cursos TO disciplinas;

CREATE TABLE matriculas (
	idEstudante INT NOT NULL,
    idDisciplina INT NOT NULL,
    semestre CHAR(6) NOT NULL,
    nota DECIMAL(3,1),
    frequencia DECIMAL(5,2),
    
    PRIMARY KEY (idEstudante, idDisciplina, semestre),
 
	FOREIGN KEY (idEstudante) REFERENCES estudantes(id),
    FOREIGN KEY (idDisciplina) REFERENCES disciplinas(id)
);