from fastapi import FastAPI
from server.database import get_db
from router.RouterPessoa import PessoasRoutes
from router.RouterContrato import ContratosRoutes
from router.RouterPagamento import PagamentosRoutes
from router.RouterImovel import ImoveisRoutes

from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(PessoasRoutes)

app.include_router(ContratosRoutes)

app.include_router(PagamentosRoutes)

app.include_router(ImoveisRoutes)
