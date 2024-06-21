CREATE SCHEMA IF NOT EXISTS minio.bronze
WITH (location = 's3a://bronze/');

CREATE TABLE IF NOT EXISTS minio.bronze.pessoas_parquet(
  id VARCHAR,
  nome VARCHAR,
  cpf VARCHAR,
  email VARCHAR
)
WITH (
  external_location = 's3a://bronze/parquet',
  format = 'PARQUET'
);


CREATE TABLE IF NOT EXISTS minio.bronze.pessoas_csv(
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
