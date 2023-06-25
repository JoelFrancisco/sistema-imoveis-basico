﻿--Função para calcular valor de não pagantes(inadimplentes)

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