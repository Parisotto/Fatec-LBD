<?php
declare(strict_types=1);

/*
 * BibliotecaFatecZS — scaffold didático de CRUD.
 * Os alunos devem completar SOMENTE o SQL nos quatro métodos marcados TODO.
 */

const DB_HOST = '127.0.0.1';
const DB_NAME = 'biblioteca';
const DB_USER = 'root';
const DB_PASS = '';
const DB_CHARSET = 'utf8mb4';

function db(): PDO
{
    static $pdo = null;
    if ($pdo instanceof PDO) return $pdo;
    $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET;
    $pdo = new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
    return $pdo;
}

// Allowlist de tabelas, colunas, chaves e relações. Nunca aceite identificadores da URL diretamente.
function schema(): array
{
    return [
        'Livro' => ['pk' => ['codigo'], 'fields' => [
            'codigo' => ['label'=>'Código','type'=>'number'], 'titulo'=>['label'=>'Título','type'=>'text'],
            'paginas'=>['label'=>'Páginas','type'=>'number'], 'ano'=>['label'=>'Ano','type'=>'number'],
            'editora'=>['label'=>'Editora','type'=>'select','ref'=>['Editora','codigo','Nome']],
            'categoria'=>['label'=>'Categoria','type'=>'select','ref'=>['Categoria','codigo','categoria']],
        ]],
        'Livro_Autor' => ['pk' => ['cod_livro','cod_autor'], 'fields' => [
            'cod_livro'=>['label'=>'Livro','type'=>'select','ref'=>['Livro','codigo','titulo']],
            'cod_autor'=>['label'=>'Autor','type'=>'select','ref'=>['Autor','codigo','nome']],
        ]],
        'Autor' => ['pk' => ['codigo'], 'fields' => [
            'codigo'=>['label'=>'Código','type'=>'number'], 'nome'=>['label'=>'Nome','type'=>'text'],
            'nascimento'=>['label'=>'Nascimento','type'=>'date'], 'genero'=>['label'=>'Gênero','type'=>'text'],
        ]],
        'Editora' => ['pk' => ['codigo'], 'fields' => [
            'codigo'=>['label'=>'Código','type'=>'number'], 'Nome'=>['label'=>'Nome','type'=>'text'], 'site'=>['label'=>'Site','type'=>'url'],
        ]],
        'Categoria' => ['pk' => ['codigo'], 'fields' => [
            'codigo'=>['label'=>'Código','type'=>'number'], 'categoria'=>['label'=>'Categoria','type'=>'text'],
            'grupo'=>['label'=>'Grupo','type'=>'select','options'=>['Humanas','Exatas','Biomédicas']],
        ]],
        'Usuario' => ['pk' => ['codigo'], 'fields' => [
            'codigo'=>['label'=>'Código','type'=>'number'], 'nome'=>['label'=>'Nome','type'=>'text'],
            'perfil'=>['label'=>'Perfil','type'=>'select','options'=>['aluno','professor','servidor']], 'email'=>['label'=>'E-mail','type'=>'email'],
        ]],
        'Emprestimo' => ['pk' => ['codigo'], 'fields' => [
            'codigo'=>['label'=>'Código','type'=>'number'],
            'cod_usuario'=>['label'=>'Usuário','type'=>'select','ref'=>['Usuario','codigo','nome']],
            'cod_livro'=>['label'=>'Livro','type'=>'select','ref'=>['Livro','codigo','titulo']],
            'dt_emprestimo'=>['label'=>'Data do empréstimo','type'=>'date'], 'dt_devolvido'=>['label'=>'Data da devolução','type'=>'date','nullable'=>true],
            'status'=>['label'=>'Emprestado?','type'=>'select','options'=>['sim','não']],
        ]],
    ];
}

function identifier(string $name, array $allowed): string
{
    if (!in_array($name, $allowed, true)) throw new InvalidArgumentException('Identificador inválido.');
    return '`' . str_replace('`', '``', $name) . '`';
}

