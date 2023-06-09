import { Flex } from "@chakra-ui/react";
import { Form } from "../components/Form";

export default function Home() {
  return (
    <Flex as="main" padding="4" alignItems="center" justifyContent="center">
      <Form />
    </Flex>
  );
}
