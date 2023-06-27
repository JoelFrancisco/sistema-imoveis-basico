from pydantic import BaseModel


class RelatorioSchemaBase(BaseModel):
    cd_imobiliaria: str
    title: str
    nome: str
    Quantidade_Imoveis_Locados: int
    Quantidade_Total_Locacao: int
    Quantidade_Imoveis_Em_Aberto: int
    Valor_Total_Locacao_Em_Aberto: int
    Valor_Total_Divida: int
