-- 22-join-varias-tabelas.sp
CREATE TABLE matriculas (
    id int NOT NULL AUTO_INCREMENT,
    data date,
    idEstudante int,
    idCurso int,
    PRIMARY KEY (id),
    FOREIGN KEY (idEstudante) REFERENCES estudantes(id),
    FOREIGN KEY (idCurso) REFERENCES cursos(id)
) engine=InnoDB;

DESCRIBE matriculas;

INSERT INTO matriculas VALUES
(default, '2020-06-08', 1, 1),
(default, '2026-06-08', 1, 3),
(default, '2019-06-08', 2, 1),
(default, '2026-06-08', 2, 4),
(default, '2026-06-08', 3, 4),
(default, '2026-06-08', 4, 3);

SELECT * FROM matriculas;

