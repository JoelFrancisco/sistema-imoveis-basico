CREATE TABLE [Pessoa] (
  [cd_pessoa] int PRIMARY KEY,
  [nome] nvarchar(255),
  [telefone] varchar(20),
  [dt_nascimento] date,
  [cpf] varchar(14)
)
GO

CREATE TABLE [Contrato] (
  [cd_contrato] int PRIMARY KEY,
  [valor] int,
  [data_inicio] date,
  [data_fim] date,
  [status_contrato] char(1),
  [cd_locador] int,
  [cd_locatario] int,
  [cd_imovel] int
)
GO

CREATE TABLE [Pagamento] (
  [cd_pagamento] int PRIMARY KEY,
  [valor_pago] numeric(10,2),
  [data_pagamento] date,
  [valor_trasferido] numeric(10,2),
  [data_vencimento] date,
  [email] varchar(120),
  [status_pagamento] char(1)
)
GO

CREATE TABLE [Imovel] (
  [cd_imovel] int PRIMARY KEY,
  [ds_imovel] varchar(1000),
  [tipo_imovel] varchar(30),
  [area_construida] numeric(10,2),
  [area_total] numeric(10,2),
  [cd_endereco] int
)
GO

CREATE TABLE [Dados_bancarios] (
  [cd_dadosbancarios] int PRIMARY KEY,
  [banco_locatario] varchar(20),
  [agencia_locatario] int,
  [conta_locatario] int
)
GO

CREATE TABLE [imobiliaria] (
  [cd_imobiliaria] int PRIMARY KEY,
  [nome_locadora] varchar(120),
  [cnpj] char(14),
  [email] varchar(120)
)
GO

CREATE TABLE [Endereco] (
  [cd_endereco] int PRIMARY KEY,
  [rua] varchar(120),
  [numero] int,
  [cep] char(8),
  [cd_bairro] int,
  [uf] int,
  [cd_cidade] int
)
GO

CREATE TABLE [Bairro] (
  [cd_bairro] int PRIMARY KEY,
  [nome_bairro] varchar(120),
  [cd_cidade] int
)
GO

CREATE TABLE [Cidade] (
  [cd_cidade] int PRIMARY KEY,
  [nome_cidade] varchar(120),
  [uf] char(2)
)
GO

CREATE TABLE [Estado] (
  [uf] char(2) PRIMARY KEY,
  [nome_estado] varchar(120),
  [cd_pais] int
)
GO

CREATE TABLE [Pais] (
  [cd_pais] int PRIMARY KEY,
  [nome_pais] varchar(120)
)
GO

ALTER TABLE [Pessoa] ADD FOREIGN KEY ([cd_imovel]) REFERENCES [Pessoa] ([cd_pessoa])
GO

ALTER TABLE [Dados_bancarios] ADD FOREIGN KEY ([cd_dadosbancarios]) REFERENCES [Pessoa] ([cd_pessoa])
GO

ALTER TABLE [Contrato] ADD FOREIGN KEY ([cd_locador]) REFERENCES [Pessoa] ([cd_pessoa])
GO

ALTER TABLE [Contrato] ADD FOREIGN KEY ([cd_locatario]) REFERENCES [Pessoa] ([cd_pessoa])
GO

ALTER TABLE [Pagamento] ADD FOREIGN KEY ([cd_pagamento]) REFERENCES [Contrato] ([cd_contrato])
GO

ALTER TABLE [Contrato] ADD FOREIGN KEY ([cd_imovel]) REFERENCES [Imovel] ([cd_imovel])
GO

ALTER TABLE [Estado] ADD FOREIGN KEY ([cd_pais]) REFERENCES [Pais] ([cd_pais])
GO

ALTER TABLE [Cidade] ADD FOREIGN KEY ([uf]) REFERENCES [Estado] ([uf])
GO

ALTER TABLE [Bairro] ADD FOREIGN KEY ([cd_cidade]) REFERENCES [Cidade] ([cd_cidade])
GO

ALTER TABLE [Endereco] ADD FOREIGN KEY ([cd_bairro]) REFERENCES [Bairro] ([cd_bairro])
GO

ALTER TABLE [Imovel] ADD FOREIGN KEY ([cd_endereco]) REFERENCES [Endereco] ([cd_endereco])
GO