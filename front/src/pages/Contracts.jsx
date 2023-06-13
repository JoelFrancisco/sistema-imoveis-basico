import {
  Flex,
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

export default function Contracts() {
  return (
    <Flex as="main" padding="8" alignItems="center" justifyContent="center">
      <TableContainer bgColor="pink">
        <Table variant="simple" size="md">
          <TableCaption>Contratos - Ativos e Inativos</TableCaption>
          <Thead>
            <Tr>
              <Th>sts contrato</Th>
              <Th>nome locador</Th>
              <Th>dados locador</Th>
              <Th>nome locatario</Th>
              <Th>dados locatario</Th>
              <Th>dados imovel</Th>
              <Th>inicio/fim</Th>
              <Th>valor R$</Th>
            </Tr>
          </Thead>
          <Tbody>
            <Tr>
              <Td>ativo</Td>
              <Td>Lucas Zanoni</Td>
              <Td>555.888.484-99</Td>
              <Td>Nicolas Loffi Kaminski</Td>
              <Td>555.888.484-99</Td>
              <Td>Apto. 102, Bl. 03</Td>
              <Td>12/04/2022 - 02/07/2023</Td>
              <Td>R$ 232,20</Td>
            </Tr>
            <Tr>
              <Td>ativo</Td>
              <Td>Lucas Zanoni</Td>
              <Td>555.888.484-99</Td>
              <Td>Nicolas Loffi Kaminski</Td>
              <Td>555.888.484-99</Td>
              <Td>Apto. 508</Td>
              <Td>12/04/2022 - 02/07/2023</Td>
              <Td>R$ 232,20</Td>
            </Tr>
            <Tr>
              <Td>ativo</Td>
              <Td>Lucas Zanoni</Td>
              <Td>555.888.484-99</Td>
              <Td>Nicolas Loffi Kaminski</Td>
              <Td>555.888.484-99</Td>
              <Td>Nº 64</Td>
              <Td>12/04/2022 - 02/07/2023</Td>
              <Td>R$ 232,20</Td>
            </Tr>
          </Tbody>
          <Tfoot>
            <Tr>
              <Th>sts contrato</Th>
              <Th>nome locador</Th>
              <Th>dados locador</Th>
              <Th>nome locatario</Th>
              <Th>dados locatario</Th>
              <Th>dados imovel</Th>
              <Th>inicio/fim</Th>
              <Th>valor R$</Th>
            </Tr>
          </Tfoot>
        </Table>
      </TableContainer>
    </Flex>
  );
}
