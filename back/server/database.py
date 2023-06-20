from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import urllib

server = 'nome-do-servidor-do-banco.database.windows.net'
database = 'nome-do-banco-de-dados'
username = 'lucas1234'
password = 'Adm-1234'

params = urllib.parse.quote_plus(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=' + server + ';'
    'DATABASE=' + database + ';'
    'UID=' + username + ';'
    'PWD=' + password + ';'
)

engine = create_engine('jdbc:sqlserver://;serverName=nome-do-servidor-do-banco.database.windows.net;databaseName=nome-do-banco-de-dados')
SessionLocal = sessionmaker(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()