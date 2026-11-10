<?php
declare(strict_types=1);
function h(string $valor): string { return htmlspecialchars($valor, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); }

/** Verifica palavra inicial permitida e um único terminador opcional, ignorando comentários/strings. */
function validar_sql(string $sql): void {
    if ($sql === '') throw new InvalidArgumentException('Digite uma instrução SQL.');
    if (preg_match('/\A\s*(?:--[^\r\n]*(?:\r?\n|\z)|#[^\r\n]*(?:\r?\n|\z)|\/\*[\s\S]*?\*\/\s*)*/', $sql, $m)) $inicio = substr($sql, strlen($m[0])); else $inicio = $sql;
    if (!preg_match('/\A(SELECT|INSERT|UPDATE|DELETE)\b/i', $inicio, $match)) throw new InvalidArgumentException('Somente SELECT, INSERT, UPDATE ou DELETE são aceitos.');
    $estado = 'normal'; $n = strlen($sql); $terminou = false;
    for ($i = 0; $i < $n; $i++) {
        $c = $sql[$i]; $next = $i + 1 < $n ? $sql[$i + 1] : '';
        if ($estado === 'line') { if ($c === "\n") $estado = 'normal'; continue; }
        if ($estado === 'block') { if ($c === '*' && $next === '/') { $estado = 'normal'; $i++; } continue; }
        if ($estado !== 'normal') {
            if ($c === '\\' && in_array($estado, ['single','double'], true)) { $i++; continue; }
            $end = ['single'=>"'", 'double'=>'"', 'backtick'=>'`'][$estado];
            if ($c === $end) { if ($next === $end) { $i++; continue; } $estado = 'normal'; }
            continue;
        }
        if ($c === "'" || $c === '"' || $c === '`') { $estado = $c === "'" ? 'single' : ($c === '"' ? 'double' : 'backtick'); continue; }
        if ($c === '/' && $next === '*') { $estado = 'block'; $i++; continue; }
        if ($c === '#' || ($c === '-' && $next === '-' && ($i + 2 === $n || ctype_space($sql[$i + 2])))) { $estado = 'line'; if ($c === '-') $i++; continue; }
        if ($c === ';') {
            if ($terminou) throw new InvalidArgumentException('Envie somente uma instrução SQL por vez.');
            $terminou = true; $resto = substr($sql, $i + 1);
            if (preg_match('/\S/', remover_comentarios($resto))) throw new InvalidArgumentException('Envie somente uma instrução SQL por vez.');
            break;
        }
    }
    if (in_array($estado, ['single','double','backtick','block'], true)) throw new InvalidArgumentException('A instrução contém uma string, identificador ou comentário sem fechamento.');
}
function remover_comentarios(string $texto): string {
    $texto = preg_replace('/\/\*[\s\S]*?\*\//', '', $texto) ?? $texto;
    return preg_replace('/(?:--[^\r\n]*|#[^\r\n]*)/', '', $texto) ?? $texto;
}
