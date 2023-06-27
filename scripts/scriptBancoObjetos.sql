-------------------------------------------------------------------------------
-- Drop procedures if exists

DROP PROCEDURE IF EXISTS p_abre_competencia;

DROP PROCEDURE IF EXISTS pc_relatorio_valor_imovel;

DROP PROCEDURE IF EXISTS pr_relatorio_pagamento_por_locatario;

DROP PROCEDURE IF EXISTS pc_locatario_inadimplente;

DROP PROCEDURE IF EXISTS pr_valor_inadimplentes;

DROP PROCEDURE IF EXISTS pr_ranking_imobiliarias;

DROP PROCEDURE IF EXISTS pr_relatorio_qnt_imoveis_locador;

DROP PROCEDURE IF EXISTS pr_qnt_imoveis_locatario;

DROP PROCEDURE IF EXISTS pr_relatorio_imoveis_regiao;

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
-- Criação dos index

CREATE INDEX idx_tipo_imovel ON Imovel (tipo_imovel);

CREATE INDEX idx_contrato_pessoa ON Contrato (cd_locador, status_contrato);

CREATE INDEX idx_contrato_cd_imovel ON Contrato (cd_imovel);

-------------------------------------------------------------------------------
-- Insersão de dados para teste

INSERT INTO [Pais] ([nome_pais]) VALUES
('Brasil'),
('Estados Unidos'),
('Canadá'),
('Alemanha'),
('França'),
('Espanha');

INSERT INTO [Estado] ([nome_estado], [cd_pais]) VALUES
('São Paulo', 1),
('Nova York', 2),
('Ontário', 3),
('Berlim', 4),
('Paris', 5),
('Madri', 6);

INSERT INTO [Cidade] ([nome_cidade], [cd_estado]) VALUES
('São Paulo', 1),
('Nova York', 2),
('Toronto', 3),
('Berlim', 4),
('Paris', 5),
('Madri', 6);

INSERT INTO [Bairro] ([nome_bairro], [cd_cidade]) VALUES
('Centro', 1),
('Brooklyn', 2),
('Yorkville', 2),
('Downtown', 3),
('Mitte', 4),
('Le Marais', 5),
('Sol', 6);

INSERT INTO [Endereco] ([rua], [numero], [cep], [cd_bairro]) VALUES
('Rua A', 123, '01234', 1),
('Main Street', 456, '12345', 2),
('Yonge Street', 789, '67890', 3),
('Berlinstraße', 10, '54321', 4),
('Rue de la Paix', 20, '98765', 5),
('Calle Mayor', 30, '13579', 6);

INSERT INTO [Pessoa] ([nome], [telefone], [dt_nascimento], [cpf]) VALUES
('João', '1111111111', '1990-01-01', '111.111.111-11'),
('Maria', '2222222222', '1995-02-02', '222.222.222-22'),
('Pedro', '3333333333', '1985-03-03', '333.333.333-33'),
('Ana', '4444444444', '1988-04-04', '444.444.444-44'),
('Luiz', '5555555555', '1992-05-05', '555.555.555-55');

INSERT INTO [Imovel] ([ds_imovel], [tipo_imovel], [area_construida], [area_total], [cd_endereco]) VALUES
('Casa na praia', 'Residencial', 150.5, 300.75, 1),
('Apartamento no centro', 'Residencial', 80.25, 100.5, 2),
('Escritório comercial', 'Comercial', 200.0, 200.0, 3),
('Cobertura de luxo', 'Residencial', 300.0, 400.0, 4),
('Loja no centro', 'Comercial', 150.0, 150.0, 5),
('Apartamento com vista', 'Residencial', 90.0, 120.0, 6);

INSERT INTO [Dados_bancarios] ([banco_locatario], [agencia_locatario], [conta_locatario], [cd_pessoa]) VALUES
('Banco A', 1234, 56789, 1),
('Banco B', 4321, 98765, 2),
('Banco C', 2468, 13579, 3),
('Banco D', 1357, 24680, 4),
('Banco E', 9876, 54321, 5);

