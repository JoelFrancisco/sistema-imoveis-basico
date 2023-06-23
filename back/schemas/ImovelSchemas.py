from pydantic import BaseModel

class ImovelSchemaBase(BaseModel):
    cd_imovel: int
    ds_imovel: str
    tipo_imovel: str
    area_construida: float
    area_total: float
    cd_endereco: int

class ImovelSchemaCreate(BaseModel):
    ds_imovel: str
    tipo_imovel: str
    area_construida: float
    area_total: float
    cd_endereco: int