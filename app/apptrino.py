from trino.dbapi import connect

# pip install trino

conn = connect(
    host='localhost',
    port=8080,
    user='admin',
    catalog='',
    schema=''
)

sql_query = """
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
order by cpf
         """

cur = conn.cursor()
cur.execute(sql_query)

rows = cur.fetchall()
for row in rows:
    print(row)
