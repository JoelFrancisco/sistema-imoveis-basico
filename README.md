# sistema-imoveis-basico
Trabalho da disciplina de Banco de Dados II


### :writing_hand: Integrantes:

- Arthur de Mello Vieira - [Arthur689347350](https://github.com/Arthur689347350)
- João Victor Miotelli Vitali - [JoaoMiotelli](https://github.com/JoaoMiotelli)
- Joel Francisco da Silva Filho - [JoelFrancisco](https://github.com/JoelFrancisco)
- Lucas de Castro Zanoni (brabo) - [Castrozan](https://github.com/Castrozan)
- Lucas de Oliveira Alano - [LucasAlano](https://github.com/LucasAlano)
- Lucas Sernajoto Vanzeler Paixão - [Lucaspaixao-code](https://github.com/Lucaspaixao-code)
- Nicolas Loffi Kaminski - [NicolasLK](https://github.com/NicolasLK)
- Vinícius Pedroso Milanez - [viniciusmilanez](https://github.com/viniciusmilanez)

## Regras Sistema

Links:

Modelo físico: https://dbdiagram.io/d/647fb5d3722eb7749483ccbc

## Descrição

A aplicação é um sistema de locação de imoveis (Saas) para locadoras. 

## Arquitetura

Backend (APIs) em python;
Banco Sqlite;
Front em React.

## Relatórios

Relatório de imóveis locados por região;
Relatório de pagamento por locatário;
Qntde de imoveis locados por lpcsatario;

#### Outros relatórios possíveis

1 - Valor dos imoveis locados;
2 - Locatarios inadimplentes;
3 - Valor inadimplentes;

##### Principal
1 - Ranking de imobiliarias:  imoveis locados e por dividas

Param data_inicio e data_fim - relacionadas ao pagamento/vencimentos

nome_imobiliária;
qtde_imoveis_licados;
Valor_total_locacao;
Qtde_imoveis_locacao_aberto;
Valor_total_locacao_aberto.

Trazer o valor total da divida.

## Telas

### Cadastro de imóveis

A imobiliária pode cadastrar imóveis de locatários no sistema, para fazer anúncios.

### Cadastro de pessoas

A Imobiliária deve poder cadastrar as pessoas que serão dispostas no sistema. A especialização de locador e locatário serão feitas pelo contrato.

**campos:** 
- nome_pessoa
- telefone
- data_nascimento
- email

### Cadastro de anúncios 

Nessa tela o locatário pode cadastrar sua casa há uma imobiliária, para que possa ser anunciada para aluguel.

**Dados da tabela:**

### Cadastro de contrato

Descreve o contrato de imóvel, pode ser filtrado com base nos campos da tabela.

Deve ser possível atualizar os valores do contrato.

Deve ser possível deletar o contrato, para retificação ou encerramento - Validar chave da tabela de pagamento para não deixar a exclusão.

### Tela de escolha de relatório

Deve ser possível escolher qual relatório emitir entre os 3 dois disponíveis.

Relatório de imóveis locados por região e pagamentos por locatário.

### Consulta de dados

Consulta de dados de contrato;
Consulta de dados do locador e locatário;


Tabela de corretor ->
