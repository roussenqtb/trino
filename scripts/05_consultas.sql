select * from minio.gold.pessoa
order by cpf;

select * from minio.gold.pessoa
where cpf = '356.787.900-64';

select * from minio.gold.pessoa
where origem = 'POSTGRES'
order by cpf;

select * from minio.gold.pessoa
where origem = 'CSV'
order by cpf;

INSERT INTO postgresql.pessoa.pessoa(nome,cpf,email)
SELECT nome,cpf,email FROM minio.bronze.pessoa_csv;