INSERT INTO [imobiliaria] ([nome_locadora], [cnpj], [email]) VALUES
('Imobiliária X', '12345678901234', 'contato@imobiliariax.com'),
('Imobiliária Y', '56789012345678', 'contato@imobiliariay.com'),
('Imobiliária Z', '90123456789012', 'contato@imobiliariaz.com'),
('Imobiliária A', '34567890123456', 'contato@imobiliariaa.com'),
('Imobiliária B', '78901234567890', 'contato@imobiliariab.com');

INSERT INTO [Contrato] ([valor], [data_inicio], [data_fim], [status_contrato], [cd_locador], [cd_locatario], [cd_imovel], [cd_imobiliaria]) VALUES
(1500, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'A', 1, 2, 1, 1),
(2000, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'P', 3, 2, 2, 5),
(3000, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'A', 2, 1, 3, 2),
(2500, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'P', 4, 3, 4, 3),
(1800, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), DATEADD(MONTH, + CAST((rand() * 10) as int), GETDATE()), 'A', 5, 1, 5, 4);

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
(DATEADD(MONTH, - 1, GETDATE())),
(DATEADD(MONTH, + 1, GETDATE())),
(DATEADD(MONTH, + 2, GETDATE())),
(DATEADD(MONTH, + 3, GETDATE()));

INSERT INTO [Pagamento] ([cd_competencia], [valor_pa], [data_pagamento], [valor_trasferido], [data_vencimento], [email], [status_pagamento], [cd_contrato]) VALUES
(1, 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'joao@email.com', 'P', 1),
(2, 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'joao@email.com', 'P', 1),
(3, 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'joao@email.com', 'P', 1),
(4, 1000.0, null, 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'joao@email.com', 'P', 1),
(5, 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'joao@email.com', 'P', 1),
(1, 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'maria@email.com', 'P', 2),
(2, 1500.0, null, 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'maria@email.com', 'P', 2),
(3, 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'maria@email.com', 'P', 2),
(4, 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'maria@email.com', 'P', 2),
(5, 1500.0, null, 1500.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'maria@email.com', 'P', 2),
(1, 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'pedro@email.com', 'P', 3),
(2, 2000.0, null, 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'pedro@email.com', 'P', 3),
(3, 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'pedro@email.com', 'P', 3),
(4, 2000.0, null, 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'pedro@email.com', 'P', 3),
(5, 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 2000.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'pedro@email.com', 'P', 3),
(1, 1200.0, null, 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'ana@email.com', 'P', 4),
(2, 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'ana@email.com', 'P', 4),
(3, 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'ana@email.com', 'P', 4),
(4, 1200.0, null, 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'ana@email.com', 'P', 4),
(5, 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1200.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'ana@email.com', 'P', 4),
(1, 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'luiz@email.com', 'P', 5),
(2, 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'luiz@email.com', 'P', 5),
(3, 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'luiz@email.com', 'P', 5),
(4, 1800.0, null, 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'luiz@email.com', 'P', 5),
(5, 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 1800.0, DATEADD(MONTH, - CAST((rand() * 10) as int), GETDATE()), 'luiz@email.com', 'P', 5);

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
	
	if datediff(month, @competencia_anterior, getdate()) > 0
		insert into Competencia
		values (DATEADD(MONTH, 1, @competencia_anterior));

END;

--Relatorio valor dos imoveis alocados
CREATE OR ALTER PROC pc_relatorio_valor_imovel AS 
BEGIN
	CREATE TABLE #temp_relatorio_imovel (
		type_relatorio varchar(100),
		cd_imovel varchar(100),
		ds_imovel varchar(100),
		tipo_imovel varchar(100),
		area_construida varchar(100),
		area_total varchar(100),
		cd_imobiliaria varchar(100),
		cd_dono varchar(100),
		dono varchar(100),
		valor int
	)

	INSERT INTO #temp_relatorio_imovel
	SELECT 
	'Relatorio Valor dos imoveis locados',
	  i.cd_imovel,
	  i.ds_imovel,
	  i.tipo_imovel,
	  i.area_construida,
	  i.area_total,
	  c.cd_imobiliaria, 
	  p.cd_pessoa,
	  p.nome,
	  SUM(c.valor) AS valor_total
	FROM
	Imovel i INNER JOIN 
	Contrato c 
	ON i.cd_imovel = c.cd_imovel
	inner join 
	Pessoa p 
	ON c.cd_locador = p.cd_pessoa
	WHERE
		c.status_contrato = 'A'
	GROUP BY
		i.cd_imovel, i.ds_imovel, i.tipo_imovel, i.area_construida, i.area_total, c.cd_imobiliaria, p.cd_pessoa, p.nome;

	SELECT * FROM #temp_relatorio_imovel

	DROP TABLE #temp_relatorio_imovel
