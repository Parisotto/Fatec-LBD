# CRUD didático — BibliotecaFatecZS

Página única em PHP/PDO para demonstrar a ligação entre formulários web e SQL. O fluxo da aplicação já está pronto. **A atividade do aluno é completar somente o SQL dentro de `listRows`, `insertRow`, `updateRow` e `deleteRow`**, marcados como TODO 1–4 em `index.php`.

## Requisitos e instalação

- PHP 8.1 ou superior com PDO MySQL habilitado; MySQL/MariaDB.
- Crie o banco e as tabelas conforme as definições abaixo (ou ajuste o mapa `schema()` em `index.php` para corresponder ao banco usado na turma).
- Ajuste `DB_HOST`, `DB_NAME`, `DB_USER` e `DB_PASS` no início de `index.php`.
- Coloque `index.php` no diretório servido pelo PHP e abra no navegador. Em ambiente local, por exemplo, execute `php -S localhost:8000` nessa pasta e acesse `http://localhost:8000`.
- A página pode ser aberta antes de completar os TODOs, mas as operações dependentes de SQL só funcionarão depois que a turma os preencher.

## Esquema presumido

Como não foi fornecido um `CREATE TABLE`, o scaffold assume identificadores inteiros e os nomes/tipos abaixo. Use `InnoDB` para as chaves estrangeiras. Ajuste os nomes no `schema()` se o esquema da aula divergir.

| Tabela | Colunas presumidas |
|---|---|
| `Livro` | `codigo INT` PK, `titulo VARCHAR(200)`, `paginas INT`, `ano YEAR` ou `INT`, `editora INT` FK → `Editora(codigo)`, `categoria INT` FK → `Categoria(codigo)` |
| `Livro_Autor` | `cod_livro INT` FK → `Livro(codigo)`, `cod_autor INT` FK → `Autor(codigo)`, chave primária composta (`cod_livro`, `cod_autor`) |
| `Autor` | `codigo INT` PK, `nome VARCHAR(150)`, `nascimento DATE`, `genero VARCHAR(50)` |
| `Editora` | `codigo INT` PK, `Nome VARCHAR(150)`, `site VARCHAR(255)` |
| `Categoria` | `codigo INT` PK, `categoria VARCHAR(100)`, `grupo VARCHAR(30)`; valores `Humanas`, `Exatas`, `Biomédicas` |
| `Usuario` | `codigo INT` PK, `nome VARCHAR(150)`, `perfil VARCHAR(30)`; valores `aluno`, `professor`, `servidor`; `email VARCHAR(255)` |
| `Emprestimo` | `codigo INT` PK **(acrescentada pelo scaffold)**, `cod_usuario INT` FK, `cod_livro INT` FK, `dt_emprestimo DATE`, `dt_devolvido DATE NULL`, `status VARCHAR(5)` com `sim`/`não` |

Os campos `codigo` são tratados como informados no formulário, não `AUTO_INCREMENT`, para que o mesmo formulário sirva aos tipos de tabela. Se suas chaves forem `AUTO_INCREMENT`, marque esses controles para não serem obrigatórios e retire-os do INSERT. `Emprestimo` precisa de uma chave única para localizar edição/exclusão; aqui foi presumida uma coluna `codigo`. Sem essa coluna, acrescente a PK no banco ou adapte `pk` de `schema()` para uma chave composta que identifique unicamente cada empréstimo (por exemplo, usuário, livro e data do empréstimo).

## Orientação para o SQL dos alunos

- **TODO 1:** retorne todas as colunas da tabela selecionada (`SELECT ... FROM ...`).
- **TODO 2:** insira as colunas e valores recebidos, preservando os placeholders `:v0`, `:v1` etc. e a execução do statement preparado.
- **TODO 3:** atualize os campos com `SET` e use todos os placeholders `:k0`, `:k1` necessários no `WHERE` da chave primária.
- **TODO 4:** exclua usando `WHERE` e todos os placeholders da chave.

A página só aceita tabelas e colunas do mapa allowlist. Valores do formulário são enviados como parâmetros PDO; não concatene dados recebidos do usuário na SQL. Para nomes de tabelas/colunas, use os identificadores já validados pelo scaffold.
