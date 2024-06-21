-- Criação da sequência

CREATE TABLESPACE ROUSSENQ
DATAFILE 'ROUSSENQ.dbf' SIZE 100M;

CREATE SEQUENCE pessoa_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
	
CREATE USER ESTUDO IDENTIFIED BY 123;

ALTER USER ESTUDO DEFAULT TABLESPACE ROUSSENQ;

ALTER USER ESTUDO QUOTA UNLIMITED ON ROUSSENQ;


CREATE TABLE ESTUDO.PESSOA (
	ID_PESSOA NUMBER(38,0) NOT NULL,
	NOME VARCHAR2(100) NOT NULL,
	CPF VARCHAR2(14) NULL,
	EMAIL VARCHAR2(100) NULL,
	CONSTRAINT PESSOAS_PK PRIMARY KEY (ID_PESSOA)
)
TABLESPACE ROUSSENQ;   

-- Criação do gatilho
CREATE OR REPLACE TRIGGER trg_pessoa_id
BEFORE INSERT ON ESTUDO.PESSOA
FOR EACH ROW
BEGIN
    SELECT pessoa_seq.NEXTVAL
    INTO :new.id_pessoa
    FROM dual;
END;

INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Alice', '123.456.789-01', 'alice@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Bob', '987.654.321-09', 'bob@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Charlie', '111.222.333-44', 'charlie@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('David', '555.666.777-88', 'david@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Eva', '999.888.777-66', 'eva@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Fernando', '444.333.222-11', 'fernando@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Gabriela', '777.888.999-00', 'gabriela@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Hugo', '222.333.444-55', 'hugo@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Isabela', '666.555.444-33', 'isabela@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('João', '888.777.666-55', 'joao@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Karen', '444.555.666-77', 'karen@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Lucas', '111.222.333-44', 'lucas@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Mariana', '555.444.333-22', 'mariana@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Nelson', '999.888.777-66', 'nelson@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Olívia', '333.444.555-66', 'olivia@example.com');
INSERT INTO ESTUDO.PESSOA (nome, cpf, email)
VALUES('Luiz Antonio Roussenq', '023.094.429-92','luiz@roussenq.com.br');