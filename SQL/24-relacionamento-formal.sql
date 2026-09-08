# 24-relacionamento-formal.sql

ALTER TABLE estudantes
ADD CONSTRAINT fk_estudantes_contato
FOREIGN KEY (contato) -- aqui "contato" é o campo da tabela "estudantes"
REFERENCES contato(idContato); -- aqui "contato" é o nome tabela

ALTER TABLE estudantes
ADD CONSTRAINT uk_estudantes_contato
UNIQUE (contato);

SELECT e.nome, c.email_principal 
FROM estudantes AS e JOIN contato AS c
ON e.contato = c.idContato;