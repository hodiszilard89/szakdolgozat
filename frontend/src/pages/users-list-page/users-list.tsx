import { FC, useCallback, useEffect, useState } from "react";
import { Link } from "react-router-dom";
import {
  ViewIcon,
  SettingsIcon,
  NotAllowedIcon,
  CheckIcon,
} from "@chakra-ui/icons";
import {
  Icon,
  Box,
  Button,
  TableContainer,
  Thead,
  Tr,
  Th,
  Table,
  Tbody,
  Td,
  Image,
} from "@chakra-ui/react";

import { setEditUser } from "../../store/slices/users-slice";
import { useGetUsers } from "../../store/hooks/use-get-users";
import { useUserChancages } from "../../store/hooks/use-user-chancages";

import { useDispatch, useSelector } from "react-redux";
import { User } from "../../models/user";
import { Navbar } from "../../componens/navbar";
import { authUserSlice, selectOnlineUser } from "../../store/slices/auth-user-slice";
import { Footer } from "../../componens/footer";

export const UsersList: FC = () => {
  const dispatch = useDispatch();
  
  const ICON_SIZE = 25;
 
  const users = useGetUsers();
  const [data, setData] = useState<User[]>();
  
  useEffect(() => {
    users && setData(users);
  }, [users]);
  return (
  
    <Box width={"80%"} margin={"auto"}>
      <TableContainer>
        <Table variant="simple" colorScheme="cian">
          <Thead>
            <Tr>
              <Th></Th>
              <Th textAlign={"center"}>Chatnév</Th>
              <Th textAlign={"center"}>ID</Th>
              <Th textAlign={"center"}>Veztéknév</Th>
              <Th textAlign={"center"}>Keresztnév</Th>
              <Th textAlign={"center"}>Email</Th>
              <Th textAlign={"center"}>Szerkesztés / Engedélyezett</Th>
            </Tr>
          </Thead>
          <Tbody>
            {data &&
              data.map((user, id) => {
                return (
                  <Tr key={id}>
                    <Td textAlign={"center"}>
                      <Image
                        textAlign={"center"}
                        style={{ width: 75, height: 75 }}
                        src={`http://localhost:8080/${user.imagePath}`}
                        borderRadius={"full"}
                      ></Image>
                    </Td>
                    <Td textAlign={"center"}>{user.chatName}</Td>
                    <Td textAlign={"center"}>{user.id}</Td>
                    <Td textAlign={"center"}>{user.firstName}</Td>
                    <Td textAlign={"center"}>{user.secName}</Td>
                    <Td textAlign={"center"}>{user.email}</Td>
                    <Td textAlign={"center"}>
                      <Link to={`/user`}>
                        <Icon
                          onClick={() => {
                            dispatch(setEditUser(user));
                          }}
                          fontSize={ICON_SIZE}
                          style={{ margin: "0 20px" }}
                          _hover={{ cursor: "pointer" }}
                          as={ViewIcon}
                        ></Icon>
                      </Link>
                      <Icon
                        fontSize={ICON_SIZE}
                        style={{ margin: "0 20px" }}
                        _hover={{ cursor: "pointer" }}
                        as={user.locked ? NotAllowedIcon : CheckIcon}
                      ></Icon>
                    </Td>
                  </Tr>
                );
              })}
          </Tbody>
        </Table>
      </TableContainer>
      <Button mt={"5"} size={"md"} as={Link} to="/">
      
        Főoldal
      </Button>
    </Box>
  );
};
