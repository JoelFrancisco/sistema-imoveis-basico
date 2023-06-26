import { Button, ButtonGroup, FormControl, Flex } from "@chakra-ui/react";
import { useState } from "react";
import { ExpensesTable } from "./ExpensesTable";
import { RentStateTable } from "./RentStateTable";
// import { api } from "../../../services/index";

export function TablesReports() {
  const [rankingType, setRankingType] = useState("");

  return (
    <>
      <FormControl
        as="form"
        display="flex"
        alignItems="center"
        justifyContent="center"
        padding="0.75rem"
      >
        <ButtonGroup>
          <Button
            onClick={() => {
              setRankingType("RentState");
            }}
          >
            Ranking imobiliaria
          </Button>
          <Button
            onClick={() => {
              setRankingType("Expenses");
            }}
          >
            Ranking despesas
          </Button>
        </ButtonGroup>
      </FormControl>
      <Flex as="section" direction="column" mt="1rem">
        {rankingType === "RentState" ? (
          <RentStateTable />
        ) : rankingType === "Expenses" ? (
          <ExpensesTable />
        ) : (
          <p>Selecione o tipo de relatorio que deseja!</p>
        )}
      </Flex>
    </>
  );
}
