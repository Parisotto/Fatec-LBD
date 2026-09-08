# 21-tabela-contato.sql

-- Crie uma tabela denominada "contato" com os seguintes campos:
	-- "idContato", tipo inteiro, chave primária, auto incrementada
	-- "email_principal", tipo varchar, unico, não nulo
	-- "email_alternativo", tipo varchar, unico, não nulo
	-- "celular", tipo varchar, não nulo
	-- "whatsapp", tipo boleano, não nulo, default true
	-- aplique o descritor
    
CREATE TABLE contato ( 
	idContato int primary key auto_increment,
    email_principal varchar(30) unique not null,
    email_alternativo varchar(30) unique not null,
    celular varchar(14) not null,
    whatsapp bool not null default true
) ENGINE InnoDB;

DESCRIBE contato;

-- Insira pelo menos 5 registros (ou mais)
-- aplique o seletor de todos os registros

INSERT INTO contato (email_principal, email_alternativo, celular, whatsapp)
VALUES
    ('ana.silva@email.com', 'ana.silva@outlook.com', '11987654321', TRUE),
    ('bruno.santos@email.com', 'bruno.santos@gmail.com', '11987654322', TRUE),
    ('carlos.oliveira@email.com', 'carlos.oliveira@gmail.com', '11987654323', FALSE),
    ('daniela.souza@email.com', 'daniela.souza@gmail.com', '11987654324', TRUE),
    ('eduardo.costa@email.com', 'eduardo.costa@gmail.com', '11987654325', TRUE),
    ('fernanda.lima@email.com', 'fernanda.lima@gmail.com', '11987654326', FALSE),
    ('gabriel.pereira@email.com', 'gabriel.pereira@gmail.com', '11987654327', TRUE),
    ('helena.almeida@email.com', 'helena.almeida@gmail.com', '11987654328', TRUE),
    ('igor.rocha@email.com', 'igor.rocha@gmail.com', '11987654329', FALSE),
    ('juliana.martins@email.com', 'juliana.martins@gmail.com', '11987654330', TRUE),
    ('lucas.ribeiro@email.com', 'lucas.ribeiro@gmail.com', '11987654331', TRUE),
    ('mariana.carvalho@email.com', 'mariana.carvalho@gmail.com', '11987654332', TRUE),
    ('nicolas.ferreira@email.com', 'nicolas.ferreira@gmail.com', '11987654333', FALSE),
    ('olivia.gomes@email.com', 'olivia.gomes@gmail.com', '11987654334', TRUE),
    ('paulo.barbosa@email.com', 'paulo.barbosa@gmail.com', '11987654335', TRUE),
    ('renata.teixeira@email.com', 'renata.teixeira@gmail.com', '11987654336', FALSE),
    ('ricardo.mendes@email.com', 'ricardo.mendes@gmail.com', '11987654337', TRUE),
    ('simone.nunes@email.com', 'simone.nunes@gmail.com', '11987654338', TRUE),
    ('thiago.monteiro@email.com', 'thiago.monteiro@gmail.com', '11987654339', FALSE),
    ('vanessa.moura@email.com', 'vanessa.moura@gmail.com', '11987654340', TRUE),
    ('andre.cardoso@email.com', 'andre.cardoso@gmail.com', '11987654341', TRUE),
    ('beatriz.farias@email.com', 'beatriz.farias@gmail.com', '11987654342', FALSE),
    ('caio.machado@email.com', 'caio.machado@gmail.com', '11987654343', TRUE),
    ('debora.freitas@email.com', 'debora.freitas@gmail.com', '11987654344', TRUE),
    ('fabio.correia@email.com', 'fabio.correia@gmail.com', '11987654345', FALSE),
    ('isabela.vieira@email.com', 'isabela.vieira@gmail.com', '11987654346', TRUE),
    ('joao.cavalcanti@email.com', 'joao.cavalcanti@gmail.com', '11987654347', TRUE),
    ('karina.pinto@email.com', 'karina.pinto@gmail.com', '11987654348', FALSE),
    ('leandro.melo@email.com', 'leandro.melo@gmail.com', '11987654349', TRUE),
    ('monica.duarte@email.com', 'monica.duarte@gmail.com', '11987654350', TRUE),
    ('oscar.tavares@email.com', 'oscar.tavares@gmail.com', '11987654351', FALSE),
    ('patricia.borges@email.com', 'patricia.borges@gmail.com', '11987654352', TRUE),
    ('rodrigo.miranda@email.com', 'rodrigo.miranda@gmail.com', '11987654353', TRUE),
    ('aline.batista@email.com', 'aline.batista@gmail.com', '11987654354', FALSE),
    ('cesar.araujo@email.com', 'cesar.araujo@gmail.com', '11987654355', TRUE),
    ('elaine.moraes@email.com', 'elaine.moraes@gmail.com', '11987654356', TRUE),
    ('gustavo.rezende@email.com', 'gustavo.rezende@gmail.com', '11987654357', FALSE),
    ('jessica.macedo@email.com', 'jessica.macedo@gmail.com', '11987654358', TRUE),
    ('marcos.azevedo@email.com', 'marcos.azevedo@gmail.com', '11987654359', TRUE),
    ('natalia.pires@email.com', 'natalia.pires@gmail.com', '11987654360', FALSE),
    ('renan.coelho@email.com', 'renan.coelho@gmail.com', '11987654361', TRUE),
    ('sabrina.assis@email.com', 'sabrina.assis@gmail.com', '11987654362', TRUE),
    ('vinicius.dias@email.com', 'vinicius.dias@gmail.com', '11987654363', FALSE),
    ('amanda.queiroz@email.com', 'amanda.queiroz@gmail.com', '11987654364', TRUE),
    ('diego.vasconcelos@email.com', 'diego.vasconcelos@gmail.com', '11987654365', TRUE),
    ('luciana.peixoto@email.com', 'luciana.peixoto@gmail.com', '11987654366', FALSE),
    ('mateus.andrade@email.com', 'mateus.andrade@gmail.com', '11987654367', TRUE),
    ('priscila.siqueira@email.com', 'priscila.siqueira@gmail.com', '11987654368', TRUE);
    
SELECT * FROM contato;
