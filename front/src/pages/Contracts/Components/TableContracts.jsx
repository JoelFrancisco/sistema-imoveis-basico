import {
  TableContainer,
  Table,
  TableCaption,
  Thead,
  Tr,
  Th,
  Tbody,
  Td,
  Tfoot,
} from "@chakra-ui/react";

export function TableContracts() {
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
            Contratos - Ativos e Inativos
          </TableCaption>
          <Thead>
            <Tr>
              <Th padding="1.25rem" textAlign="center">
                sts contrato
              </Th>
              <Th textAlign="center">nome locador</Th>
              <Th textAlign="center">dados locador</Th>
              <Th textAlign="center">nome locatario</Th>
              <Th textAlign="center">dados locatario</Th>
              <Th textAlign="center">dados imovel</Th>
              <Th textAlign="center">inicio/fim</Th>
              <Th textAlign="center">valor R$</Th>
            </Tr>
          </Thead>
          <Tbody>
            <Tr>
              <Td padding="1rem" textAlign="center">
                ativo
              </Td>
              <Td textAlign="center">Lucas Zanoni</Td>
              <Td textAlign="center">555.888.484-99</Td>
              <Td textAlign="center">Nicolas Loffi Kaminski</Td>
              <Td textAlign="center">555.888.484-99</Td>
              <Td textAlign="center">Apto. 102, Bl. 03</Td>
              <Td textAlign="center">12/04/2022 - 02/07/2023</Td>
              <Td textAlign="center">R$ 232,20</Td>
            </Tr>
            <Tr>
              <Td padding="1rem" textAlign="center">
                ativo
              </Td>
              <Td textAlign="center">Lucas Zanoni</Td>
              <Td textAlign="center">555.888.484-99</Td>
              <Td textAlign="center">Nicolas Loffi Kaminski</Td>
              <Td textAlign="center">555.888.484-99</Td>
              <Td textAlign="center">Apto. 508</Td>
              <Td textAlign="center">12/04/2022 - 02/07/2023</Td>
              <Td textAlign="center">R$ 232,20</Td>
            </Tr>
            <Tr>
              <Td padding="1rem" textAlign="center">
                ativo
              </Td>
              <Td textAlign="center">Lucas Zanoni</Td>
              <Td textAlign="center">555.888.484-99</Td>
              <Td textAlign="center">Nicolas Loffi Kaminski</Td>
              <Td textAlign="center">555.888.484-99</Td>
              <Td textAlign="center">Nº 64</Td>
              <Td textAlign="center">12/04/2022 - 02/07/2023</Td>
              <Td textAlign="center">R$ 232,20</Td>
            </Tr>
          </Tbody>
          <Tfoot>
            <Tr>
              <Th padding="1.25rem" textAlign="center">
                sts contrato
              </Th>
              <Th textAlign="center">nome locador</Th>
              <Th textAlign="center">dados locador</Th>
              <Th textAlign="center">nome locatario</Th>
              <Th textAlign="center">dados locatario</Th>
              <Th textAlign="center">dados imovel</Th>
              <Th textAlign="center">inicio/fim</Th>
              <Th textAlign="center">valor R$</Th>
            </Tr>
          </Tfoot>
        </Table>
      </TableContainer>
    </>
  );
}
