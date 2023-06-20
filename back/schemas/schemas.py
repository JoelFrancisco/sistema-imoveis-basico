from pydantic import BaseModel

class PessoaSchema(BaseModel):
    cd_pessoa: int
    nome: str
    telefone: str
    dt_nascimento: str
    cpf: str

class ContratoSchema(BaseModel):
    cd_contrato: int
    valor: int
    data_inicio: str
    data_fim: str
    status_contrato: str
    cd_locador: int
    cd_locatario: int
    cd_imovel: int

class PagamentoSchema(BaseModel):
    cd_pagamento: int
    valor_pa: float
    data_pagamento: str
    valor_trasferido: float
    data_vencimento: str
    email: str
    status_pagamento: str
    cd_contrato: int

class ImovelSchema(BaseModel):
    cd_imovel: int
    ds_imovel: str
    tipo_imovel: str
    area_construida: float
    area_total: float
    cd_endereco: int

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