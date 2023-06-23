from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from server.database import get_db
from models.models import *
from repositories.RepPagamento import *
from schemas.PagamentoSchemas import *

PagamentosRoutes = APIRouter()

@PagamentosRoutes.get("/pagamentos")
def pagamentos_get(db: Session = Depends(get_db)):
    try:
        pagamentos = get_pagamentos(db)
        return pagamentos
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@PagamentosRoutes.get("/pagamentos/{pagamento_id}")
def pagamento_get(pagamento_id: int, db: Session = Depends(get_db)):
    try:
        pagamento = get_pagamento(db, pagamento_id=pagamento_id)
        if not pagamento:
            raise HTTPException(status_code=404, detail="Pagamento not found")
        return pagamento
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@PagamentosRoutes.post("/pagamentos")
def pagamento_create(pagamento: PagamentoSchemaCreate, db: Session = Depends(get_db)):
    try:
        return create_pagamento(db, pagamento)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@PagamentosRoutes.put("/pagamentos/{pagamento_id}")
def pagamento_update(pagamento_id: int, pagamento: PagamentoSchemaCreate, db: Session = Depends(get_db)):
    try:
        updated_pagamento = update_pagamento(db, pagamento_id, pagamento)
        if not updated_pagamento:
            raise HTTPException(status_code=404, detail="Pagamento not found")
        return updated_pagamento
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@PagamentosRoutes.delete("/pagamentos/{pagamento_id}")
def pagamento_delete(pagamento_id: int, db: Session = Depends(get_db)):
    try:
        deleted = delete_pagamento(db, pagamento_id)
        if not deleted:
            raise HTTPException(status_code=404, detail="Pagamento not found")
        return {"message": "Pagamento deleted successfully"}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))