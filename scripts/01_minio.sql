CREATE SCHEMA IF NOT EXISTS minio.bronze
WITH (location = 's3a://bronze/');

CREATE TABLE IF NOT EXISTS minio.bronze.pessoa_parquet(
  id INT,
  nome VARCHAR,
  cpf VARCHAR,
  email VARCHAR
)
WITH (
  external_location = 's3a://bronze/parquet/',
  format = 'PARQUET'
);


CREATE TABLE IF NOT EXISTS minio.bronze.pessoa_csv(
  id VARCHAR,
  nome VARCHAR,
  cpf VARCHAR,
  email VARCHAR
)
WITH (
  external_location = 's3a://bronze/csv/',
  format = 'csv',
  csv_separator = ',',
  csv_escape = '"',
  skip_header_line_count = 1
);

CREATE TABLE IF NOT EXISTS minio.bronze.pessoa_json(
  id int,
  nome VARCHAR,
  cpf VARCHAR,
  email VARCHAR
)
WITH (
  external_location = 's3a://bronze/json/',
  format = 'JSON'
);

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
