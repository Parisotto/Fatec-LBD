# 27-muitos-para-muitos.sql
# Tabela associativa ou de junção

-- DROP TABLE matriculas2;
CREATE TABLE matriculas2 (
    estudante INT NOT NULL,
    disciplina INT NOT NULL,
    semestre CHAR(6) NOT NULL,
    nota DECIMAL(4,2),
    frequencia DECIMAL(5,2),

    -- PRIMARY KEY (estudante, disciplina),
    PRIMARY KEY (estudante, disciplina, semestre),

    CONSTRAINT fk_matricula_estudante FOREIGN KEY (estudante) REFERENCES estudantes(id),
    
    CONSTRAINT fk_matricula_disciplina FOREIGN KEY (disciplina) REFERENCES disciplinas(id)
) engine InnoDB;matriculas2