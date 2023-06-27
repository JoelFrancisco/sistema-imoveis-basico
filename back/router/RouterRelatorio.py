from fastapi import APIRouter, Depends, HTTPException

from server.database import get_db
from repositories.RepRelatorios import *

RelatoriosRoutes = APIRouter()


@RelatoriosRoutes.get("/relatorios/ranking/imobiliarias")
def relatorios_get(data_inicio: datetime, data_fim: datetime, db: Session = Depends(get_db)):
    try:
        relatorios = get_relatorio_ranking_imobiliarias_por_periodo(db, data_inicio, data_fim)
        return relatorios
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))


