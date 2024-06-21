CREATE SCHEMA pessoa;

CREATE TABLE pessoa.pessoa
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    email VARCHAR(255)
);

INSERT INTO pessoa.pessoa (nome, cpf, email)
VALUES('Luiz Antonio Roussenq', '023.094.429-92','luiz@roussenq.com.br');

INSERT INTO pessoa.pessoa (nome, cpf, email)
VALUES('Renata Roussenq', '029.194.339-12','renata@roussenq.com.br');