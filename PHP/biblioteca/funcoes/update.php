<?php
declare(strict_types=1);
function executar_update(mysqli $conexao, string $sql): array { $conexao->query($sql); return ['affected'=>$conexao->affected_rows, 'insert_id'=>0]; }
