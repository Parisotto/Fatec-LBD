# Crie um bando de dados "biblioteca"
-- Tabelas: Livro, Livro_Autor, Autor, Editora, Categoria, Usuario, Emprestimo
/* 
Livro: codigo, titulo, paginas, ano, editora, categoria
Autor: codigo, nome, nascimento, genero
Livro_Autor: cod_livro, cod_autor
Editora: codigo, Nome, site
Categoria: codigo, categoria, grupo (Humanas, Exatas, Biomédicas)
Usuario: codigo, nome, perfil (aluno, professor, servidor), email
Emprestimo: cod_usuario, cod_livro, dt_emprestimo, dt_devolvido, status (emprestado: sim/não)
*/

# Faça os relacionamentos
# Insira dados de exemplo usando INSERT TO em todas as tabelas
# Verifique os dados inseridos usando SELECT

# 1 Criação do Banco de dados "biblioteca"
-- =========================================
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

# 2 Criação das 7  tabelas e seus relacionamentos
-- =========================================
-- TABELA: Editora
-- =========================================
CREATE TABLE Editora (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    site VARCHAR(200)
) ENGINE = InnoDB;

-- =========================================
-- TABELA: Categoria
-- =========================================
CREATE TABLE Categoria (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(80) NOT NULL,
    grupo ENUM('Humanas', 'Exatas', 'Biomédicas') NOT NULL
) ENGINE = InnoDB;

-- =========================================
-- TABELA: Autor
-- =========================================
CREATE TABLE Autor (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE,
    genero VARCHAR(30)
) ENGINE = InnoDB;

-- =========================================
-- TABELA: Livro
-- =========================================
CREATE TABLE Livro (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    paginas INT,
    ano YEAR,
    editora INT NOT NULL,
    categoria INT NOT NULL,

    CONSTRAINT fk_livro_editora
        FOREIGN KEY (editora)
        REFERENCES Editora(codigo),

    CONSTRAINT fk_livro_categoria
        FOREIGN KEY (categoria)
        REFERENCES Categoria(codigo)
) ENGINE = InnoDB;

-- =========================================
-- TABELA: Livro_Autor
-- =========================================
CREATE TABLE Livro_Autor (
    cod_livro INT NOT NULL,
    cod_autor INT NOT NULL,

    PRIMARY KEY (cod_livro, cod_autor),

    CONSTRAINT fk_livroautor_livro
        FOREIGN KEY (cod_livro)
        REFERENCES Livro(codigo),

    CONSTRAINT fk_livroautor_autor
        FOREIGN KEY (cod_autor)
        REFERENCES Autor(codigo)
) ENGINE = InnoDB;

-- =========================================
-- TABELA: Usuario
-- =========================================
CREATE TABLE Usuario (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    perfil ENUM('aluno', 'professor', 'servidor') NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE
) ENGINE = InnoDB;

-- =========================================
-- TABELA: Emprestimo
-- =========================================
CREATE TABLE Emprestimo (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    cod_usuario INT NOT NULL,
    cod_livro INT NOT NULL,
    dt_emprestimo DATE NOT NULL,
    dt_devolvido DATE,
    status ENUM('SIM', 'NAO') NOT NULL DEFAULT 'SIM',

    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (cod_usuario)
        REFERENCES Usuario(codigo),

    CONSTRAINT fk_emprestimo_livro
        FOREIGN KEY (cod_livro)
        REFERENCES Livro(codigo)
) ENGINE = InnoDB;

# 3 Inserindo dados de exemplo
-- =========================================
-- TABELA: Editora
-- =========================================
INSERT INTO Editora (nome, site) VALUES
('Novatec', 'https://novatec.com.br'),
('Pearson', 'https://www.pearson.com'),
('Companhia das Letras', 'https://www.companhiadasletras.com.br'),
('Editora Atlas', 'https://www.grupogen.com.br');


-- =========================================
-- TABELA: Categoria
-- =========================================
INSERT INTO Categoria (categoria, grupo) VALUES
('Programação', 'Exatas'),
('Banco de Dados', 'Exatas'),
('Literatura Brasileira', 'Humanas'),
('Administração', 'Humanas'),
('Biologia', 'Biomédicas');

-- =========================================
-- TABELA: Autor
-- =========================================
INSERT INTO Autor (nome, nascimento, genero) VALUES
('Robert C. Martin', '1952-12-05', 'Masculino'),
('Abraham Silberschatz', '1952-01-01', 'Masculino'),
('Machado de Assis', '1839-06-21', 'Masculino'),
('Idalberto Chiavenato', '1936-04-10', 'Masculino'),
('Charles Darwin', '1809-02-12', 'Masculino');


-- =========================================
-- TABELA: Livro
-- =========================================
INSERT INTO Livro (titulo, paginas, ano, editora, categoria) VALUES
('Código Limpo', 425, 2009, 1, 1),
('Sistema de Banco de Dados', 744, 2019, 2, 2),
('Dom Casmurro', 256, 1899, 3, 3),
('Introdução à Teoria Geral da Administração', 640, 2014, 4, 4),
('A Origem das Espécies', 502, 1859, 3, 5);

-- =========================================
-- TABELA: Livro_Autor
-- =========================================
INSERT INTO Livro_Autor (cod_livro, cod_autor) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- =========================================
-- TABELA: Usuario
-- =========================================
INSERT INTO Usuario (nome, perfil, email) VALUES
('Ana Souza', 'aluno', 'ana@fatec.sp.gov.br'),
('Carlos Lima', 'aluno', 'carlos@fatec.sp.gov.br'),
('Maria Oliveira', 'professor', 'maria@fatec.sp.gov.br'),
('João Santos', 'servidor', 'joao@fatec.sp.gov.br'),
('Pedro Almeida', 'professor', 'pedro@fatec.sp.gov.br');


-- =========================================
-- TABELA: Emprestimo
-- =========================================
INSERT INTO Emprestimo
(cod_usuario, cod_livro, dt_emprestimo, dt_devolvido, status)
VALUES
(1, 1, '2026-10-20', NULL, 'SIM'),
(2, 2, '2026-10-15', '2026-10-25', 'NAO'),
(3, 3, '2026-10-22', NULL, 'SIM'),
(4, 4, '2026-10-10', '2026-10-20', 'NAO'),
(5, 5, '2026-10-28', NULL, 'SIM');

# 4 Verificando os dados inseriso
SELECT * FROM Editora;
SELECT * FROM Categoria;
SELECT * FROM Autor;
SELECT * FROM Livro;
SELECT * FROM Livro_Autor;
SELECT * FROM Usuario;
SELECT * FROM Emprestimo;

