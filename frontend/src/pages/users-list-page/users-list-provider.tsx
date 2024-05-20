import { FC } from "react";
import { UsersList } from "./users-list";
import { useSelector } from "react-redux";
import { selectOnlineUser } from "../../store/news/auth-user-slice";
import { Text } from "@chakra-ui/react";
import { Navbar } from "../../componens/navbar";
import { Footer } from "../../componens/footer";
import { Error } from "../Error";

export const UsersListProvider: FC = () => {
  const user = useSelector(selectOnlineUser);
  return user?.roles?.find(
    (role) => role.title === "ADMIN" || role.title === "WRITER"
  ) ? (
    <UsersList />
   
  ) : (
   <Error msg={"Nincs hozzáférési jogod"}/>
  );
};
