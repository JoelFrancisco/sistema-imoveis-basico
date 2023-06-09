import { NavLink } from "react-router-dom";

import Logo from "../../public/logo.svg";
// import { Flex } from "@chakra-ui/react";

export function Header() {
  return (
    <>
      {/* <Flex as="header">Ola!</Flex> */}
      <header className="bg-emerald-300 w-full flex p-4 items-center rounded-b-lg">
        <img src={Logo} alt="Logo do site" className="w-14 h-14" />
        <nav className="flex flex-1 items-center justify-center gap-32 p-2">
          <NavLink to="/" className="p-2">
            Pricipal
          </NavLink>
          <NavLink to="/relatorios" className="p-2">
            Relatorios
          </NavLink>
          <NavLink to="/contratos" className="p-2">
            Contratos
          </NavLink>
        </nav>
      </header>
    </>
  );
}
