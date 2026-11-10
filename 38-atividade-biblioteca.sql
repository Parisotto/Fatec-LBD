# 38-atividade-biblioteca.sql

-- Exercício 1 – Listar livros com suas editoras e categorias
-- Exercício 2 – Listar livros e seus respectivos autores
-- Exercício 3 – Listar empréstimos com nomes dos usuários e títulos dos livros
-- Exercício 4 – Listar somente os livros atualmente emprestados
-- Exercício 5 – Quantidade de livros por categoria

# Observações importantes para a atividade
/*
Livro e Autor: relacionamento N:N, resolvido pela tabela intermediária Livro_Autor.
Livro e Editora: relacionamento 1:N. Uma editora pode publicar vários livros.
Livro e Categoria: relacionamento 1:N. Uma categoria pode classificar vários livros.
Usuario e Emprestimo: relacionamento 1:N.
Livro e Emprestimo: relacionamento 1:N.

Sobre o campo status: considerando SIM como livro ainda emprestado 
e NAO como empréstimo já encerrado. Quando o livro for devolvido, 
a aplicação deverá atualizar dt_devolvido e status.
*/


# Exercício 1 – Listar livros com suas editoras e categorias
SELECT
    l.codigo,
    l.titulo,
    l.paginas,
    l.ano,
    e.nome AS Editora,
    c.categoria AS Categoria,
    c.grupo
FROM Livro l
INNER JOIN Editora e
    ON l.editora = e.codigo
INNER JOIN Categoria c
    ON l.categoria = c.codigo;
    
# Exercício 2 – Listar livros e seus respectivos autores  
SELECT
    l.titulo AS Livro,
    a.nome AS Autor
FROM Livro l
INNER JOIN Livro_Autor la
    ON l.codigo = la.cod_livro
INNER JOIN Autor a
    ON la.cod_autor = a.codigo;SELECT
    l.titulo AS Livro,
    a.nome AS Autor
FROM Livro l
INNER JOIN Livro_Autor la
    ON l.codigo = la.cod_livro
INNER JOIN Autor a
    ON la.cod_autor = a.codigo;
    
# Exercício 3 – Listar empréstimos com nomes dos usuários e títulos dos livros
SELECT
    u.nome AS Usuario,
    u.perfil,
    l.titulo AS Livro,
    e.dt_emprestimo,
    e.dt_devolvido,
    e.status
FROM Emprestimo e
INNER JOIN Usuario u
    ON e.cod_usuario = u.codigo
INNER JOIN Livro l
    ON e.cod_livro = l.codigo;
    
# Exercício 4 – Listar somente os livros atualmente emprestados
SELECT
    u.nome AS Usuario,
    l.titulo AS Livro,
    e.dt_emprestimo
FROM Emprestimo e
INNER JOIN Usuario u
    ON e.cod_usuario = u.codigo
INNER JOIN Livro l
    ON e.cod_livro = l.codigo
WHERE e.status = 'SIM';

# Exercício 5 – Quantidade de livros por categoria
SELECT
    c.categoria,
    c.grupo,
    COUNT(l.codigo) AS quantidade
FROM Categoria c
LEFT JOIN Livro l
    ON c.codigo = l.categoria
GROUP BY c.codigo, c.categoria, c.grupo
ORDER BY quantidade DESC;


