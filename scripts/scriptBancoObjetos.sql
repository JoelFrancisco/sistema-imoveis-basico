-------------------------------------------------------------------------------
-- Drop procedures if exists

DROP PROCEDURE IF EXISTS p_abre_competencia;

-------------------------------------------------------------------------------
-- Drop das Fks
   
-- Drop da FK_CD_COMPETENCIA na tabela Pagamento
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Pagamento') AND o.name = 'FK_CD_COMPETENCIA')
ALTER TABLE Pagamento
	DROP CONSTRAINT FK_CD_COMPETENCIA;


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

-- Drop da FK_cd_estado na tabela Cidade
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Cidade') AND o.name = 'FK_cd_estado')
ALTER TABLE Cidade
	DROP CONSTRAINT FK_cd_estado;

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

-- Drop da FK_CD_IMOBILIARIA na tabela Contrato
IF EXISTS (SELECT 1
	FROM sys.sysreferences r JOIN sys.sysobjects o ON (o.id = r.constid AND o.type = 'F')
   WHERE r.fkeyid = OBJECT_ID('Contrato') AND o.name = 'FK_CD_IMOBILIARIA')
ALTER TABLE Contrato
	DROP CONSTRAINT FK_CD_IMOBILIARIA; 

-------------------------------------------------------------------------------
-- Drop das tabelas

-- Drop da tabela Competencia se existir
IF EXISTS (SELECT 1 FROM sysobjects WHERE id = OBJECT_ID('[Competencia]') AND type = 'U')
DROP TABLE [Competencia];

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

CREATE TABLE [Competencia] (
  [cd_competencia] int IDENTITY PRIMARY KEY,
  [data_competencia] date
);

CREATE TABLE [Pessoa] (
  [cd_pessoa] int IDENTITY PRIMARY KEY,
  [nome] nvarchar(255),
  [telefone] varchar(20),
  [dt_nascimento] date,
  [cpf] varchar(14)
);

CREATE TABLE [Contrato] (
  [cd_contrato] int IDENTITY PRIMARY KEY,
  [valor] int,
  [data_inicio] date,
  [data_fim] date,
  [status_contrato] char(1),
  [cd_locador] int,
  [cd_locatario] int,
  [cd_imovel] int,
  [cd_imobiliaria] int
);

CREATE TABLE [Pagamento] (
  [cd_pagamento] int IDENTITY PRIMARY KEY,
  [cd_competencia] int,
  [valor_pa] numeric(10,2),
  [data_pagamento] date,
  [valor_trasferido] numeric(10,2),
  [data_vencimento] date,
  [email] varchar(120),
  [status_pagamento] char(1),
  [cd_contrato] int
);

CREATE TABLE [Imovel] (
  [cd_imovel] int IDENTITY PRIMARY KEY,
  [ds_imovel] varchar(1000),
  [tipo_imovel] varchar(30),
  [area_construida] numeric(10,2),
  [area_total] numeric(10,2),
  [cd_endereco] int
);

CREATE TABLE [Dados_bancarios] (
  [cd_dadosbancarios] int IDENTITY PRIMARY KEY,
  [banco_locatario] varchar(20),
  [agencia_locatario] int,
  [conta_locatario] int,
  [cd_pessoa] int
);

CREATE TABLE [imobiliaria] (
  [cd_imobiliaria] int IDENTITY PRIMARY KEY,
  [nome_locadora] varchar(120),
  [cnpj] char(14),
  [email] varchar(120)
);

CREATE TABLE [Endereco] (
  [cd_endereco] int IDENTITY PRIMARY KEY,
  [rua] varchar(120),
  [numero] int,
  [cep] char(8),
  [cd_bairro] int
);

CREATE TABLE [Bairro] (
  [cd_bairro] int IDENTITY PRIMARY KEY,
  [nome_bairro] varchar(120),
  [cd_cidade] int
);

CREATE TABLE [Cidade] (
  [cd_cidade] int IDENTITY PRIMARY KEY,
  [nome_cidade] varchar(120),
  [cd_estado] int
);

CREATE TABLE [Estado] (
  [cd_estado] int IDENTITY PRIMARY KEY,
  [nome_estado] varchar(120),
  [cd_pais] int
);

CREATE TABLE [Pais] (
  [cd_pais] int IDENTITY PRIMARY KEY,
  [nome_pais] varchar(120)
);

-------------------------------------------------------------------------------
-- Criação das FKs

ALTER TABLE [Pagamento]
ADD CONSTRAINT FK_CD_COMPETENCIA FOREIGN KEY ([cd_competencia])
REFERENCES [Competencia] ([cd_competencia]);

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
ADD CONSTRAINT FK_cd_estado FOREIGN KEY ([cd_estado])
REFERENCES [Estado] ([cd_estado]);

ALTER TABLE [Bairro]
ADD CONSTRAINT FK_CD_CIDADE FOREIGN KEY ([cd_cidade])
REFERENCES [Cidade] ([cd_cidade]);

ALTER TABLE [Endereco]
ADD CONSTRAINT FK_CD_BAIRRO FOREIGN KEY ([cd_bairro])
REFERENCES [Bairro] ([cd_bairro]);

