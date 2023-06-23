from pydantic import BaseModel

class DadosBancariosSchema(BaseModel):
    cd_dadosbancarios: int
    banco_locatario: str
    agencia_locatario: int
    conta_locatario: int
    cd_pessoa: int

class ImobiliariaSchema(BaseModel):
    cd_imobiliaria: int
    nome_locadora: str
    cnpj: str
    email: str

class EnderecoSchema(BaseModel):
    cd_endereco: int
    rua: str
    numero: int
    cep: str
    cd_bairro: int

class BairroSchema(BaseModel):
    cd_bairro: int
    nome_bairro: str
    cd_cidade: int

class CidadeSchema(BaseModel):
    cd_cidade: int
    nome_cidade: str
    uf: str

class EstadoSchema(BaseModel):
    uf: str
    nome_estado: str
    cd_pais: int

class PaisSchema(BaseModel):
    cd_pais: int
    nome_pais: str