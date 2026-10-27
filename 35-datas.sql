# 34-datas.sql

# Intervalo de datas
# SELECT * FROM tabela WHERE coluna BETWEEN '2025-01-01' AND '2026-12-31';

# Soma e subtração de datas
# SELECT JULIANDAY("2023-02-20 12:00:00"); -> 2459996.0 (dias)
# 1º de janeiro de 4713 a.C. (usada por astrônomos para intervalos de tempo 
# e comparações entre diferentes calendários.) onde .0 é meio-dia e .5 meia-noite

# DATE(), converte uma string em uma data
# SELECT DATE('2023-05-15 13:45:00') -> 2023-05-15
# SELECT DATE('now') -> retorna a data atual

# Extração de dia, mês e ano de uma data
/*
-- Obter ano
SELECT STRFTIME('%Y', '2023-05-15') -- Retorna: 2023

-- Obter mês
SELECT STRFTIME('%m', '2023-05-15') -- Retorna: 05

-- Obter dia
SELECT STRFTIME('%d', '2023-05-15') -- Retorna: 15

-- Mostrar combinação de ano e dia (qualquer separador pode ser usado)
SELECT STRFTIME('%Y:%d', '2023-05-15') -- Retorna: 2023:15

-- Usar um separador de traço em vez disso
SELECT STRFTIME('%d-%m-%Y', '2023-05-15') -- Retorna: 15-05-2023

-- Obter dia da semana
SELECT STRFTIME('%w', '2023-05-15') -- Retorna: 1 (segunda-feira; domingo é 0)
*/

# Especificadores de formato comuns:
/*
%Y: Ano (4 dígitos)
%m: Mês (01-12)
%d: Dia do mês (01-31)
%w: Dia da semana (0-6, domingo é 0)
%H: Hora (00-23)
%M: Minuto (00-59)
%S: Segundo (00-59)
*/

# Você pode usar qualquer caractere separador entre os especificadores (por exemplo, -, :, /). 
# SELECT STRFTIME('%d-%m-%Y', coluna_com_data) 
# SELECT STRFTIME('%d:%m:%Y', coluna_com_data) 
-- combinam dia, mês e ano, apenas com separadores diferentes.

# Encontrar todos os registros do ano atual
SELECT * FROM tabela WHERE STRFTIME('%Y', coluna_com_data) = STRFTIME('%Y', 'now');

SELECT 
    id,
    STRFTIME('%d-%m-%Y', inicio) AS inicio_formatado,
    STRFTIME('%d-%m-%Y', final) AS final_formatado,
    ROUND(JULIANDAY(final) - JULIANDAY(inicio)) AS dias_de_duracao
FROM eventos
WHERE STRFTIME('%Y', inicio) = '2026'
ORDER BY dias_de_duracao DESC;