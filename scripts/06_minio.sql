CREATE SCHEMA IF NOT EXISTS minio.gold
WITH (location = 's3a://gold/');

CREATE OR REPLACE VIEW minio.gold.pessoa
AS
select id_pessoa,nome,cpf,email,'ORACLE'as origem from oracle.estudo.pessoa
union
select id,nome,cpf,email,'POSTGRES'as origem from postgresql.pessoa.pessoa
union
select id,nome,cpf,email,'SQLSERVER'as origem from sqlserver.pessoa.pessoa 
union
select id,nome,cpf,email,'PARQUET'as origem from minio.bronze.pessoa_parquet 
union
select cast(id as integer)as id,nome,cpf,email,'CSV'as origem from minio.bronze.pessoa_csv 
union
select id,nome,cpf,email,'JSON'as origem from minio.bronze.pessoa_json
;