ALTER TABLE [Imovel]
ADD CONSTRAINT FK_CD_ENDERECO FOREIGN KEY ([cd_endereco])
REFERENCES [Endereco] ([cd_endereco]);

ALTER TABLE [Contrato]
ADD CONSTRAINT FK_CD_IMOBILIARIA FOREIGN KEY ([cd_imobiliaria])
REFERENCES [Imobiliaria] ([cd_imobiliaria]);

-------------------------------------------------------------------------------
-- Insersão de dados para teste

INSERT INTO [Pais] ([nome_pais]) VALUES
('Brasil'),
('Estados Unidos'),
('Canadá');

INSERT INTO [Estado] ([nome_estado], [cd_pais]) VALUES
('São Paulo', 1),
('Nova York', 2),
('Ontário', 3);

INSERT INTO [Cidade] ([nome_cidade], [cd_estado]) VALUES
('São Paulo', 1),
('Nova York', 2),
('Toronto', 3);

INSERT INTO [Bairro] ([nome_bairro], [cd_cidade]) VALUES
('Centro', 1),
('Brooklyn', 2),
('Yorkville', 2),
('Downtown', 3);

INSERT INTO [Endereco] ([rua], [numero], [cep], [cd_bairro]) VALUES
('Rua A', 123, '01234', 1),
('Main Street', 456, '12345', 2),
('Yonge Street', 789, '67890', 3);

INSERT INTO [Pessoa] ([nome], [telefone], [dt_nascimento], [cpf]) VALUES
('João', '1111111111', '1990-01-01', '111.111.111-11'),
('Maria', '2222222222', '1995-02-02', '222.222.222-22'),
('Pedro', '3333333333', '1985-03-03', '333.333.333-33');

INSERT INTO [Imovel] ([ds_imovel], [tipo_imovel], [area_construida], [area_total], [cd_endereco]) VALUES
('Casa na praia', 'Residencial', 150.5, 300.75, 1),
('Apartamento no centro', 'Residencial', 80.25, 100.5, 2),
('Escritório comercial', 'Comercial', 200.0, 200.0, 3);

INSERT INTO [Dados_bancarios] ([banco_locatario], [agencia_locatario], [conta_locatario], [cd_pessoa]) VALUES
('Banco A', 1234, 56789, 1),
('Banco B', 4321, 98765, 2),
('Banco C', 2468, 13579, 3);

INSERT INTO [imobiliaria] ([nome_locadora], [cnpj], [email]) VALUES
('Imobiliária X', '12345678901234', 'contato@imobiliariax.com'),
('Imobiliária Y', '56789012345678', 'contato@imobiliariay.com');

INSERT INTO [Contrato] ([valor], [data_inicio], [data_fim], [status_contrato], [cd_locador], [cd_locatario], [cd_imovel], [cd_imobiliaria]) VALUES
(1500, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'A', 1, 2, 1, 1),
(2000, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'A', 3, 2, 2, 2),
(3000, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'A', 2, 1, 3, 2);

INSERT INTO [Competencia] ([data_competencia]) VALUES
(DATEADD(MONTH, - 12, GETDATE())),
(DATEADD(MONTH, - 11, GETDATE())),
(DATEADD(MONTH, - 10, GETDATE())),
(DATEADD(MONTH, - 9, GETDATE())),
(DATEADD(MONTH, - 8, GETDATE())),
(DATEADD(MONTH, - 7, GETDATE())),
(DATEADD(MONTH, - 6, GETDATE())),
(DATEADD(MONTH, - 5, GETDATE())),
(DATEADD(MONTH, - 4, GETDATE())),
(DATEADD(MONTH, - 3, GETDATE())),
(DATEADD(MONTH, - 2, GETDATE())),
(DATEADD(MONTH, - 1, GETDATE()));

INSERT INTO [Pagamento] ([cd_competencia], [valor_pa], [data_pagamento], [valor_trasferido], [data_vencimento], [email], [status_pagamento], [cd_contrato]) VALUES
(1, 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'joao@email.com', 'P', 1),
(2, 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'maria@email.com', 'P', 2),
(3, 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'pedro@email.com', 'P', 3);

-------------------------------------------------------------------------------
-- Selects ae pra ajudar
    
--select *
--  from endereco  
--  
--select *
--  from Bairro
--  
--select *
--  from Cidade
--
--select *
--  from estado
--
--select *
--  from pais  
--  
--select *
--  from Dados_bancarios
--  
--select *
--  from Pessoa
--  
--select *
--  from imovel
--
--select *
--  from imobiliaria
--  
--select *
--  from Contrato
--  
--select *
--  from Pagamento;

-------------------------------------------------------------------------------
-- Create procedures 

-- create procedure p_abre_competencia
create procedure p_abre_competencia as 
BEGIN
	declare @id_competencia_anterior int,
			@competencia_anterior date;
	
	select @id_competencia_anterior = MAX(cd_competencia)
	  from Competencia;
	
	SELECT @competencia_anterior = data_competencia
	  from Competencia;
	
	insert into Competencia
	values (DATEADD(MONTH, 1, @competencia_anterior));
END;
