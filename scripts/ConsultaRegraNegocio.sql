 --5 principais imóveis com a maior receita total de aluguel, incluindo a descrição do imóvel, a agência imobiliária correspondente e Dono.
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