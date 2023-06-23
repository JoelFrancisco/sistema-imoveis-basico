from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from server.database import get_db
from models.models import *
from repositories.RepContrato import *
from schemas.ContratoSchemas import *

ContratosRoutes = APIRouter()

@ContratosRoutes.get("/contratos")
def contratos_get(db: Session = Depends(get_db)):
    try:
        contratos = get_contratos(db)
        return contratos
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ContratosRoutes.get("/contratos/{contrato_id}")
def contrato_get(contrato_id: int, db: Session = Depends(get_db)):
    try:
        contrato = get_contrato(db, contrato_id=contrato_id)
        if not contrato:
            raise HTTPException(status_code=404, detail="Contrato not found")
        return contrato
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ContratosRoutes.post("/contratos")
def contrato_create(contrato: ContratoSchemaCreate, db: Session = Depends(get_db)):
    try:
        return create_contrato(db, contrato)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ContratosRoutes.put("/contratos/{contrato_id}")
def contrato_update(contrato_id: int, contrato: ContratoSchemaCreate, db: Session = Depends(get_db)):
    try:
        updated_contrato = update_contrato(db, contrato_id, contrato)
        if not updated_contrato:
            raise ValueError("Contrato not found")
        return updated_contrato
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ContratosRoutes.delete("/contratos/{contrato_id}")
def contrato_delete(contrato_id: int, db: Session = Depends(get_db)):
    try:
        deleted = delete_contrato(db, contrato_id)
        if not deleted:
            raise ValueError("Contrato not found")
        return {"message": "Contrato deleted successfully"}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))