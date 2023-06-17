import {
  Flex,

} from "@chakra-ui/react";
import { TableContracts } from "./Components/TableContracts";

export default function Contracts() {
  return (
    <Flex as="main" padding="8" alignItems="center" justifyContent="center">
      <TableContracts />
      
    </Flex>
  );
}
