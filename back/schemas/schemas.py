from pydantic import BaseModel


# Schemas para Pessoa
class PessoaBase(BaseModel):
    nome: str
    telefone: str
    dt_nascimento: str
    cpf: str


class PessoaCreate(PessoaBase):
    pass


class PessoaUpdate(PessoaBase):
    pass


class Pessoa(PessoaBase):
    cd_pessoa: int

    class Config:
        orm_mode = True


# Schemas para Contrato
class ContratoBase(BaseModel):
    valor: int
    data_inicio: str
    data_fim: str
    status_contrato: str
    cd_locador: int
    cd_locatario: int
    cd_imovel: int


class ContratoCreate(ContratoBase):
    pass


class ContratoUpdate(ContratoBase):
    pass


class Contrato(ContratoBase):
    cd_contrato: int

    class Config:
        orm_mode = True


# Schemas para Pagamento
class PagamentoBase(BaseModel):
    valor_pago: float
    data_pagamento: str
    valor_trasferido: float
    data_vencimento: str
    email: str
    status_pagamento: str


class PagamentoCreate(PagamentoBase):
    pass


class PagamentoUpdate(PagamentoBase):
    pass


class Pagamento(PagamentoBase):
    cd_pagamento: int

    class Config:
        orm_mode = True


# Schemas para Imovel
class ImovelBase(BaseModel):
    ds_imovel: str
    tipo_imovel: str
    area_construida: float
    area_total: float
    cd_endereco: int


class ImovelCreate(ImovelBase):
    pass


class ImovelUpdate(ImovelBase):
    pass


class Imovel(ImovelBase):
    cd_imovel: int

    class Config:
        orm_mode = True