function listRows(PDO $pdo, string $table, array $config): array
{
    $safeTable = identifier($table, array_keys($config));
    $columns = array_keys($config[$table]['fields']);
    $safeColumns = array_map(fn($c) => identifier($c, $columns), $columns);

    $safePrimaryKey = array_map(fn($c) => identifier($c, $columns), $config[$table]['pk']);
    $sql = 'SELECT ' . implode(', ', $safeColumns)
        . ' FROM ' . $safeTable
        . ' ORDER BY ' . implode(', ', $safePrimaryKey);

    return $pdo->query($sql)->fetchAll();
}

function insertRow(PDO $pdo, string $table, array $data, array $config): void
{
    $fields = array_keys($config[$table]['fields']);
    $safeTable = identifier($table, array_keys($config));
    $columns = array_values(array_intersect($fields, array_keys($data)));
    $safeColumns = array_map(fn($c) => identifier($c, $fields), $columns);
    $placeholders = array_map(fn($i) => ':v' . $i, array_keys($columns));

    $sql = 'INSERT INTO ' . $safeTable . ' (' . implode(', ', $safeColumns) . ') VALUES (' . implode(', ', $placeholders) . ')';

    $stmt = $pdo->prepare($sql);
    foreach ($columns as $i => $column) $stmt->bindValue(':v' . $i, $data[$column] === '' ? null : $data[$column]);
    $stmt->execute();
}

// TODO 3 — UPDATE: escreva aqui o SQL UPDATE com WHERE para todas as colunas da chave primária.
function updateRow(PDO $pdo, string $table, array $data, array $key, array $config): void
{
    $fields = array_keys($config[$table]['fields']);
    $pk = $config[$table]['pk'];
    $safeTable = identifier($table, array_keys($config));
    $columns = array_values(array_intersect($fields, array_keys($data)));
    $sets = [];
    foreach ($columns as $i => $column) $sets[] = identifier($column, $fields) . ' = :v' . $i;
    $where = [];
    foreach ($pk as $i => $column) $where[] = identifier($column, $fields) . ' = :k' . $i;

    // TODO: substitua o comentário por UPDATE ... SET ... WHERE ... (com placeholders).
    $sql = 'UPDATE ' . $safeTable . ' SET ' . implode(', ', $sets) . ' WHERE ' . implode(' AND ', $where);

    $stmt = $pdo->prepare($sql);
    foreach ($columns as $i => $column) $stmt->bindValue(':v' . $i, $data[$column] === '' ? null : $data[$column]);
    foreach ($pk as $i => $column) $stmt->bindValue(':k' . $i, $key[$column]);
    $stmt->execute();
}

// TODO 4 — DELETE: escreva aqui o SQL DELETE com WHERE para todas as colunas da chave primária.
function deleteRow(PDO $pdo, string $table, array $key, array $config): void
{
    $fields = array_keys($config[$table]['fields']);
    $pk = $config[$table]['pk'];
    $safeTable = identifier($table, array_keys($config));
    $where = [];
    foreach ($pk as $i => $column) $where[] = identifier($column, $fields) . ' = :k' . $i;


    // TODO: substitua o comentário por DELETE FROM ... WHERE ... (com placeholders).
    $sql = '/* TODO: DELETE FROM ' . $safeTable . ' WHERE ' . implode(' AND ', $where) . ' */';

    $stmt = $pdo->prepare($sql);
    foreach ($pk as $i => $column) $stmt->bindValue(':k' . $i, $key[$column]);
    $stmt->execute();
}

