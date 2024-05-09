import { Box, Button, Center, Flex, Text } from "@chakra-ui/react";
import { FC } from "react";
import { useNavigate } from "react-router-dom";

export const NoPermission: FC = () => {
  const navigate = useNavigate();
  return (
    <Center h="100vh">
      <Box>
        <Text fontSize={"2xl"} fontWeight={"bold"}>
          Nincs hozzáférési jogod!
        </Text>
        <Button border={"solid 1px"} onClick={() => navigate("/")}>Vissza a Főoldalra</Button>
      </Box>
    </Center>
  );
};
