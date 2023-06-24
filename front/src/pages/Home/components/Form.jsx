import {
  FormControl,
  FormLabel,
  Stack,
  InputGroup,
  Input,
  InputLeftAddon,
  Flex,
  Text,
  Divider,
  Select,
  Button,
  Textarea,
} from "@chakra-ui/react";

export function Form() {
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
          <FormLabel textAlign="center">Nome:</FormLabel>
          <Input
            id="locator_name"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="20rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel textAlign="center">Telefone:</FormLabel>
          <InputGroup>
            <InputLeftAddon children="(48)" />
            <Input
              id="locator_phone"
              type="tel"
              size="md"
              variant="outline"
              borderRadius="16"
              width="16rem"
            />
          </InputGroup>
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Data de nascimento:</FormLabel>
          <Input
            id="locator_birth"
            type="date"
            size="md"
            variant="filled"
            borderRadius="16"
            width="12rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>CPF:</FormLabel>
          <Input
            id="locator_cpf"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="15rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel textAlign="center">Nome imobiliaria:</FormLabel>
          <Input
            id="rent_state"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="16rem"
          />
        </Flex>
      </Stack>
      <Divider />
      <Text>Informe os dados do locatario:</Text>
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
          <FormLabel textAlign="center">Nome:</FormLabel>
          <Input
            id="renter_name"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="20rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel textAlign="center">Telefone:</FormLabel>
          <InputGroup>
            <InputLeftAddon children="(48)" />
            <Input
              id="renter_phone"
              type="tel"
              size="md"
              variant="outline"
              borderRadius="16"
              width="16rem"
            />
          </InputGroup>
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Data de nascimento:</FormLabel>
          <Input
            id="renter_birth"
            type="date"
            size="md"
            variant="filled"
            borderRadius="16"
            width="12rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>CPF:</FormLabel>
          <Input
            id="renter_cpf"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="15rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Banco:</FormLabel>
          <Input
            id="renter_bank"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="10rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Conta:</FormLabel>
          <Input
            id="renter_account"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="9rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Agencia:</FormLabel>
          <Input
            id="renter_agency"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="8.75rem"
          />
        </Flex>
      </Stack>
      <Divider />
      <Text>Informe os dados do imovel:</Text>
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
        <Flex>
          <FormLabel>Descricao:</FormLabel>
          <Textarea id="set_desc" w="46rem" size="md" />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Tipo:</FormLabel>
          <Select
            id="set_type"
            type="date"
            size="md"
            variant="filled"
            borderRadius="16"
            width="15rem"
          >
            <option value="option1">Condominio</option>
            <option value="option2">Edificio</option>
            <option value="option3">Casa</option>
          </Select>
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Bloco:</FormLabel>
          <Input
            id="set_block"
            type="text"
            size="md"
            variant="filled"
            borderRadius="16"
            width="6rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Nº:</FormLabel>
          <Input
            id="set_number"
            type="number"
            size="md"
            variant="filled"
            borderRadius="16"
            width="6rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Area total(m²):</FormLabel>
          <Input
            id="set_area_total"
            type="number"
            size="md"
            variant="filled"
            borderRadius="16"
            width="6.5rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Area construida(m²):</FormLabel>
          <Input
            id="set_area_building"
            type="number"
            size="md"
            variant="filled"
            borderRadius="16"
            width="6.5rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Valor total(R$):</FormLabel>
          <Input
            id="set_value_total"
            type="number"
            size="md"
            variant="filled"
            borderRadius="16"
            width="6.5rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Data de inicio:</FormLabel>
          <Input
            type="date"
            size="md"
            variant="filled"
            borderRadius="16"
            width="10rem"
          />
        </Flex>
        <Flex alignItems="center">
          <FormLabel>Data do fim:</FormLabel>
          <Input
            type="date"
            size="md"
            variant="filled"
            borderRadius="16"
            width="10rem"
          />
        </Flex>
        <Flex alignItems="center" gap="0.625rem">
          <Button variant="solid" size="md" colorScheme="green">
            Enviar
          </Button>
          <Button variant="solid" size="md" colorScheme="red">
            Cancelar
          </Button>
        </Flex>
      </Stack>
    </FormControl>
  );
}
