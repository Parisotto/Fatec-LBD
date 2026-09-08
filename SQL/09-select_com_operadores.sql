-- SELECT com Operadores

SELECT * FROM estudantes
WHERE genero = 'F' AND nacionalidade = 'Brasil';

SELECT * FROM estudantes
WHERE data_nascimento > '2000-01-01' OR nacionalidade = 'Brasil'; 

SELECT nome, data_nascimento FROM estudantes
WHERE data_nascimento < '2000-01-01';

SELECT nome, data_nascimento FROM estudantes
WHERE data_nascimento > '2000-01-01';