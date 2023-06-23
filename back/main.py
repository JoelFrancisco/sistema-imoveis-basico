from fastapi import FastAPI
from fastapi import HTTPException
from fastapi import Depends
from sqlalchemy.orm import Session

from server.database import get_db
from models.models import *
from repositories.repositories import *

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

# Rotas para Pessoa
@app.get("/pessoas")
def pessoas_get(db: Session = Depends(get_db)):
    pessoas = get_pessoas(db)
    return pessoas

@app.get("/pessoas/{pessoa_id}")
def pessoa_get(pessoa_id: int, db: Session = Depends(get_db)):
    pessoa = get_pessoa(db, pessoa_id)
    if not pessoa:
        raise HTTPException(status_code=404, detail="Pessoa not found")
    return pessoa

@app.post("/pessoas")
def pessoa_create(pessoa: PessoaSchema, db: Session = Depends(get_db)):
    return  create_pessoa(db, pessoa)

@app.put("/pessoas/{pessoa_id}")
def pessoa_update(pessoa_id: int, pessoa: PessoaSchema, db: Session = Depends(get_db)):
    updated_pessoa = update_pessoa(db, pessoa_id, pessoa)
    if not updated_pessoa:
        raise HTTPException(status_code=404, detail="Pessoa not found")
    return updated_pessoa

@app.delete("/pessoas/{pessoa_id}")
def pessoa_delete(pessoa_id: int, db: Session = Depends(get_db)):
    deleted = delete_pessoa(db, pessoa_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Pessoa not found")
    return {"message": "Pessoa deleted successfully"}

# Rotas para Contrato
@app.get("/contratos")
def get_contratos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    contratos = get_contratos(db, skip=skip, limit=limit)
    return contratos

@app.get("/contratos/{contrato_id}")
def get_contrato(contrato_id: int, db: Session = Depends(get_db)):
    contrato = get_contrato(db, contrato_id=contrato_id)
    if not contrato:
        raise HTTPException(status_code=404, detail="Contrato not found")
    return contrato

@app.post("/contratos")
def create_contrato(contrato: ContratoSchema, db: Session = Depends(get_db)):
    return create_contrato(db, contrato)

@app.put("/contratos/{contrato_id}")
def update_contrato(contrato_id: int, contrato: ContratoSchema, db: Session = Depends(get_db)):
    updated_contrato = update_contrato(db, contrato_id, contrato)
    if not updated_contrato:
        raise HTTPException(status_code=404, detail="Contrato not found")
    return updated_contrato

@app.delete("/contratos/{contrato_id}")
def delete_contrato(contrato_id: int, db: Session = Depends(get_db)):
    deleted = delete_contrato(db, contrato_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Contrato not found")
    return {"message": "Contrato deleted successfully"}

# Rotas para Pagamento
@app.get("/pagamentos")
def get_pagamentos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    pagamentos = get_pagamentos(db, skip=skip, limit=limit)
    return pagamentos

@app.get("/pagamentos/{pagamento_id}")
def get_pagamento(pagamento_id: int, db: Session = Depends(get_db)):
    pagamento = get_pagamento(db, pagamento_id=pagamento_id)
    if not pagamento:
        raise HTTPException(status_code=404, detail="Pagamento not found")
    return pagamento

@app.post("/pagamentos")
def create_pagamento(pagamento: PagamentoSchema, db: Session = Depends(get_db)):
    return create_pagamento(db, pagamento)

@app.put("/pagamentos/{pagamento_id}")
def update_pagamento(pagamento_id: int, pagamento: PagamentoSchema, db: Session = Depends(get_db)):
    updated_pagamento = update_pagamento(db, pagamento_id, pagamento)
    if not updated_pagamento:
        raise HTTPException(status_code=404, detail="Pagamento not found")
    return updated_pagamento

@app.delete("/pagamentos/{pagamento_id}")
def delete_pagamento(pagamento_id: int, db: Session = Depends(get_db)):
    deleted = delete_pagamento(db, pagamento_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Pagamento not found")
    return {"message": "Pagamento deleted successfully"}

# Rotas para Imovel
@app.get("/imoveis")
def get_imoveis(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    imoveis = get_imoveis(db, skip=skip, limit=limit)
    return imoveis

@app.get("/imoveis/{imovel_id}")
def get_imovel(imovel_id: int, db: Session = Depends(get_db)):
    imovel = get_imovel(db, imovel_id=imovel_id)
    if not imovel:
        raise HTTPException(status_code=404, detail="Imovel not found")
    return imovel

@app.post("/imoveis")
def create_imovel(imovel: ImovelSchema, db: Session = Depends(get_db)):
    return create_imovel(db, imovel)

@app.put("/imoveis/{imovel_id}")
def update_imovel(imovel_id: int, imovel: ImovelSchema, db: Session = Depends(get_db)):
    updated_imovel = update_imovel(db, imovel_id, imovel)
    if not updated_imovel:
        raise HTTPException(status_code=404, detail="Imovel not found")
    return updated_imovel

@app.delete("/imoveis/{imovel_id}")
def delete_imovel(imovel_id: int, db: Session = Depends(get_db)):
    deleted = delete_imovel(db, imovel_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Imovel not found")
    return {"message": "Imovel deleted successfully"}