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

export function RentStateTable() {
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
            Relatorio - Ranking Imobiliarias
          </TableCaption>
          <Thead>
            <Tr>
              <Th padding="1.25rem" textAlign="center">
                nome imobiliaria
              </Th>
              <Th textAlign="center">imoveis locados</Th>
              <Th textAlign="center">total contratos</Th>
              <Th textAlign="center">total contratos abertos</Th>
              <Th textAlign="center">contratos vencidos</Th>
              <Th textAlign="center">total dividas</Th>
            </Tr>
          </Thead>
          <Tbody>
            <Tr>
              <Td padding="1rem" textAlign="center">
                Imobiliária Prime
              </Td>
              <Td textAlign="center">5</Td>
              <Td textAlign="center">5</Td>
              <Td textAlign="center">2</Td>
              <Td textAlign="center">3</Td>
              <Td textAlign="center">R$ 20.000,00</Td>
            </Tr>
            <Tr>
              <Td padding="1rem" textAlign="center">
                Nova Era Imobiliária
              </Td>
              <Td textAlign="center">5</Td>
              <Td textAlign="center">5</Td>
              <Td textAlign="center">2</Td>
              <Td textAlign="center">1</Td>
              <Td textAlign="center">R$ 10.000,00</Td>
            </Tr>
            <Tr>
              <Td padding="1rem" textAlign="center">
                Casa & Lar Imóveis
              </Td>
              <Td textAlign="center">5</Td>
              <Td textAlign="center">5</Td>
              <Td textAlign="center">2</Td>
              <Td textAlign="center">1</Td>
              <Td textAlign="center">R$ 6.000,00</Td>
            </Tr>
          </Tbody>
          <Tfoot>
            <Tr>
              <Th padding="1.25rem" textAlign="center">
                nome imobiliaria
              </Th>
              <Th textAlign="center">imoveis locados</Th>
              <Th textAlign="center">total contratos</Th>
              <Th textAlign="center">total contratos abertos</Th>
              <Th textAlign="center">contratos vencidos</Th>
              <Th textAlign="center">total dividas</Th>
            </Tr>
          </Tfoot>
        </Table>
      </TableContainer>
    </>
  );
}
