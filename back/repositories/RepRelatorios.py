from datetime import datetime
import logging
from sqlalchemy.orm import Session
from sqlalchemy import text

from models.models import RankingImobiliariasRelatorio

# Repositório para Relatorio
def get_relatorio_ranking_imobiliarias_por_periodo(db: Session, data_inicio: datetime, data_fim: datetime):
    db.execute(text("EXEC dbo.pr_ranking_imobiliarias :data_ini, :data_fim"), params={
        "data_ini": str(data_inicio),
        "data_fim": str(data_fim)
    })

    db.commit()
    return db.query(RankingImobiliariasRelatorio).order_by(RankingImobiliariasRelatorio.Valor_Total_Divida).all()
