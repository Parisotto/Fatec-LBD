# 24-relacionamento-formal.sql

ALTER TABLE estudantes
ADD CONSTRAINT fk_estudantes_contato
FOREIGN KEY (contato)
REFERENCES contato(idContato);

ALTER TABLE estudantes
ADD CONSTRAINT uk_estudantes_contato
UNIQUE (contato);