//Ranking de imobiliarias: imoveis locados e por dividas

// Param data_inicio e data_fim - relacionadas ao pagamento/vencimentos

import { Flex } from "@chakra-ui/react";
import { TablesReports } from "./components/TablesReports";

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
      <TablesReports />
    </Flex>
  );
}
