from pydantic import BaseModel

class PagamentoSchemaBase(BaseModel):
    cd_pagamento: int
    valor_pa: float
    data_pagamento: str
    valor_trasferido: float
    data_vencimento: str
    email: str
    status_pagamento: str
    cd_contrato: int

class PagamentoSchemaCreate(BaseModel):
    valor_pa: float
    data_pagamento: str
    valor_trasferido: float
    data_vencimento: str
    email: str
    status_pagamento: str
    cd_contrato: int