-- 20-relacionamento.sql

update estudantes set nacionalidade = null;
SELECT * FROM estudantes;

ALTER TABLE estudantes
ADD CONSTRAINT fk_estudantes_paises
FOREIGN KEY (nacionalidade)
REFERENCES paises(sigla);

DESCRIBE estudantes;

UPDATE estudantes SET nacionalidade = "BR";
SELECT * FROM estudantes;
