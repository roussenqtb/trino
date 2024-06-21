create schema pessoa;

CREATE TABLE pessoa.pessoa (
    id bigSERIAL PRIMARY KEY,
    nome VARCHAR(100),
	cpf VARCHAR(18),
    email VARCHAR(150)	
);

INSERT INTO pessoa.pessoa (nome, cpf, email)
VALUES('Marcos', '125.486.789-01', 'marcos@example.com');
INSERT INTO pessoa.pessoa (nome, cpf, email)
VALUES('Alexandre', '927.634.391-09', 'alexandre@example.com');
INSERT INTO pessoa.pessoa (nome, cpf, email)
VALUES('Marcelo', '611.822.933-11', 'marcelo@example.com');
INSERT INTO pessoa.pessoa (nome, cpf, email)
VALUES('Luiz Antonio Roussenq', '023.094.429-92','luiz@roussenq.com.br');


