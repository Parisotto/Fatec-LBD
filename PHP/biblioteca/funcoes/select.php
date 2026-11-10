<?php
declare(strict_types=1);
function executar_select(mysqli $conexao, string $sql): array {
    $resultado = $conexao->query($sql); $colunas = []; $linhas = [];
    if ($resultado instanceof mysqli_result) {
        foreach ($resultado->fetch_fields() as $campo) $colunas[] = $campo->name;
        while ($linha = $resultado->fetch_row()) $linhas[] = $linha;
        $resultado->free();
    }
    return ['columns' => $colunas, 'rows' => $linhas];
}
