update estudantes set nacionalidade = null;
SELECT * FROM estudantes;

ALTER TABLE estudantes
ADD CONSTRAINT fk_estudantes_nacionalidade
FOREIGN KEY (nacionalidade)
REFERENCES nacionalidade(sigla);

describe estudantes;
update estudantes set nacionalidade = "BR";
SELECT * FROM estudantes;
