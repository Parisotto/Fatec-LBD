<?php
declare(strict_types=1);
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$dbHost = getenv('BIBLIOTECA_DB_HOST') ?: '127.0.0.1';
$dbUser = getenv('BIBLIOTECA_DB_USER') ?: 'root';
$dbPass = getenv('BIBLIOTECA_DB_PASS') ?: '';
$dbName = getenv('BIBLIOTECA_DB_NAME') ?: 'biblioteca';
try {
    $conexao = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
    $conexao->set_charset('utf8mb4');
} catch (mysqli_sql_exception $e) {
    http_response_code(500);
    exit('Não foi possível conectar ao MySQL. Confira o serviço, o banco e as credenciais locais no README.');
}
