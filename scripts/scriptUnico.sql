-------------------------------------------------------------------------------
-- Drop das Fks
   
-- Drop da FK_CD_PESSOA na tabela Dados_bancarios
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Dados_bancarios') AND o.name = 'FK_CD_PESSOA')
ALTER TABLE Dados_bancarios
	DROP CONSTRAINT FK_CD_PESSOA;

-- Drop da FK_CD_LOCADOR na tabela Contrato
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Contrato') AND o.name = 'FK_CD_LOCADOR')
ALTER TABLE Contrato
	DROP CONSTRAINT FK_CD_LOCADOR;

-- Drop da FK_CD_LOCATARIO na tabela Contrato
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Contrato') AND o.name = 'FK_CD_LOCATARIO')
ALTER TABLE Contrato
	DROP CONSTRAINT FK_CD_LOCATARIO;

-- Drop da FK_CD_CONTRATO na tabela Pagamento
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Pagamento') AND o.name = 'FK_CD_CONTRATO')
ALTER TABLE Pagamento
	DROP CONSTRAINT FK_CD_CONTRATO;

-- Drop da FK_CD_IMOVEL na tabela Contrato
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Contrato') AND o.name = 'FK_CD_IMOVEL')
ALTER TABLE Contrato
	DROP CONSTRAINT FK_CD_IMOVEL;

-- Drop da FK_CD_PAIS na tabela Estado
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Estado') AND o.name = 'FK_CD_PAIS')
ALTER TABLE Estado
	DROP CONSTRAINT FK_CD_PAIS;

-- Drop da FK_UF na tabela Cidade
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Cidade') AND o.name = 'FK_UF')
ALTER TABLE Cidade
	DROP CONSTRAINT FK_UF;

-- Drop da FK_CD_CIDADE na tabela Bairro
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Bairro') AND o.name = 'FK_CD_CIDADE')
ALTER TABLE Bairro
	DROP CONSTRAINT FK_CD_CIDADE;

-- Drop da FK_CD_BAIRRO na tabela Endereco
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Endereco') AND o.name = 'FK_CD_BAIRRO')
ALTER TABLE Endereco
	DROP CONSTRAINT FK_CD_BAIRRO;

-- Drop da FK_CD_ENDERECO na tabela Imovel
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Imovel') AND o.name = 'FK_CD_ENDERECO')
ALTER TABLE Imovel
	DROP CONSTRAINT FK_CD_ENDERECO; 

-------------------------------------------------------------------------------

-- Drop das tabelas

-- Drop da tabela Pessoa se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Pessoa]') AND type = 'U')
DROP TABLE [Pessoa];

-- Drop da tabela Contrato se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Contrato]') AND type = 'U')
DROP TABLE [Contrato];

-- Drop da tabela Pagamento se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Pagamento]') AND type = 'U')
DROP TABLE [Pagamento];

-- Drop da tabela Imovel se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Imovel]') AND type = 'U')
DROP TABLE [Imovel];

-- Drop da tabela Dados_bancarios se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Dados_bancarios]') AND type = 'U')
DROP TABLE [Dados_bancarios];

-- Drop da tabela imobiliaria se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[imobiliaria]') AND type = 'U')
DROP TABLE [imobiliaria];

-- Drop da tabela Endereco se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Endereco]') AND type = 'U')
DROP TABLE [Endereco];

-- Drop da tabela Bairro se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Bairro]') AND type = 'U')
DROP TABLE [Bairro];

-- Drop da tabela Cidade se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Cidade]') AND type = 'U')
DROP TABLE [Cidade];

-- Drop da tabela Estado se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Estado]') AND type = 'U')
DROP TABLE [Estado];

-- Drop da tabela Pais se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Pais]') AND type = 'U')
DROP TABLE [Pais];



-------------------------------------------------------------------------------

-- Criação das tabelas

CREATE TABLE [Pessoa] (
  [cd_pessoa] int PRIMARY KEY,
  [nome] nvarchar(255),
  [telefone] varchar(20),
  [dt_nascimento] date,
  [cpf] varchar(14)
);

