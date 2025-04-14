CREATE SCHEMA IF NOT EXISTS delta.bronze
WITH (location = 's3a://bronze/');

CALL delta.system.register_table(schema_name => 'bronze', table_name => 'pessoa_delta', table_location => 's3a://bronze/delta/pessoa');

--CALL example.system.unregister_table(schema_name => 'bronze', table_name => 'pessoa_delta')

INSERT INTO delta.bronze.pessoa_delta (id_pessoa,nome,cpf,email)
VALUES(4,'Luiz A. Roussenq', '356.787.900-64','luiz@roussenq.com.br');

INSERT INTO delta.bronze.pessoa_delta (id_pessoa,nome,cpf,email)
VALUES(5,'Renata Roussenq', '355.711.917-35','renata@roussenq.com.br');

update delta.bronze.pessoa_delta set
nome = 'Luiz Antonio Roussenq'
where id_pessoa = 4;

select * from delta.bronze.pessoa_delta FOR VERSION AS OF 0
select * from delta.bronze.pessoa_delta FOR VERSION AS OF 1
select * from delta.bronze.pessoa_delta FOR VERSION AS OF 2
select * from delta.bronze.pessoa_delta FOR VERSION AS OF 3
select * from delta.bronze.pessoa_delta
