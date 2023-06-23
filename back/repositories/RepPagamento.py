from sqlalchemy.orm import Session

from models.models import Pagamento
from schemas.PagamentoSchemas import *

# Repositório para Pagamento
def get_pagamentos(db: Session):
    return db.query(Pagamento).all()

def get_pagamento(db: Session, pagamento_id: int):
    return db.query(Pagamento).filter(Pagamento.cd_pagamento == pagamento_id).first()

def create_pagamento(db: Session, pagamento: PagamentoSchemaCreate):
    db_pagamento = Pagamento(**pagamento.dict())
    db.add(db_pagamento)
    db.commit()
    db.refresh(db_pagamento)
    return db_pagamento

def update_pagamento(db: Session, pagamento_id: int, pagamento: PagamentoSchemaCreate):
    db_pagamento = db.query(Pagamento).filter(Pagamento.cd_pagamento == pagamento_id).first()
    if not db_pagamento:
        return None
    for key, value in pagamento.dict().items():
        setattr(db_pagamento, key, value)
    db.commit()
    db.refresh(db_pagamento)
    return db_pagamento

def delete_pagamento(db: Session, pagamento_id: int):
    db_pagamento = db.query(Pagamento).filter(Pagamento.cd_pagamento == pagamento_id).first()
    if not db_pagamento:
        return None
    db.delete(db_pagamento)
    db.commit()
    return True