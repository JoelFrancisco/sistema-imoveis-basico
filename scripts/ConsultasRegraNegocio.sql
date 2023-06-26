--------------------------------------------------------------------------------
-- Consultas "Regras de Negócio"

-- QUANTOS IMOVEIS RESIDENCIAS TEM POR CIDADE
SELECT
    c.nome_cidade,
    COUNT(i.cd_imovel) AS total_imoveis_residenciais
FROM
    Cidade c
INNER JOIN
    Bairro b ON c.cd_cidade = b.cd_cidade
INNER JOIN
    Endereco en ON b.cd_bairro = en.cd_bairro
INNER JOIN
    Imovel i ON en.cd_endereco = i.cd_endereco
WHERE
    i.tipo_imovel = 'Residencial'
GROUP BY
    c.nome_cidade;

-- PESSOAS QUE POSSUEM CONTRATOS ATIVOS E A QUANTIA QUE CADA PESSOA POSSUI
SELECT
    p.nome,
    COUNT(c.cd_contrato) AS quantidade_contratos
FROM
    Pessoa p
INNER JOIN
    Contrato c ON p.cd_pessoa = c.cd_locador OR p.cd_pessoa = c.cd_locatario
WHERE
    c.status_contrato = 'A'
GROUP BY
    p.nome;

-- MEDIA DOS VALORES DOS CONTRATOS DE LOCAÇÃO POR TIPOS DE IMOVEL
SELECT tipo_imovel, AVG(valor) AS media_valor_contrato
FROM Contrato c
INNER JOIN Imovel i ON c.cd_imovel = i.cd_imovel
GROUP BY tipo_imovel;

-- 5 principais imoveis com a maior receita total de aluguel, incluindo a descrição do imóvel, a agência imobiliária correspondente e Dono.
SELECT TOP 5
    p.nome as Dono,
	i.ds_imovel,
    i.tipo_imovel,
    SUM(pa.valor_pa) AS Total_Ganho,
    im.nome_locadora
FROM
    Contrato c
    INNER JOIN Imovel i ON c.cd_imovel = i.cd_imovel
    INNER JOIN Imobiliaria im ON c.cd_imobiliaria = im.cd_imobiliaria
	INNER JOIN Pessoa p ON c.cd_locador = p.cd_pessoa
	INNER JOIN Pagamento pa ON c.cd_contrato = pa.cd_contrato
WHERE
    pa.status_pagamento = 'P'
GROUP BY
    p.nome,
	i.ds_imovel,
    i.tipo_imovel,
    im.nome_locadora
ORDER BY
    Total_Ganho DESC;