CREATE TABLE [Contrato] (
  [cd_contrato] int PRIMARY KEY,
  [valor] int,
  [data_inicio] date,
  [data_fim] date,
  [status_contrato] char(1),
  [cd_locador] int,
  [cd_locatario] int,
  [cd_imovel] int
);

CREATE TABLE [Pagamento] (
  [cd_pagamento] int PRIMARY KEY,
  [valor_pa] numeric(10,2),
  [data_pagamento] date,
  [valor_trasferido] numeric(10,2),
  [data_vencimento] date,
  [email] varchar(120),
  [status_pagamento] char(1),
  [cd_contrato] int
);

CREATE TABLE [Imovel] (
  [cd_imovel] int PRIMARY KEY,
  [ds_imovel] varchar(1000),
  [tipo_imovel] varchar(30),
  [area_construida] numeric(10,2),
  [area_total] numeric(10,2),
  [cd_endereco] int
);

CREATE TABLE [Dados_bancarios] (
  [cd_dadosbancarios] int PRIMARY KEY,
  [banco_locatario] varchar(20),
  [agencia_locatario] int,
  [conta_locatario] int,
  [cd_pessoa] int
);

CREATE TABLE [imobiliaria] (
  [cd_imobiliaria] int PRIMARY KEY,
  [nome_locadora] varchar(120),
  [cnpj] char(14),
  [email] varchar(120)
);

CREATE TABLE [Endereco] (
  [cd_endereco] int PRIMARY KEY,
  [rua] varchar(120),
  [numero] int,
  [cep] char(8),
  [cd_bairro] int
);

CREATE TABLE [Bairro] (
  [cd_bairro] int PRIMARY KEY,
  [nome_bairro] varchar(120),
  [cd_cidade] int
);

CREATE TABLE [Cidade] (
  [cd_cidade] int PRIMARY KEY,
  [nome_cidade] varchar(120),
  [uf] char(2)
);

CREATE TABLE [Estado] (
  [uf] char(2) PRIMARY KEY,
  [nome_estado] varchar(120),
  [cd_pais] int
);

CREATE TABLE [Pais] (
  [cd_pais] int PRIMARY KEY,
  [nome_pais] varchar(120)
);

-------------------------------------------------------------------------------

-- Criação das FKs

ALTER TABLE [Dados_bancarios]
ADD CONSTRAINT FK_CD_PESSOA FOREIGN KEY ([cd_pessoa])
REFERENCES [Pessoa] ([cd_pessoa]);


ALTER TABLE [Contrato]
ADD CONSTRAINT FK_CD_LOCADOR FOREIGN KEY ([cd_locador])
REFERENCES [Pessoa] ([cd_pessoa]);

ALTER TABLE [Contrato]
ADD CONSTRAINT FK_CD_LOCATARIO FOREIGN KEY ([cd_locatario])
REFERENCES [Pessoa] ([cd_pessoa]);

ALTER TABLE [Pagamento]
ADD CONSTRAINT FK_CD_CONTRATO FOREIGN KEY ([cd_contrato])
REFERENCES [Contrato] ([cd_contrato]);

ALTER TABLE [Contrato]
ADD CONSTRAINT FK_CD_IMOVEL FOREIGN KEY ([cd_imovel])
REFERENCES [Imovel] ([cd_imovel]);

ALTER TABLE [Estado]
ADD CONSTRAINT FK_CD_PAIS FOREIGN KEY ([cd_pais])
REFERENCES [Pais] ([cd_pais]);

ALTER TABLE [Cidade]
ADD CONSTRAINT FK_UF FOREIGN KEY ([uf])
REFERENCES [Estado] ([uf]);

ALTER TABLE [Bairro]
ADD CONSTRAINT FK_CD_CIDADE FOREIGN KEY ([cd_cidade])
REFERENCES [Cidade] ([cd_cidade]);

ALTER TABLE [Endereco]
ADD CONSTRAINT FK_CD_BAIRRO FOREIGN KEY ([cd_bairro])
REFERENCES [Bairro] ([cd_bairro]);

ALTER TABLE [Imovel]
ADD CONSTRAINT FK_CD_ENDERECO FOREIGN KEY ([cd_endereco])
REFERENCES [Endereco] ([cd_endereco]);
