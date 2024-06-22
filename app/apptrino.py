from trino.dbapi import connect

# pip install trino

conn = connect(
    host='localhost',
    port=8080,
    user='admin',
    catalog='',
    schema=''
)

sql_query = '''
            SELECT ID,NOME,CPF,EMAIL,'PARQUET'AS ORIGEM FROM MINIO.BRONZE.PESSOA_PARQUET 
            UNION
            SELECT CAST(ID AS INTEGER)AS ID,NOME,CPF,EMAIL,'CSV'AS ORIGEM FROM MINIO.BRONZE.PESSOA_CSV 
            UNION
            SELECT ID,NOME,CPF,EMAIL,'JSON'AS ORIGEM FROM MINIO.BRONZE.PESSOA_JSON
            ORDER BY CPF
         '''

cur = conn.cursor()
cur.execute(sql_query)

rows = cur.fetchall()
for row in rows:
    print(row)
