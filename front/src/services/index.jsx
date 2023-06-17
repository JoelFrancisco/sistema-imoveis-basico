import axios from "axios";

export const api = axios.create({
  baseURL:
    "https://mock-db2-joelfrancisco.vercel.app/relatorio?data_inicio=2020-12-15T07:57:25.277303&data_fim=2020-12-15T07:57:25.277303",
  timeout: 30000,
});
