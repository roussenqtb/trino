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
                select * from minio.gold.pessoa
                order by cpf
            """

cur = conn.cursor()
cur.execute(sql_query)

rows = cur.fetchall()
for row in rows:
    print(row)
