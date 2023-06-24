import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { ChakraProvider } from "@chakra-ui/react";

import Layout from "./layouts/Layouts";
import Home from "./pages/Home/Home";
import Reports from "./pages/Reports/Reports";
import Contracts from "./pages/Contracts/Contracts";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <Home />,
      },
      {
        path: "/relatorios",
        element: <Reports />,
      },
      {
        path: "/contratos",
        element: <Contracts />,
      },
    ],
  },
]);

export function App() {
  return (
    <>
      <ChakraProvider>
        <RouterProvider router={router} />
      </ChakraProvider>
    </>
  );
}
