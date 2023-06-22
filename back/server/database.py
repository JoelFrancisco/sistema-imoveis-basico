from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from typing import Generator


DB_DRIVER = "{ODBC Driver 17 for SQL Server}"
DB_SERVER = "nome-do-servidor-do-banco2234.database.windows.net"
DB_PORT = "1433"
DB_DATABASE = "nome-do-banco-de-dados2234"
DB_USERNAME = "lucas1234"
DB_PASSWORD = "Adm-1234"

SQLALCHEMY_DATABASE_URL = f"mssql+pyodbc://{DB_USERNAME}:{DB_PASSWORD}@{DB_SERVER}/{DB_DATABASE}?driver=ODBC+Driver+17+for+SQL+Server"


# Conexão com o banco de dados
engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Módulo para conexão com o banco de dados
def get_db() -> Generator:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()