# 32-tabela-professores.sql

-- Crie uma tabela "professores"
-- Campos: id, nome, efetivo (boleano), email, celular, data_contrato, id_coordenar

-- Faça o relacionamento entre as tabelas "professores" e "disciplinas"
-- Uma disciplina pode ter diversos professores em semestres difentes
-- Um professor pode ministrar diversas disciplinas

-- Faça uma consulta que retorne todas as disciplinas de um professor específico
-- Uma consulta que retorne todos os professores de uma disciplina específica

CREATE TABLE professores (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    efetivo BOOL DEFAULT FALSE,
    email VARCHAR(40) UNIQUE,
    celular VARCHAR(14) NOT NULL,
    data_contrato DATE,
    id_coordenador INT
    -- FOREIGN KEY (id_coordenador) REFERENCES professores(id)
) engine InnoDB;

CREATE TABLE professores_disciplinas (
	id_professor INT NOT NULL,
    id_disciplina INT NOT NULL,
	ano YEAR NOT NULL,
    semestre TINYINT NOT NULL DEFAULT 1,
    
    PRIMARY KEY (id_professor, id_disciplina, ano, disciplina),
    FOREIGN KEY (id_professor) REFERENCES professores(id),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id),
    
    CHECK (semestre IN (1, 2))
);

INSERT INTO professores
    (nome, efetivo, email, celular, data_contrato, id_coordenador)
VALUES
	('Parisotto', FALSE, 'parisotto@cps.sp.gov.br', '(11)99999-9999', '2025-10-23', 1),
    ('Ana Martins', TRUE, 'ana@faculdade.edu.br', '(11)98765-1001', '2018-02-01', NULL),
    ('Bruno Almeida', TRUE, 'bruno@faculdade.edu.br', '(11)98765-1002', '2019-03-15', 1),
    ('Carlos Souza', FALSE, 'carlos@faculdade.edu.br', '(11)98765-1003', '2024-08-01', 1),
    ('Daniela Costa', TRUE, 'daniela@faculdade.edu.br', '(11)98765-1004', '2020-06-10', 2),
    ('Eduardo Lima', FALSE, 'eduardo@faculdade.edu.br', '(11)98765-1005', '2025-02-03', 2),
    ('Fernanda Rocha', TRUE, 'fernanda@faculdade.edu.br', '(11)98765-1006', '2017-08-01', 1),
    ('Gabriel Alves', FALSE, 'gabriel@faculdade.edu.br', '(11)98765-1007', '2023-03-01', 4),
    ('Helena Ribeiro', TRUE, 'helena@faculdade.edu.br', '(11)98765-1008', '2021-01-10', 4),
    ('Igor Mendes', FALSE, 'igor@faculdade.edu.br', '(11)98765-1009', '2026-02-02', 6);


ALTER TABLE professores ADD CONSTRAINT fk_professores_coordenador
FOREIGN KEY (id_coordenador) REFERENCES professores(id);

-- Distribuição de disciplinas entre professores
-- Ano: 2026 | Semestre: 1

INSERT INTO professores_disciplinas
    (id_professor, id_disciplina, ano, semestre)
VALUES
    -- Professor 1: 3 disciplinas
    (1, 1, 2026, 1),
    (1, 4, 2026, 1),
    (1, 7, 2026, 1),
    -- Professor 2: 2 disciplinas
    (2, 2, 2026, 1),
    (2, 5, 2026, 1),
    -- Professor 3: 4 disciplinas
    (3, 1, 2026, 1),
    (3, 3, 2026, 1),
    (3, 6, 2026, 1),
    (3, 9, 2026, 1),
    -- Professor 4: 1 disciplina
    (4, 8, 2026, 1),
    -- Professor 5: 5 disciplinas
    (5, 2, 2026, 1),
    (5, 4, 2026, 1),
    (5, 6, 2026, 1),
    (5, 10, 2026, 1),
    (5, 11, 2026, 1),
    -- Professor 6: 2 disciplinas
    (6, 3, 2026, 1),
    (6, 2, 2026, 1),
    -- Professor 7: 3 disciplinas
    (7, 5, 2026, 1),
    (7, 7, 2026, 1),
    (7, 9, 2026, 1),
    -- Professor 8: 1 disciplina
    (8, 10, 2026, 1);

-- Professores 9 e 10 ficam sem disciplinas.
-- A disciplina 12 possui professor neste exemplo.

SELECT
    p.nome AS Professor,
    d.nome AS Disciplina,
    pd.ano AS Ano,
    pd.semestre AS Semestre
FROM professores AS p
INNER JOIN professores_disciplinas AS pd
    ON p.id = pd.id_professor
INNER JOIN disciplinas AS d
    ON pd.id_disciplina = d.id
WHERE p.nome = 'Parisotto'
ORDER BY d.nome;

SELECT
    d.nome AS Disciplina,
    p.nome AS Professor,
    pd.ano AS Ano,
    pd.semestre AS Semestre
FROM disciplinas AS d
INNER JOIN professores_disciplinas AS pd
    ON d.id = pd.id_disciplina
INNER JOIN professores AS p
    ON pd.id_professor = p.id
WHERE d.nome = 'Banco de dados'
ORDER BY p.nome;


