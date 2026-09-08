# 25-join-um-para-muitos.sql

ALTER TABLE estudantes
ADD CONSTRAINT fk_estudantes_paises
FOREIGN KEY (nacionalidade)
REFERENCES paises(sigla);