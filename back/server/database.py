from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import urllib

server = 'nome-do-servidor-do-banco.database.windows.net'
database = 'nome-do-banco-de-dados'
username = 'lucas1234'
password = 'Adm-1234'

DATABASE_URL = "sqlite:///./sqlite.db"

engine = create_engine('jdbc:sqlserver://;serverName=nome-do-servidor-do-banco.database.windows.net;databaseName=nome-do-banco-de-dados')
SessionLocal = sessionmaker(bind=engine)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
