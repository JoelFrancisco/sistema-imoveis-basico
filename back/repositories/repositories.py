from sqlalchemy.orm import Session

from models.models import Pessoa, Contrato, Pagamento, Imovel
from schemas.schemas import PessoaCreate, PessoaUpdate, ContratoCreate, ContratoUpdate, PagamentoCreate, PagamentoUpdate, ImovelCreate, ImovelUpdate

# Repositório para Pessoa
def get_pessoas(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Pessoa).offset(skip).limit(limit).all()

def get_pessoa(db: Session, pessoa_id: int):
    return db.query(Pessoa).filter(Pessoa.cd_pessoa == pessoa_id).first()

def create_pessoa(db: Session, pessoa: PessoaCreate):
    db_pessoa = Pessoa(**pessoa.dict())
    db.add(db_pessoa)
    db.commit()
    db.refresh(db_pessoa)
    return db_pessoa

def update_pessoa(db: Session, pessoa_id: int, pessoa: PessoaUpdate):
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

# Repositório para Contrato
def get_contratos(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Contrato).offset(skip).limit(limit).all()

def get_contrato(db: Session, contrato_id: int):
    return db.query(Contrato).filter(Contrato.cd_contrato == contrato_id).first()

def create_contrato(db: Session, contrato: ContratoCreate):
    db_contrato = Contrato(**contrato.dict())
    db.add(db_contrato)
    db.commit()
    db.refresh(db_contrato)
    return db_contrato

def update_contrato(db: Session, contrato_id: int, contrato: ContratoUpdate):
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

# Repositório para Pagamento
def get_pagamentos(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Pagamento).offset(skip).limit(limit).all()

def get_pagamento(db: Session, pagamento_id: int):
    return db.query(Pagamento).filter(Pagamento.cd_pagamento == pagamento_id).first()

def create_pagamento(db: Session, pagamento: PagamentoCreate):
    db_pagamento = Pagamento(**pagamento.dict())
    db.add(db_pagamento)
    db.commit()
    db.refresh(db_pagamento)
    return db_pagamento

def update_pagamento(db: Session, pagamento_id: int, pagamento: PagamentoUpdate):
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

# Repositório para Imovel
def get_imoveis(db: Session, skip: int = 0, limit: int = 10):
    return db.query(Imovel).offset(skip).limit(limit).all()

def get_imovel(db: Session, imovel_id: int):
    return db.query(Imovel).filter(Imovel.cd_imovel == imovel_id).first()

def create_imovel(db: Session, imovel: ImovelCreate):
    db_imovel = Imovel(**imovel.dict())
    db.add(db_imovel)
    db.commit()
    db.refresh(db_imovel)
    return db_imovel

def update_imovel(db: Session, imovel_id: int, imovel: ImovelUpdate):
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