import { NavLink } from "react-router-dom";

import Logo from "../../public/logo.svg";
import { Flex } from "@chakra-ui/react";

export function Header() {
  const navLinkClassName = "p-2 text-xl font-semibold";

  return (
    <>
      <Flex
        as="header"
        bgColor="#68D391"
        w="100%"
        padding="1rem"
        borderBottomRightRadius="8"
        borderBottomLeftRadius="8"
      >
        <img src={Logo} alt="Logo do site" className="w-14 h-14" />
        <nav className="flex flex-1 items-center justify-center gap-32 p-2">
          <NavLink
            to="/"
            className={({ isActive }) =>
              `${navLinkClassName} ${isActive ? "text-blue-700 underline" : ""}`
            }
            end
          >
            Principal
          </NavLink>
          <NavLink
            to="/relatorios"
            className={({ isActive }) =>
              `${navLinkClassName} ${isActive ? "text-blue-700 underline" : ""}`
            }
            end
          >
            Relatorios
          </NavLink>
          <NavLink
            to="/contratos"
            className={({ isActive }) =>
              `${navLinkClassName} ${isActive ? "text-blue-700 underline" : ""}`
            }
            end
          >
            Contratos
          </NavLink>
        </nav>
      </Flex>
    </>
  );
}
