//Ranking de imobiliarias: imoveis locados e por dividas

// Param data_inicio e data_fim - relacionadas ao pagamento/vencimentos

import {
  Flex,
  Button,
  ButtonGroup,
  FormControl,
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

export default function Reports() {
  return (
    <Flex
      as="main"
      flexDirection="column"
      padding="8"
      justifyContent="center"
      alignItems="center"
      gap="1rem"
    >
      <FormControl
        as="form"
        display="flex"
        alignItems="center"
        justifyContent="center"
      >
        <ButtonGroup>
          <Button>Ranking imobiliaria</Button>
          <Button>Ranking dividendos</Button>
        </ButtonGroup>
      </FormControl>
      <TableContainer>
        <Table
          variant="simple"
          size="sm"
          bgColor="lightgray"
          borderRadius="10"
          fontFamily="verdana"
        >
          <TableCaption>Relatorio - Ranking Imobiliarias</TableCaption>
          <Thead>
            <Tr>
              <Th>nome imobiliaria</Th>
              <Th>imoveis locados</Th>
              <Th>total contratos</Th>
              <Th>total contratos abertos</Th>
              {/* <Th>data inicio</Th>
              <Th>data fim</Th> */}
              <Th>contratos vencidos</Th>
              <Th>total dividendos</Th>
            </Tr>
          </Thead>
          <Tbody>
            <Tr>
              <Td>Imobiliária Prime</Td>
              <Td>5</Td>
              <Td>5</Td>
              <Td>2</Td>
              {/* <Td>15/03/2022</Td>
              <Td>14/03/2023</Td> */}
              <Td>3</Td>
              <Td>20.000,00</Td>
            </Tr>
            <Tr>
              <Td>Nova Era Imobiliária</Td>
              <Td>5</Td>
              <Td>5</Td>
              <Td>2</Td>
              {/* <Td>10/09/2022</Td>
              <Td>14/03/2023</Td> */}
              <Td>1</Td>
              <Td>10.000,00</Td>
            </Tr>
            <Tr>
              <Td>Casa & Lar Imóveis</Td>
              <Td>5</Td>
              <Td>5</Td>
              <Td>2</Td>
              {/* <Td>10/09/2022</Td>
              <Td>31/12/2022</Td> */}
              <Td>1</Td>
              <Td>6.000,00</Td>
            </Tr>
          </Tbody>
          <Tfoot>
            <Tr>
              <Th>nome imobiliaria</Th>
              <Th>imoveis locados</Th>
              <Th>total contratos</Th>
              <Th>total contratos abertos</Th>
              {/* <Th>data inicio</Th>
              <Th>data fim</Th> */}
              <Th>contratos vencidos</Th>
              <Th>total dividendos</Th>
            </Tr>
          </Tfoot>
        </Table>
      </TableContainer>
    </Flex>
  );
}
