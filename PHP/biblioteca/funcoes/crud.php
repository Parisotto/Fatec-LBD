<?php
declare(strict_types=1);
require_once __DIR__ . '/config/conexao.php';
require_once __DIR__ . '/helpers.php';
require_once __DIR__ . '/select.php';
require_once __DIR__ . '/insert.php';
require_once __DIR__ . '/update.php';
require_once __DIR__ . '/delete.php';

$sql = trim((string) ($_POST['sql'] ?? ''));
$resultado = null;
$erro = null;
$tipo = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        validar_sql($sql);
        $tipo = strtoupper((string) strtok(ltrim($sql), " \t\r\n"));
        $resultado = match ($tipo) {
            'SELECT' => executar_select($conexao, $sql),
            'INSERT' => executar_insert($conexao, $sql),
            'UPDATE' => executar_update($conexao, $sql),
            'DELETE' => executar_delete($conexao, $sql),
        };
    } catch (Throwable $e) {
        $erro = $e->getMessage();
    }
}
?>