<?php require_once __DIR__ . '/funcoes/crud.php'; ?>

<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laboratório SQL | Biblioteca</title>
    <link rel="stylesheet" href="css/estilo.css">
  </head>
  <body>
    <main class="container">
      <header>
        <p class="eyebrow">Laboratório local de banco de dados</p>
        <h1>Biblioteca · SQL</h1>
        <br><a href="app.php">Ir para o App Bliblioteca</a><br>
        <p>Escreva uma instrução SQL completa e veja o que acontece no banco.</p>
      </header>
      
      <aside class="warning"><strong>Uso exclusivamente didático e local.</strong> Esta ferramenta executa SQL escrito pelo usuário e é intencionalmente insegura. Nunca a publique na internet, nunca a use com dados reais e mantenha uma cópia descartável do banco.</aside>

      <form method="post">
        <label for="sql">Sua instrução SQL</label>
        <textarea id="sql" name="sql" rows="8" spellcheck="false" required placeholder="SELECT * FROM Livro;">
          <?= h($sql) ?>
        </textarea>

        <div class="hint">
          Aceita uma instrução por vez: SELECT, INSERT, UPDATE ou DELETE. Use sempre um WHERE em UPDATE e DELETE.
        </div>

        <button type="submit">Executar SQL</button>
      </form>

      <?php if ($erro !== null): ?>
        <section class="result error" role="alert">
          <h2>Erro ao executar</h2>
          <pre><?= h($erro) ?></pre>
        </section>
      <?php endif; ?>

      <?php if (is_array($resultado) && $tipo === 'SELECT'): ?>
        <section class="result">
          <h2>Resultado</h2>
          <p><?= count($resultado['rows']) ?> linha(s) retornada(s).</p>
          <?php if (!$resultado['columns']): ?>
            <p>Consulta executada sem colunas retornadas.</p>
          <?php else: ?>

          <div class="table-wrap">
            <table>
              <thead>
                <tr>
                  <?php foreach ($resultado['columns'] as $coluna): ?><th><?= h($coluna) ?></th><?php endforeach; ?>
                </tr>
              </thead>
              
              <tbody>
                <?php foreach ($resultado['rows'] as $linha): ?>
                <tr>
                  <?php foreach ($linha as $valor): ?><td><?= h($valor === null ? 'NULL' : (string) $valor) ?></td><?php endforeach; ?>
                </tr><?php endforeach; ?>
              </tbody>
            </table>
          </div><?php endif; ?>
        </section>

      <?php elseif (is_array($resultado)): ?>
        <section class="result success">
          <h2>Instrução executada</h2>
          <p><?= h((string) $resultado['affected']) ?> linha(s) afetada(s).</p>
          <?php if ($tipo === 'INSERT' && $resultado['insert_id']): ?>
          <p>Código gerado: <?= h((string) $resultado['insert_id']) ?></p><?php endif; ?>
        </section>
      <?php endif; ?>

      <footer>Conexão com o banco <code>biblioteca</code> · ambiente local</footer>
    </main>
  </body>
</html>
