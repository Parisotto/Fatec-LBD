# 34-palavras-chave.sql

# AND, OR, NOT
# IS TRUE, IS NOT TRUE, IS FALSE, IS NOT FALSE
# IS NULL, IS NOT NULL

# WHERE coluna = "azul" OR coluna = "verde" OR coluna = "vermelho"
# WHERE coluna IN ("azul", "verde", "vermelho")

# WHERE coluna >= 5 AND coluna <= 10
# WHERE coluna BETWEEN 5 AND 10

# LIKE % (qualquer quantidade de caracteres), _ (um caracter)
# WHERE coluna LIKE '%a', 'a%', '%a%', '_a%', '%a__'

# SELECT coluna AS MinhaColuna FROM tabela AS tab

# Colunas Matemáticas
# SELECT (valor * quantidade) - desconto AS ValorEtiqueta

# ROUND(numero, [casas decimais])
# SELECT ROUND(3.7); -> 4.0
# SELECT ROUND(3.3); -> 3.0
# SELECT ROUND(3.5); -> 4.0
# SELECT ROUND(3.14159, 3); -> 3.142
# SELECT produto, ROUND(preco, 2) AS PrecoArredondado FROM produtos;

# SELECT MAX(col1), MIN(col2), AVG(col3), …
SELECT MAX(salario), MIN(salario), AVG(salario) FROM funcionarios;
