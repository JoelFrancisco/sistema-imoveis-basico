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
  FormControl,
  FormLabel,
  Stack,
  Input,
  Flex,
  Text,
  Button
} from "@chakra-ui/react";

import { useState } from "react";

export function RentStateTable() {
  const [dataInicio, setDataInicio] = useState(new Date());
  const [dataFim, setDataFim] = useState(new Date());

  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  async function getData() {
    try {
      const API_URL = "http://localhost:8000"
      const response = await (await fetch(`${API_URL}/relatorios/ranking/imobiliarias?data_inicio=${dataInicio}&data_fim=${dataFim}`)).json();
      console.log(response)
      setData(response);
      setLoading(false);
    } catch(err) {
      setError(true);
    }
  }

  if (error) {
    return <>Erro ao buscar dados</>
  }

  if (data.length === 0) {
    return (
        <FormControl
          as="form"
          w="fit-content"
          p="0.75rem"
          display="flex"
          flexDirection="column"
          gap="4"
          borderRadius="8"
          borderStyle=""
          boxShadow="dark-lg"
        >
          <Text>Informe os dados do locador:</Text>
          <Stack
            as="section"
            spacing="2.625rem"
            maxW="52rem"
            padding="1"
            display="flex"
            flexDirection="row"
            flexWrap="wrap"
            alignItems="center"
          >
            <Flex alignItems="center">
              <FormLabel textAlign="center">Data início:</FormLabel>
              <Input
                id="data_inicio"
                type="datetime-local"
                size="md"
                variant="filled"
                borderRadius="16"
                width="12rem"
                value={dataInicio}
                onChange={(e) => {
                  setDataInicio(e.target.value)
                }}
              />
            </Flex>
            <Flex alignItems="center">
              <FormLabel>Data Fim:</FormLabel>
              <Input
                id="data_fim"
                type="datetime-local"
                size="md"
                variant="filled"
                borderRadius="16"
                width="12rem"
                value={dataFim}
                onChange={(e) => {
                  setDataFim(e.target.value)
                }}
              />
            </Flex>
          </Stack>
          <Flex alignItems="center" gap="0.625rem">
            <Button variant="solid" size="md" colorScheme="green" onClick={() => {
              getData()
            }}>
              Enviar
            </Button>
          </Flex>
        </FormControl>
    )
  } 

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
            {data.map((value) => <Tr>
                <Td padding="1rem" textAlign="center">
                  {value.nome}
                </Td>
                <Td textAlign="center">{value["Quantidade_Imoveis_locados"]}</Td>
                <Td textAlign="center">{value["Quantidade_Total_Locacao"]}</Td>
                <Td textAlign="center">{value["Quantidade_Imoveis_Em_Aberto"]}</Td>
                <Td textAlign="center">R${value["Valor_Total_Divida"]}</Td>
                <Td textAlign="center">R${value["Valor_Total_Locacao_Em_Aberto"]}</Td>
              </Tr>
            )}
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