END;

--Relatório Pagamentos por Locatário
CREATE OR ALTER PROCEDURE pr_relatorio_pagamento_por_locatario AS
BEGIN
    CREATE TABLE #relatorio_pagamento_por_locatario (
        tittle varchar(100),
        cd_pessoa varchar(100),
        locatario varchar(100),
		email varchar(100),
        valor_pago varchar(100),
        data_pagamento varchar(100),
        valor_trasferido varchar(100),
        data_vencimento varchar(100),
        status_pagamento varchar(100),
        cd_imovel int
    )
    INSERT INTO #relatorio_pagamento_por_locatario
    SELECT
        'Relatório de pagamento por locatário',
        P.cd_pessoa,
        P.nome,
		PT.email,
        PT.valor_pa,
        ISNULL(CONVERT(varchar(10),PT.data_pagamento,120), 'Agurdando'),
        ISNULL(PT.valor_trasferido, '0'),
        PT.data_vencimento,
        ISNULL(PT.status_pagamento, 'A'),
        CT.cd_imovel
    FROM
      Pessoa P
      INNER JOIN Contrato CT ON P.cd_pessoa = CT.cd_locatario
      INNER JOIN Pagamento PT ON CT.cd_contrato = PT.cd_contrato

    SELECT * FROM #relatorio_pagamento_por_locatario

    DROP TABLE #relatorio_pagamento_por_locatario
END;

-- Relatorio de Locatarios Inadimplentes
CREATE OR ALTER PROC pc_locatario_inadimplente AS
BEGIN
	CREATE TABLE #temp_locatario_inadimplente (
	tittle_relatorio varchar(100),
	cd_contrato varchar(100),
	locatario varchar(100),
	cd_pessoa varchar(100),
	cd_imovel varchar(100),
	valor_pendente varchar(100),
	data_vencimento varchar(100),
	data_pagamento varchar(100)
	)

	INSERT INTO #temp_locatario_inadimplente
	SELECT
	'Relátorio de Locatarios Inadimpletes',
	c.cd_contrato,
    pe.nome AS locatario,
    pe.cd_pessoa,
    i.cd_imovel,
    sum(c.valor) as Valor_Pendente,
    p.data_vencimento,
    ISNULL(CONVERT(varchar(10), p.data_pagamento, 120), 'Aguardando') as Data_Pagamento
	FROM
		Pagamento p 
	INNER JOIN
		Contrato c ON p.cd_contrato = c.cd_contrato
	INNER JOIN
		Pessoa pe ON c.cd_locatario = pe.cd_pessoa
	INNER JOIN
		Imovel i ON c.cd_imovel = i.cd_imovel
	WHERE
		c.status_contrato = 'A'
		AND p.data_pagamento IS NULL
		AND p.data_vencimento < GETDATE()
	GROUP BY
		c.cd_contrato, pe.nome, pe.cd_pessoa, i.cd_imovel, p.data_vencimento, p.data_pagamento;


	SELECT * FROM #temp_locatario_inadimplente

	DROP TABLE #temp_locatario_inadimplente
END;

-- Relatorio Valor inadimplentes
CREATE OR ALTER PROC pr_valor_inadimplentes AS
BEGIN
	CREATE TABLE #temp_valor_inadimplente (
		tittle_relatorio varchar(100),
		cd_locatario varchar(100),
		cd_contrato varchar(100),
		locatario varchar(100),
		valor_pendente int,
		meses_atrasados int
	)

	INSERT INTO #temp_valor_inadimplente
	SELECT
		'Relatório de valor inadimplente',
		pe.cd_pessoa,
		c.cd_contrato, 
		pe.nome, 
		sum(p.valor_pa),
		count(*)
	FROM
		Pagamento p 
	INNER JOIN
		Contrato c ON p.cd_contrato = c.cd_contrato
	INNER JOIN
		Pessoa pe ON c.cd_locatario = pe.cd_pessoa
	INNER JOIN
		Imovel i ON c.cd_imovel = i.cd_imovel
	WHERE
		c.status_contrato = 'A'
		AND p.data_pagamento IS NULL
		AND p.data_vencimento < GETDATE()
	GROUP BY
		pe.cd_pessoa, pe.nome, c.cd_contrato

	SELECT * FROM	#temp_valor_inadimplente

	DROP TABLE #temp_valor_inadimplente
