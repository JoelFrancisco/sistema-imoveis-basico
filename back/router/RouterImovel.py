from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from server.database import get_db
from models.models import *
from repositories.RepImoveis import *
from schemas.ImovelSchemas import *

ImoveisRoutes = APIRouter()

@ImoveisRoutes.get("/imoveis")
def imoveis_get(db: Session = Depends(get_db)):
    try:
        imoveis = get_imoveis(db)
        return imoveis
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ImoveisRoutes.get("/imoveis/{imovel_id}")
def imovel_get(imovel_id: int, db: Session = Depends(get_db)):
    try:
        imovel = get_imovel(db, imovel_id=imovel_id)
        if not imovel:
            raise HTTPException(status_code=404, detail="Imovel not found")
        return imovel
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ImoveisRoutes.post("/imoveis")
def imovel_create(imovel: ImovelSchemaCreate, db: Session = Depends(get_db)):
    try:
        return create_imovel(db, imovel)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ImoveisRoutes.put("/imoveis/{imovel_id}")
def imovel_update(imovel_id: int, imovel: ImovelSchemaCreate, db: Session = Depends(get_db)):
    try:
        updated_imovel = update_imovel(db, imovel_id, imovel)
        if not updated_imovel:
            raise HTTPException(status_code=404, detail="Imovel not found")
        return updated_imovel
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@ImoveisRoutes.delete("/imoveis/{imovel_id}")
def imovel_delete(imovel_id: int, db: Session = Depends(get_db)):
    try:
        deleted = delete_imovel(db, imovel_id)
        if not deleted:
            raise HTTPException(status_code=404, detail="Imovel not found")
        return {"message": "Imovel deleted successfully"}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))