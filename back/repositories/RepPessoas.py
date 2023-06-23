from sqlalchemy.orm import Session

from models.models import Pessoa
from schemas.PessoaSchemas import *

# Repositório para Pessoa
def get_pessoas(db: Session):
    return db.query(Pessoa).all()

def get_pessoa(db: Session, pessoa_id: int):
    return db.query(Pessoa).filter(Pessoa.cd_pessoa == pessoa_id).first()

def create_pessoa(db: Session, pessoa: PessoaSchemaCreate):
    db_pessoa = Pessoa(**pessoa.dict())
    db.add(db_pessoa)
    db.commit()
    db.refresh(db_pessoa)
    return db_pessoa

def update_pessoa(db: Session, pessoa_id: int, pessoa: PessoaSchemaCreate):
    db_pessoa = db.query(Pessoa).filter(Pessoa.cd_pessoa == pessoa_id).first()
    if not db_pessoa:
        return None
    for key, value in pessoa.dict().items():
        setattr(db_pessoa, key, value)
    db.commit()
    db.refresh(db_pessoa)
    return db_pessoa

def delete_pessoa(db: Session, pessoa_id: int):
    db_pessoa = db.query(Pessoa).filter(Pessoa.cd_pessoa == pessoa_id).first()
    if not db_pessoa:
        return None
    db.delete(db_pessoa)
    db.commit()
    return True