from pydantic import BaseModel

class ContratoSchemaBase(BaseModel):
    cd_contrato: int
    valor: int
    data_inicio: str
    data_fim: str
    status_contrato: str
    cd_locador: int
    cd_locatario: int
    cd_imovel: int

class ContratoSchemaCreate(BaseModel):
    cd_contrato: int
    valor: int
    data_inicio: str
    data_fim: str
    status_contrato: str
    cd_locador: int
    cd_locatario: int
    cd_imovel: int