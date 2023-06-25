
--Relatorio valor dos imoveis alocados

create or alter proc pc_relatorio_valor_imovel as 
begin
	
	create table #temp_relatorio_imovel (
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

	insert into #temp_relatorio_imovel
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
	on c.cd_locador = p.cd_pessoa
	WHERE
		c.status_contrato = 'A'
	GROUP BY
		i.cd_imovel, i.ds_imovel, i.tipo_imovel, i.area_construida, i.area_total, c.cd_imobiliaria, p.cd_pessoa, p.nome;

	select * from #temp_relatorio_imovel

	drop table #temp_relatorio_imovel
end 
go

exec pc_relatorio_valor_imovel
go

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
END
GO

EXEC pr_relatorio_pagamento_por_locatario
go


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
    ISNULL(CONVERT(varchar(10), p.data_pagamento, 120), 'Agurdando') as Data_Pagamento
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
END
GO

EXEC pc_locatario_inadimplente
GO



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
END
GO

EXEC pr_valor_inadimplentes
go



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

END
GO

EXEC pr_ranking_imobiliarias


		
--Relatório Pagamentos por Locatário
CREATE OR ALTER PROCEDURE pr_relatorio_pagamento_por_locatario AS
BEGIN
    CREATE TABLE #relatorio_pagamento_por_locatario (
        tittle varchar(100),
        cd_pessoa varchar(100),
        locatario varchar(100),
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
        P.nome AS nome_locatario,
        PT.valor_pa AS valor_pago,
        ISNULL(CONVERT(varchar(10),PT.data_pagamento,120),'Aguardando'),
        ISNULL(PT.valor_trasferido, '0'),
        PT.data_vencimento,
        ISNULL(PT.status_pagamento, 'V'),
        CT.cd_imovel
    FROM
      Pessoa P
      INNER JOIN Contrato CT ON P.cd_pessoa = CT.cd_locatario
      INNER JOIN Pagamento PT ON CT.cd_contrato = PT.cd_contrato

    SELECT * FROM #relatorio_pagamento_por_locatario

    DROP TABLE #relatorio_pagamento_por_locatario
END
GO

EXEC pr_relatorio_pagamento_por_locatario
GO


	
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
END
GO

EXEC pr_relatorio_qnt_imoveis_locador
GO



--Relatório de Imóveis por Locatário
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
END
GO

EXEC pr_qnt_imoveis_locatario
GO



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
END
GO

EXEC pr_relatorio_imoveis_regiao
GO
