# sistema-imoveis-basico
Trabalho da disciplina de Banco de Dados II

### :writing_hand: Integrantes:

- Arthur de Mello Vieira - Git: Arthur689347350
- João Victor Miotelli Vitali - Git: JoaoMiotelli
- Joel Francisco da Silva Filho - Git: JoelFrancisco 
- Lucas de Castro Zanoni (brabo) - Git: Castrozan
- Lucas de Oliveira Alano - Git: LucasAlano
- Lucas Sernajoto Vanzeler Paixão - Git: Lucaspaixao-code
- Nicolas Loffi Kaminski - Git: NicolasLK
- Vinícius Pedroso Milanez - Git: viniciusmilanez

## Regras Sistema

Links:

Modelo físico: https://dbdiagram.io/d/647fb5d3722eb7749483ccbc

### Descrição

A aplicação é um sistema de locação de imoveis () para uma locadora. 

### Arquitetura

Backend (APIs) em python;
Banco Sqlite;
Front em React.

### Inclusão de locação

Na tela inicial haverá campos para cadastrar os dados do locatário, locador, imóvel, dados de pagamento e contrato. Com essas informações, o sistema irá realizar as inclusões no banco nas devidas tabelas.

### Consulta de dados

Consulta de dados de contrato;
Consulta de dados do locador e locatário;

### Relatórios

Relatório de imóveis locados por região;
Relatório de pagamento por locatário;

### Telas

#### Cadastro de pessoa

**campos:** 
- nome_pessoa
- telefone
- data_nascimento
- email

#### Get de contratos

Descreve todos os contratos do sistema, pode ser filtrado com base nos campos da tabela.

#### Tela de escolha de relatório

Deve ser possível escolher qual relatório emitir entre os 3 dois disponíveis.

Relatório de imóveis locados por região e pagamentos por locatário.

#### 

Especialiar para locador e locatário - Criar tabela pessoa

