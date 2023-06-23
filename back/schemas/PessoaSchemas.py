from pydantic import BaseModel

class PessoaSchemaBase(BaseModel):
    cd_pessoa: int
    nome: str
    telefone: str
    dt_nascimento: str
    cpf: str

class PessoaSchemaCreate(BaseModel):
    nome: str
    telefone: str
    dt_nascimento: str
    cpf: str