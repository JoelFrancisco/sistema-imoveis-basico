import {
  Table,
  Thead,
  Tbody,
  Tfoot,
  Tr,
  Th,
  Td,
  TableCaption,
  TableContainer,
} from "@chakra-ui/react";

export function ExpensesTable() {
  return (
    <>
      <TableContainer>
        <Table
          variant="simple"
          size="sm"
          bgColor="lightgray"
          borderRadius="10"
          fontFamily="verdana"
        >
          <TableCaption fontSize="1.125rem">
            Relatorio - Ranking despesas
          </TableCaption>
          <Thead>
            <Tr>
              <Th padding="1.25rem" textAlign="center">
                nome imobiliaria
              </Th>
              <Th textAlign="center">dados imoveis</Th>
              <Th textAlign="center">nome/cpf locador</Th>
              <Th textAlign="center">nome/cpf locatario</Th>
              <Th textAlign="center">data inicio/data fim</Th>
              <Th textAlign="center">parcelas vencidas</Th>
              <Th textAlign="center">total dividas</Th>
            </Tr>
          </Thead>
          <Tbody>
            <Tr>
              <Td padding="1rem" textAlign="center" fontSize="0.75rem">
                Imobiliária Prime
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Apto. 102, Bl. 03
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Lucas Zanoni/555.888.484-99
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Nicolas Loffi Kaminski/555.888.484-99
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                12/04/2022 - 02/07/2023
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                7
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                R$ 5.000,00
              </Td>
            </Tr>
            <Tr>
              <Td padding="1rem" textAlign="center" fontSize="0.75rem">
                Imobiliária Prime
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Apto. 102, Bl. 03
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Lucas Zanoni/555.888.484-99
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Nicolas Loffi Kaminski/555.888.484-99
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                12/04/2022 - 02/07/2023
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                2
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                R$ 4.200,00
              </Td>
            </Tr>
            <Tr>
              <Td padding="1rem" textAlign="center" fontSize="0.75rem">
                Casa & Lar Imóveis
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Apto. 102, Bl. 03
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Lucas Zanoni/555.888.484-99
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                Nicolas Loffi Kaminski/555.888.484-99
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                12/04/2022 - 02/07/2023
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                4
              </Td>
              <Td textAlign="center" fontSize="0.75rem">
                R$ 2.100,00
              </Td>
            </Tr>
          </Tbody>
          <Tfoot>
            <Tr>
              <Th padding="1.25rem" textAlign="center" fontSize="0.75rem">
                nome imobiliaria
              </Th>
              <Th textAlign="center" fontSize="0.75rem">
                dados imoveis
              </Th>
              <Th textAlign="center" fontSize="0.75rem">
                nome/cpf locador
              </Th>
              <Th textAlign="center" fontSize="0.75rem">
                nome/cpf locatario
              </Th>
              <Th textAlign="center" fontSize="0.75rem">
                data inicio/data fim
              </Th>
              <Th textAlign="center" fontSize="0.75rem">
                parcelas vencidas
              </Th>
              <Th textAlign="center" fontSize="0.75rem">
                total dividas
              </Th>
            </Tr>
          </Tfoot>
        </Table>
      </TableContainer>
    </>
  );
}
