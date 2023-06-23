from fastapi import FastAPI
from server.database import get_db
from router.RouterPessoa import PessoasRoutes
from router.RouterContrato import ContratosRoutes
from router.RouterPagamento import PagamentosRoutes
from router.RouterImovel import ImoveisRoutes

app = FastAPI()

app.include_router(PessoasRoutes)

app.include_router(ContratosRoutes)

app.include_router(PagamentosRoutes)

app.include_router(ImoveisRoutes)