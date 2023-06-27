from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Pessoa(Base):
    __tablename__ = 'Pessoa'

    cd_pessoa = Column(Integer, primary_key=True)
    nome = Column(String(255))
    telefone = Column(String(20))
    dt_nascimento = Column(Date)
    cpf = Column(String(14))


class Contrato(Base):
    __tablename__ = 'Contrato'

    cd_contrato = Column(Integer, primary_key=True)
    valor = Column(Integer)
    data_inicio = Column(Date)
    data_fim = Column(Date)
    status_contrato = Column(String(1))
    cd_locador = Column(Integer, ForeignKey('Pessoa.cd_pessoa'))
    cd_locatario = Column(Integer, ForeignKey('Pessoa.cd_pessoa'))
    cd_imovel = Column(Integer, ForeignKey('Imovel.cd_imovel'))


class Pagamento(Base):
    __tablename__ = 'Pagamento'

    cd_pagamento = Column(Integer, primary_key=True)
    valor_pa = Column(Numeric(10, 2))
    data_pagamento = Column(Date)
    valor_transferido = Column(Numeric(10, 2))
    data_vencimento = Column(Date)
    email = Column(String(120))
    status_pagamento = Column(String(1))
    cd_contrato = Column(Integer, ForeignKey('Contrato.cd_contrato'))


class Imovel(Base):
    __tablename__ = 'Imovel'

    cd_imovel = Column(Integer, primary_key=True)
    ds_imovel = Column(String(1000))
    tipo_imovel = Column(String(30))
    area_construida = Column(Numeric(10, 2))
    area_total = Column(Numeric(10, 2))
    cd_endereco = Column(Integer, ForeignKey('Endereco.cd_endereco'))


class DadosBancarios(Base):
    __tablename__ = 'Dados_bancarios'

    cd_dadosbancarios = Column(Integer, primary_key=True)
    banco_locatario = Column(String(20))
    agencia_locatario = Column(Integer)
    conta_locatario = Column(Integer)
    cd_pessoa = Column(Integer, ForeignKey('Pessoa.cd_pessoa'))


class Imobiliaria(Base):
    __tablename__ = 'imobiliaria'

    cd_imobiliaria = Column(Integer, primary_key=True)
    nome_locadora = Column(String(120))
    cnpj = Column(String(14))
    email = Column(String(120))


class Endereco(Base):
    __tablename__ = 'Endereco'

    cd_endereco = Column(Integer, primary_key=True)
    rua = Column(String(120))
    numero = Column(Integer)
    cep = Column(String(8))
    cd_bairro = Column(Integer, ForeignKey('Bairro.cd_bairro'))


class Bairro(Base):
    __tablename__ = 'Bairro'

    cd_bairro = Column(Integer, primary_key=True)
    nome_bairro = Column(String(120))
    cd_cidade = Column(Integer, ForeignKey('Cidade.cd_cidade'))


class Cidade(Base):
    __tablename__ = 'Cidade'

    cd_cidade = Column(Integer, primary_key=True)
    nome_cidade = Column(String(120))
    uf = Column(String(2))


class Estado(Base):
    __tablename__ = 'Estado'

    uf = Column(String(2), primary_key=True)
    nome_estado = Column(String(120))
    cd_pais = Column(Integer, ForeignKey('Pais.cd_pais'))


class Pais(Base):
    __tablename__ = 'Pais'

    cd_pais = Column(Integer, primary_key=True)
    nome_pais = Column(String(120))


class RankingImobiliariasRelatorio(Base):
    __tablename__ = 'temp_ranking_imobiliarias'

    cd_imobiliaria = Column(String(100), primary_key=True)
    title = Column(String(100),name="tittle")
    nome = Column(String(100))
    Quantidade_Imoveis_Locados = Column(Integer)
    Quantidade_Total_Locacao = Column(Integer)
    Quantidade_Imoveis_Em_Aberto = Column(Integer)
    Valor_Total_Locacao_Em_Aberto = Column(Integer)
    Valor_Total_Divida = Column(Integer)