END;

-- Relatorio do ranking de imobiliarias
CREATE OR ALTER PROC pr_ranking_imobiliarias AS
BEGIN
	CREATE TABLE #temp_ranking_imobiliarias(
		tittle varchar(100),
		cd_imobiliaria varchar(100),
		nome varchar(100),
		Quantidade_Imoveis_Locados int,
		Quantidade_Total_Locacao int,
		Quantidade_Imoveis_Em_Aberto int,
		Valor_Total_Locacao_Em_Aberto int,
		Valor_Total_Divida int
	)

	INSERT INTO #temp_ranking_imobiliarias 
	SELECT 
		'Relatorio Ranking das Imobiliarias',
		cd_imobiliaria,
		nome_locadora,
		dbo.fn_qnt_imoveis(cd_imobiliaria),
		dbo.fn_valor_total_imobiliaria(cd_imobiliaria) AS Qtd_Total_Locacao,
		dbo.fn_qnt_imoveis_em_aberto(cd_imobiliaria),
		dbo.fn_valor_total_em_aberto(cd_imobiliaria),
		dbo.fn_valor_inadimplentes_imobiliaria(cd_imobiliaria)
	FROM 
		imobiliaria

	SELECT * FROM #temp_ranking_imobiliarias ORDER BY quantidade_total_locacao desc -- Ordenando pela quantidade recebida mensalmente (Maior para menor)

	DROP TABLE #temp_ranking_imobiliarias 

END;

--Relatório da Quantidade de Imóveis por Locador
CREATE OR ALTER PROCEDURE pr_relatorio_qnt_imoveis_locador AS
BEGIN
    CREATE TABLE #qnt_imoveis_locador (
        tittle varchar(100),
        cd_locador varchar(100),
        nome varchar(100),
        cd_imovel int
    )
    INSERT INTO #qnt_imoveis_locador
    SELECT
        'Relatório de imóveis por locador',
        CT.cd_locador,
        P.nome, 
        COUNT(CT.cd_imovel) AS quantidade_imoveis_locados
    FROM
        Contrato CT
        INNER JOIN Pessoa P ON CT.cd_locador = P.cd_pessoa
    GROUP BY
        CT.cd_locador, P.nome;

    SELECT * FROM #qnt_imoveis_locador

    DROP TABLE #qnt_imoveis_locador
END;

-- Relatório de Imóveis por Locatário
CREATE OR ALTER PROCEDURE pr_qnt_imoveis_locatario AS
BEGIN
    CREATE TABLE #qnt_imoveis_locatario(
        tittle varchar(100),
        nome varchar(100),
        cd_locatario varchar(100),
        cd_imovel int
    )

    INSERT INTO #qnt_imoveis_locatario
    SELECT
        'Relatório de imóveis por locatário',
        P.nome,
        CT.cd_locatario,
        COUNT(CT.cd_imovel) AS quantidade_imoveis_locados
    FROM
        Contrato CT
        INNER JOIN Pessoa P ON CT.cd_locatario = P.cd_pessoa
    GROUP BY
        CT.cd_locatario, P.nome;

    SELECT * FROM #qnt_imoveis_locatario

    DROP TABLE #qnt_imoveis_locatario
END;

