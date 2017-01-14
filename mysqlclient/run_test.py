import pandas as pd
import sqlalchemy as sa

engine = sa.create_engine('mysql://anonymous:@ensembldb.ensembl.org:3306/homo_sapiens_core_82_38')
sql_query = """
select *
from gene
limit 10
"""
df = pd.read_sql_query(sql_query, engine)
print(df)
assert len(df) == 10

