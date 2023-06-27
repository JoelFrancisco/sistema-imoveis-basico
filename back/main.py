from fastapi import FastAPI
from server.database import get_db
from router.RouterPessoa import PessoasRoutes
from router.RouterContrato import ContratosRoutes
from router.RouterPagamento import PagamentosRoutes
from router.RouterImovel import ImoveisRoutes
from router.RouterRelatorio import RelatoriosRoutes

from fastapi.middleware.cors import CORSMiddleware

import uvicorn

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

app.include_router(RelatoriosRoutes)

if __name__ == '__main__':
    uvicorn.run(app, host="0.0.0.0", port=8000)
