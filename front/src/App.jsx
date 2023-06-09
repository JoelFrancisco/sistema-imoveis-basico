import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { ChakraProvider } from "@chakra-ui/react";

import Layout from "./layouts/Layouts";
import Home from "./pages/Home";
import Reports from "./pages/Reports";
import Contracts from "./pages/Contracts";

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
