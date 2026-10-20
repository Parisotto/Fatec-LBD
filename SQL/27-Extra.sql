INSERT INTO matriculas2
    (estudante, disciplina, semestre, nota, frequencia)
SELECT
    e.id AS estudante,
    d.id AS disciplina,
    '2026-2' AS semestre,
    ROUND(6 + RAND() * 4, 2) AS nota,
    ROUND(75 + RAND() * 25, 2) AS frequencia
FROM estudantes e
JOIN disciplinas d
    ON d.id IN (
        ((e.id - 7) % 10) + 1,
        ((e.id - 7 + 1) % 10) + 1,
        ((e.id - 7 + 2) % 10) + 1
    )
WHERE e.id BETWEEN 7 AND 52;