from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from server.database import get_db
from models.models import *
from repositories.RepPessoas import *
from schemas.PessoaSchemas import *


PessoasRoutes = APIRouter()

@PessoasRoutes.get("/pessoas")
def pessoas_get(db: Session = Depends(get_db)):
    try:
        pessoas = get_pessoas(db)
        return pessoas
    except Exception as e:
        raise HTTPException(status_code=400, detail=e)

@PessoasRoutes.get("/pessoas/{pessoa_id}")
def pessoa_get(pessoa_id: int, db: Session = Depends(get_db)):
    try:
        pessoa = get_pessoa(db, pessoa_id)
        if not pessoa:
            raise ValueError("Pessoa not found")
        return pessoa
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
    
@PessoasRoutes.post("/pessoas")
def pessoa_create(pessoa: PessoaSchemaCreate, db: Session = Depends(get_db)):
    try:
        return  create_pessoa(db, pessoa)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@PessoasRoutes.put("/pessoas/{pessoa_id}")
def pessoa_update(pessoa_id: int, pessoa: PessoaSchemaCreate, db: Session = Depends(get_db)):
    try:
        updated_pessoa = update_pessoa(db, pessoa_id, pessoa)
        if not updated_pessoa:
            raise ValueError("Pessoa not found")
        return updated_pessoa
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
    

@PessoasRoutes.delete("/pessoas/{pessoa_id}")
def pessoa_delete(pessoa_id: int, db: Session = Depends(get_db)):
    try:
        deleted = delete_pessoa(db, pessoa_id)
        if not deleted:
          raise ValueError("Pessoa not found")
        return {"message": "Pessoa deleted successfully"}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))