--Relatório de Imóveis por Região
CREATE OR ALTER PROCEDURE pr_relatorio_imoveis_regiao AS
BEGIN
    CREATE TABLE #relatorio_imoveis_regiao (
        tittle varchar(100),
        cd_imovel varchar(100), 
        rua varchar(100), 
        numero varchar(100), 
        nome_bairro varchar(100), 
        nome_cidade varchar(100), 
        nome_estado varchar(100), 
        nome_pais varchar(100)
    )
    INSERT INTO #relatorio_imoveis_regiao
    SELECT
        'Relatório de imóveis locados por região',
        I.cd_imovel, 
        E.rua, 
        E.numero, 
        B.nome_bairro, 
        C.nome_cidade, 
        ES.nome_estado, 
        P.nome_pais
    FROM Contrato CT
        INNER JOIN Imovel I ON CT.cd_imovel = I.cd_imovel
        INNER JOIN Endereco E ON I.cd_endereco = E.cd_endereco
        INNER JOIN Bairro B ON E.cd_bairro = B.cd_bairro
        INNER JOIN Cidade C ON B.cd_cidade = C.cd_cidade
        INNER JOIN estado es on c.cd_estado = es.cd_estado
        INNER JOIN pais p on es.cd_pais = p.cd_pais

    SELECT * FROM #relatorio_imoveis_regiao

    DROP TABLE #relatorio_imoveis_regiao
END;

-------------------------------------------------------------------------------
-- Criação das funções

-- Função de agregaçção de valor dos inadimplentes por imobiliaria
CREATE OR ALTER FUNCTION fn_valor_inadimplentes_imobiliaria(@cd_imobiliaria int) RETURNS INT
AS
BEGIN
    DECLARE @ValorInadimplentes INT;

    SELECT @ValorInadimplentes = SUM(p.valor_pa)
    FROM Contrato c
    INNER JOIN Pagamento p ON c.cd_contrato = p.cd_contrato
    INNER JOIN imobiliaria i ON c.cd_imobiliaria = i.cd_imobiliaria
    WHERE i.cd_imobiliaria = @cd_imobiliaria 
        AND c.status_contrato = 'A'
        AND p.data_pagamento IS NULL
        AND p.data_vencimento < GETDATE()

    RETURN @ValorInadimplentes;
END;

--Função de cálculo da quantidade de imobiliárias.
CREATE OR ALTER FUNCTION fn_qnt_imoveis(@cd_imobiliaria int) RETURNS INT
AS
BEGIN
    DECLARE @QuantidadeImoveis INT;

    SELECT @QuantidadeImoveis = COUNT(*)
    FROM Contrato c
    INNER JOIN imobiliaria i ON c.cd_imobiliaria = i.cd_imobiliaria
    WHERE i.cd_imobiliaria = @cd_imobiliaria 
        AND c.status_contrato = 'A'

    RETURN @QuantidadeImoveis;
END;

-- Funciont valor total mensal da imobiliaria
CREATE OR ALTER FUNCTION fn_valor_total_imobiliaria(@cd_imobiliaria int) RETURNS INT
AS
BEGIN
    DECLARE @ValorMensalImobiliaria INT;

    SELECT @ValorMensalImobiliaria = SUM(p.valor_trasferido)
    FROM Contrato c
    INNER JOIN Pagamento p ON c.cd_contrato = p.cd_contrato
    INNER JOIN imobiliaria i ON c.cd_imobiliaria = i.cd_imobiliaria
    WHERE i.cd_imobiliaria = @cd_imobiliaria 

    RETURN @ValorMensalImobiliaria;
END;

-- Quantidade total de locações em aberto por imobiliaria 
CREATE OR ALTER FUNCTION fn_qnt_imoveis_em_aberto(@cd_imobiliaria int) RETURNS INT
AS
BEGIN
    DECLARE @QuantidadeImoveis INT;

    SELECT @QuantidadeImoveis = COUNT(*)
    FROM Contrato c
    INNER JOIN imobiliaria i ON c.cd_imobiliaria = i.cd_imobiliaria
    WHERE i.cd_imobiliaria = @cd_imobiliaria 
        AND c.status_contrato = 'P'  -- Pendente, no caso ainda sem locatário

    RETURN @QuantidadeImoveis;
END;

-- Função total da locação por imobiliaria em aberto
CREATE OR ALTER FUNCTION fn_valor_total_em_aberto (@cd_imobiliaria int) RETURNS INT
AS
BEGIN
    DECLARE @ValorEmAberto INT;

    SELECT @ValorEmAberto = SUM(c.valor)
    FROM Contrato c
    INNER JOIN imobiliaria i ON c.cd_imobiliaria = i.cd_imobiliaria
    WHERE i.cd_imobiliaria = @cd_imobiliaria 
        AND c.status_contrato = 'P'


    RETURN @ValorEmAberto;
END;