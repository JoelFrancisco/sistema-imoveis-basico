from fastapi import FastAPI
from datetime import datetime
from decimal import Decimal

app = FastAPI()

@app.get("/relatorio")
def read_root(data_inicio: datetime, data_fim: datetime):
    return [
        {
            "nome_imobiliaria": "nova era imobiliaria",
            "qtde_imoveis_locados": 10,
            "valor_total_locacao": Decimal("10000.10"),
            "qtde_imoveis_locacao_aberto": 6,
            "valor_total_locacao_aberto": Decimal("5000.10"),
            "valor_total_divida": Decimal("5000.10"),
        },
        {
            "nome_imobiliaria": "nova era imobiliaria",
            "qtde_imoveis_locados": 10,
            "valor_total_locacao": Decimal("10000.10"),
            "qtde_imoveis_locacao_aberto": 6,
            "valor_total_locacao_aberto": Decimal("5000.10"),
            "valor_total_divida": Decimal("5000.10"),
        },
    ]
