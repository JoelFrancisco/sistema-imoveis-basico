from sqlalchemy.orm import Session

from models.models import Contrato
from schemas.ContratoSchemas import *

# Repositório para Contrato
def get_contratos(db: Session):
    return db.query(Contrato).all()

def get_contrato(db: Session, contrato_id: int):
    return db.query(Contrato).filter(Contrato.cd_contrato == contrato_id).first()

def create_contrato(db: Session, contrato: ContratoSchemaCreate):
    db_contrato = Contrato(**contrato.dict())
    db.add(db_contrato)
    db.commit()
    db.refresh(db_contrato)
    return db_contrato

def update_contrato(db: Session, contrato_id: int, contrato: ContratoSchemaCreate):
    db_contrato = db.query(Contrato).filter(Contrato.cd_contrato == contrato_id).first()
    if not db_contrato:
        return None
    for key, value in contrato.dict().items():
        setattr(db_contrato, key, value)
    db.commit()
    db.refresh(db_contrato)
    return db_contrato

def delete_contrato(db: Session, contrato_id: int):
    db_contrato = db.query(Contrato).filter(Contrato.cd_contrato == contrato_id).first()
    if not db_contrato:
        return None
    db.delete(db_contrato)
    db.commit()
    return True