function h(mixed $value): string { return htmlspecialchars((string)$value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); }
function postData(array $fields): array
{
    $data = [];
    foreach ($fields as $name => $meta) {
        if (array_key_exists($name, $_POST)) $data[$name] = trim((string)$_POST[$name]);
    }
    return $data;
}
function keyFromRequest(array $pk): array
{
    $key = [];
    foreach ($pk as $column) {
        $value = $_POST['key'][$column] ?? $_GET['key'][$column] ?? null;
        if ($value === null || $value === '') throw new InvalidArgumentException('Chave primária ausente.');
        $key[$column] = $value;
    }
    return $key;
}
function renderControl(string $name, array $meta, mixed $value, ?PDO $pdo, bool $readonly = false): void
{
    $label = $meta['label'];
    echo '<label>' . h($label) . '<br>';
    if (isset($meta['ref'])) {
        [$table, $id, $display] = $meta['ref'];
        $allowed = schema();
        $sql = 'SELECT ' . identifier($id, array_keys($allowed[$table]['fields'])) . ', ' . identifier($display, array_keys($allowed[$table]['fields'])) . ' FROM ' . identifier($table, array_keys($allowed));
        try { $options = $pdo ? $pdo->query($sql)->fetchAll(PDO::FETCH_NUM) : []; } catch (Throwable) { $options = []; }
        echo '<select name="' . h($name) . '"' . ($readonly ? ' disabled' : '') . '><option value="">— selecione —</option>';
        foreach ($options as [$idValue, $text]) echo '<option value="' . h($idValue) . '"' . ((string)$value === (string)$idValue ? ' selected' : '') . '>' . h($text) . ' (#' . h($idValue) . ')</option>';
        echo '</select>';
    } elseif (isset($meta['options'])) {
        echo '<select name="' . h($name) . '"' . ($readonly ? ' disabled' : '') . '><option value="">— selecione —</option>';
        foreach ($meta['options'] as $option) echo '<option value="' . h($option) . '"' . ((string)$value === (string)$option ? ' selected' : '') . '>' . h($option) . '</option>';
        echo '</select>';
    } else {
        echo '<input name="' . h($name) . '" type="' . h($meta['type']) . '" value="' . h($value ?? '') . '"' . ($readonly ? ' readonly' : '') . (!empty($meta['nullable']) ? '' : ' required') . '>';
    }
    echo '</label>';
}

$config = schema();
$table = $_REQUEST['table'] ?? 'Livro';
if (!is_string($table) || !array_key_exists($table, $config)) $table = 'Livro';
$meta = $config[$table];
$editing = isset($_GET['edit']);
$formValues = [];
$notice = '';
$error = '';
try {
    $pdo = db();
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $action = $_POST['action'] ?? '';
        if ($action === 'save') {
            $data = postData($meta['fields']);
            if (!empty($_POST['editing'])) updateRow($pdo, $table, $data, keyFromRequest($meta['pk']), $config);
            else insertRow($pdo, $table, $data, $config);
            header('Location: ?table=' . rawurlencode($table) . '&saved=1'); exit;
        } elseif ($action === 'delete') {
            deleteRow($pdo, $table, keyFromRequest($meta['pk']), $config);
            header('Location: ?table=' . rawurlencode($table) . '&deleted=1'); exit;
        }
    }
    if (isset($_GET['saved'])) $notice = 'Registro salvo.';
    if (isset($_GET['deleted'])) $notice = 'Registro excluído.';
    if ($editing) {
        $key = keyFromRequest($meta['pk']);

        // TODO SELECT de um registro para preencher o formulário usa a mesma função de listagem.

        foreach (listRows($pdo, $table, $config) as $row) {
            $match = true; foreach ($meta['pk'] as $column) if ((string)$row[$column] !== (string)$key[$column]) $match = false;
            if ($match) { $formValues = $row; break; }
        }
    }
    $rows = listRows($pdo, $table, $config);
} catch (Throwable $e) {
    $error = $e->getMessage();
    $pdo = isset($pdo) && $pdo instanceof PDO ? $pdo : null;
    $rows = [];
}
?>

