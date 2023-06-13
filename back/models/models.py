from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from server.database import Base

class Pessoa(Base):
    __tablename__ = "Pessoa"
    cd_pessoa = Column(Integer, primary_key=True, index=True)
    nome = Column(String(255))
    telefone = Column(String(20))
    dt_nascimento = Column(Date)
    cpf = Column(String(14))

    imovel = relationship("Imovel", back_populates="pessoa")
    contrato_locador = relationship("Contrato", back_populates="locador")
    contrato_locatario = relationship("Contrato", back_populates="locatario")

class Contrato(Base):
    __tablename__ = "Contrato"
    cd_contrato = Column(Integer, primary_key=True, index=True)
    valor = Column(Integer)
    data_inicio = Column(Date)
    data_fim = Column(Date)
    status_contrato = Column(String(1))
    cd_locador = Column(Integer, ForeignKey("Pessoa.cd_pessoa"))
    cd_locatario = Column(Integer, ForeignKey("Pessoa.cd_pessoa"))
    cd_imovel = Column(Integer, ForeignKey("Imovel.cd_imovel"))

    locador = relationship("Pessoa", foreign_keys=[cd_locador], back_populates="contrato_locador")
    locatario = relationship("Pessoa", foreign_keys=[cd_locatario], back_populates="contrato_locatario")
    imovel = relationship("Imovel", back_populates="contrato")

class Pagamento(Base):
    __tablename__ = "Pagamento"
    cd_pagamento = Column(Integer, primary_key=True, index=True)
    valor_pago = Column(Numeric(10,2))
    data_pagamento = Column(Date)
    valor_trasferido = Column(Numeric(10,2))
    data_vencimento = Column(Date)
    email = Column(String(120))
    status_pagamento = Column(String(1))

    contrato = relationship("Contrato", back_populates="pagamento")

class Imovel(Base):
    __tablename__ = "Imovel"
    cd_imovel = Column(Integer, primary_key=True, index=True)
    ds_imovel = Column(String(1000))
    tipo_imovel = Column(String(30))
    area_construida = Column(Numeric(10,2))
    area_total = Column(Numeric(10,2))
    cd_endereco = Column(Integer, ForeignKey("Endereco.cd_endereco"))
    cd_pessoa = Column(Integer, ForeignKey("Pessoa.cd_pessoa"))

    contrato = relationship("Contrato", back_populates="imovel")
    pessoa = relationship("Pessoa", foreign_keys=[cd_pessoa], back_populates="imovel")

class DadosBancarios(Base):
    __tablename__ = "Dados_bancarios"
    cd_dadosbancarios = Column(Integer, primary_key=True, index=True)
    banco_locatario = Column(String(20))
    agencia_locatario = Column(Integer)
    conta_locatario = Column(Integer)

class Imobiliaria(Base):
    __tablename__ = "Imobiliaria"
    cd_imobiliaria = Column(Integer, primary_key=True, index=True)
    nome_locadora = Column(String(120))
    cnpj = Column(String(14))
    email = Column(String(120))

class Endereco(Base):
    __tablename__ = "Endereco"
    cd_endereco = Column(Integer, primary_key=True, index=True)
    rua = Column(String(120))
    numero = Column(Integer)
    cep = Column(String(8))
    cd_bairro = Column(Integer, ForeignKey("Bairro.cd_bairro"))
    uf = Column(Integer, ForeignKey("Estado.uf"))
    cd_cidade = Column(Integer, ForeignKey("Cidade.cd_cidade"))

    bairro = relationship("Bairro", back_populates="endereco")
    cidade = relationship("Cidade", back_populates="endereco")
    imovel = relationship("Imovel", back_populates="endereco")

class Bairro(Base):
    __tablename__ = "Bairro"
    cd_bairro = Column(Integer, primary_key=True, index=True)
    nome_bairro = Column(String(120))
    cd_cidade = Column(Integer, ForeignKey("Cidade.cd_cidade"))

    endereco = relationship("Endereco", back_populates="bairro")

class Cidade(Base):
    __tablename__ = "Cidade"
    cd_cidade = Column(Integer, primary_key=True, index=True)
    nome_cidade = Column(String(120))
    uf = Column(String(2), ForeignKey("Estado.uf"))

    endereco = relationship("Endereco", back_populates="cidade")
    estado = relationship("Estado", back_populates="cidade")

class Estado(Base):
    __tablename__ = "Estado"
    uf = Column(String(2), primary_key=True, index=True)
    nome_estado = Column(String(120))
    cd_pais = Column(Integer, ForeignKey("Pais.cd_pais"))

    cidade = relationship("Cidade", back_populates="estado")
    pais = relationship("Pais", back_populates="estado")

class Pais(Base):
    __tablename__ = "Pais"
    cd_pais = Column(Integer, primary_key=True, index=True)
    nome_pais = Column(String(120))

    estado = relationship("Estado", back_populates="pais")