# 26-muitos-para-muito.sql
# Tabela associativa ou de junção

CREATE TABLE matriculas (
    estudante INT NOT NULL,
    disciplina INT NOT NULL,
    -- semestre CHAR(6) NOT NULL,
    -- nota DECIMAL(4,2),
    -- frequencia DECIMAL(5,2),

    PRIMARY KEY (estudante, disciplina),
    -- PRIMARY KEY (estudante, disciplina, semestre),

    FOREIGN KEY (estudante) REFERENCES estudantes(idEstudante),
    FOREIGN KEY (disciplina) REFERENCES disciplinas(idDisciplina)
);