<!doctype html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUD Biblioteca Fatec ZS</title>
        <style>
            body{
                font:16px system-ui,sans-serif;
                max-width:1100px;
                margin:2rem auto;
                padding:0 1rem;color:#20252b
            }
            h1{margin-bottom:.2rem}
            .intro{color:#4b5563}
            .box{
                border:1px solid #ccd3dc;
                border-radius:8px;
                padding:1rem;
                margin:1rem 0
            }
            label{
                display:inline-block;
                margin:.45rem 1rem .45rem 0;
                min-width:190px
            }
            input,select{
                padding:.45rem;
                min-width:180px
            }
            button,.btn{
                padding:.45rem .7rem;
                margin:.15rem;
                cursor:pointer
            }
            .notice{
                background:#e5f6e9;
                padding:.7rem
            }
            .error{
                background:#ffeded;
                padding:.7rem;
                white-space:pre-wrap
            }
            table{
                border-collapse:collapse;
                width:100%;
                margin-top:1rem
            }
            th,td{
                border:1px solid #ccd3dc;
                padding:.5rem;
                text-align:left
            }
            th{background:#f1f4f7}
            .muted{
                font-size:.9rem;
                color:#59636f
            }
        </style>
    </head>
    <body>
        <h1>Biblioteca Fatec ZS — CRUD</h1>
        <p class="intro">Página de apoio didático. O fluxo PHP, formulários, validação básica e conexão PDO estão preparados; os alunos completam apenas os quatro comandos SQL indicados no arquivo.</p>

        <?php if ($notice): ?><p class="notice"><?=h($notice)?></p><?php endif; ?>
        <?php if ($error): ?><p class="error"><strong>Erro:</strong> <?=h($error)?><br><span class="muted">Durante a atividade, é esperado que apareçam erros até os quatro TODOs de SQL serem preenchidos.</span></p><?php endif; ?>
        
        <form method="get" class="box">
            <label>Tabela<br>
            <select name="table" onchange="this.form.submit()">
            <?php foreach (array_keys($config) as $name): ?>
                <option value="<?=h($name)?>" <?=$table===$name?'selected':''?>><?=h($name)?></option><?php endforeach; ?>
            </select>
            </label><noscript>
            <button>Selecionar</button></noscript>
        </form>

        <section class="box">
            <h2><?=$editing?'Editar':'Incluir'?> — <?=h($table)?></h2>

            <form method="post">
                <input type="hidden" name="table" value="<?=h($table)?>">
                <input type="hidden" name="action" value="save">
                <input type="hidden" name="editing" value="<?=$editing?'1':''?>">
                <?php foreach ($meta['fields'] as $name=>$field):
                $isPk = in_array($name, $meta['pk'], true);
                if ($editing && $isPk) echo '<input type="hidden" name="key['.h($name).']" value="'.h($formValues[$name] ?? '').'">';
                renderControl($name, $field, $formValues[$name] ?? '', $pdo ?? null, $editing && $isPk);endforeach; ?><br>
                <button type="submit">Salvar</button>
                <?php if ($editing): ?><a class="btn" href="?table=<?=rawurlencode($table)?>">Cancelar</a><?php endif; ?>
            </form>

            <p class="muted">As chaves estrangeiras usam listas preenchidas pelas tabelas relacionadas. Cadastre primeiro os registros referenciados.</p>
        </section>

        <section class="box">
            <h2>Registros — <?=h($table)?></h2>
            <?php if (!$rows): ?><p>Nenhum registro para exibir (ou a listagem ainda depende do TODO de SELECT).</p><?php else: ?><div style="overflow-x:auto">
                <table>
                    <thead>
                        <tr>
                            <?php foreach (array_keys($meta['fields']) as $column): ?><th><?=h($meta['fields'][$column]['label'])?></th><?php endforeach; ?>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($rows as $row): ?><tr><?php foreach (array_keys($meta['fields']) as $column): ?>
                            <td><?=h($row[$column] ?? '')?></td><?php endforeach; ?>
                            <td>
                                <a class="btn" href="?table=<?=rawurlencode($table)?>&edit=1<?php foreach($meta['pk'] as $pk): ?>&key[<?=rawurlencode($pk)?>]=<?=rawurlencode((string)$row[$pk])?><?php endforeach; ?>">Editar</a>
                                <form method="post" style="display:inline" onsubmit="return confirm('Excluir este registro?')">
                                    <input type="hidden" name="table" value="<?=h($table)?>">
                                    <input type="hidden" name="action" value="delete">
                                    <?php foreach($meta['pk'] as $pk): ?><input type="hidden" name="key[<?=h($pk)?>]" value="<?=h($row[$pk])?>"><?php endforeach; ?>
                                    <button type="submit">Excluir</button>
                                </form>
                            </td>
                        </tr><?php endforeach; ?>
                    </tbody>
                </table>
            </div><?php endif; ?>
        </section>
        
        <p class="muted">Exercício: localize no arquivo <code>index.php</code> os TODOs 1–4 e escreva somente SQL preparado. Consulte o README para esquema e configuração.</p>
    </body>
</html>
body>
</html>
