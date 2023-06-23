from sqlalchemy.orm import Session

from models.models import Imovel
from schemas.ImovelSchemas import *

# Repositório para Imovel
def get_imoveis(db: Session):
    return db.query(Imovel).all()

def get_imovel(db: Session, imovel_id: int):
    return db.query(Imovel).filter(Imovel.cd_imovel == imovel_id).first()

def create_imovel(db: Session, imovel: ImovelSchemaCreate):
    db_imovel = Imovel(**imovel.dict())
    db.add(db_imovel)
    db.commit()
    db.refresh(db_imovel)
    return db_imovel

def update_imovel(db: Session, imovel_id: int, imovel: ImovelSchemaCreate):
    db_imovel = db.query(Imovel).filter(Imovel.cd_imovel == imovel_id).first()
    if not db_imovel:
        return None
    for key, value in imovel.dict().items():
        setattr(db_imovel, key, value)
    db.commit()
    db.refresh(db_imovel)
    return db_imovel

def delete_imovel(db: Session, imovel_id: int):
    db_imovel = db.query(Imovel).filter(Imovel.cd_imovel == imovel_id).first()
    if not db_imovel:
        return None
    db.delete(db_imovel)
    db.commit()
    return True