select id_pessoa,nome,cpf,email,'oracle'as origem from oracle.estudo.pessoa
union
select id,nome,cpf,email,'postgres'as origem from postgresql.pessoa.pessoa
union
select id,nome,cpf,email,'sqlserver'as origem from sqlserver.pessoa.pessoa 
union
select id,nome,cpf,email,'minio parquet'as origem from minio.bronze.pessoas_parquet 
union
select id,nome,cpf,email,'minio parquet'as origem from minio.bronze.pessoas_csv 
order by cpf
