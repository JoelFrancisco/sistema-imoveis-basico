INSERT INTO [Pais] ([cd_pais], [nome_pais]) VALUES
(1, 'Brasil'),
(2, 'Estados Unidos'),
(3, 'Canadá');

INSERT INTO [Estado] ([uf], [nome_estado], [cd_pais]) VALUES
(1, 'São Paulo', 1),
(2, 'Nova York', 2),
(3, 'Ontário', 3);

INSERT INTO [Cidade] ([cd_cidade], [nome_cidade], [uf]) VALUES
(1, 'São Paulo', 1),
(2, 'Nova York', 2),
(3, 'Toronto', 3);

INSERT INTO [Bairro] ([cd_bairro], [nome_bairro], [cd_cidade]) VALUES
(1, 'Centro', 1),
(2, 'Brooklyn', 2),
(3, 'Yorkville', 2),
(4, 'Downtown', 3);

INSERT INTO [Endereco] ([cd_endereco], [rua], [numero], [cep], [cd_bairro], [uf], [cd_cidade]) VALUES
(1, 'Rua A', 123, '01234', 1, 1, 1),
(2, 'Main Street', 456, '12345', 2, 2, 2),
(3, 'Yonge Street', 789, '67890', 3, 3, 3);

INSERT INTO [Pessoa] ([cd_pessoa], [nome], [telefone], [dt_nascimento], [cpf]) VALUES
(1, 'João', '1111111111', '1990-01-01', '111.111.111-11'),
(2, 'Maria', '2222222222', '1995-02-02', '222.222.222-22'),
(3, 'Pedro', '3333333333', '1985-03-03', '333.333.333-33');

INSERT INTO [Imovel] ([cd_imovel], [ds_imovel], [tipo_imovel], [area_construida], [area_total], [cd_endereco]) VALUES
(1, 'Casa na praia', 'Residencial', 150.5, 300.75, 1),
(2, 'Apartamento no centro', 'Residencial', 80.25, 100.5, 2),
(3, 'Escritório comercial', 'Comercial', 200.0, 200.0, 3);

INSERT INTO [Dados_bancarios] ([cd_dadosbancarios], [banco_locatario], [agencia_locatario], [conta_locatario]) VALUES
(1, 'Banco A', 1234, 56789),
(2, 'Banco B', 4321, 98765),
(3, 'Banco C', 2468, 13579);

INSERT INTO [imobiliaria] ([cd_imobiliaria], [nome_locadora], [cnpj], [email]) VALUES
(1, 'Imobiliária X', '12345678901234', 'contato@imobiliariax.com'),
(2, 'Imobiliária Y', '56789012345678', 'contato@imobiliariay.com');

INSERT INTO [Contrato] ([cd_contrato], [valor], [data_inicio], [data_fim], [status_contrato], [cd_locador], [cd_locatario], [cd_imovel]) VALUES
(1, 1500, '2023-01-01', '2023-12-31', 'A', 1, 2, 1),
(2, 2000, '2023-02-01', '2023-07-31', 'A', 3, 2, 2),
(3, 3000, '2023-03-01', '2023-06-30', 'A', 2, 1, 3);

INSERT INTO [Pagamento] ([cd_pagamento], [valor_pago], [data_pagamento], [valor_trasferido], [data_vencimento], [email], [status_pagamento]) VALUES
(1, 1000.0, '2023-01-05', 1000.0, '2023-01-10', 'joao@email.com', 'P'),
(2, 1500.0, '2023-02-05', 1500.0, '2023-02-10', 'maria@email.com', 'P'),
(3, 2000.0, '2023-03-05', 2000.0, '2023-03-10', 'pedro@email.com', 'P');