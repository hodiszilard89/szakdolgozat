import { Box, Button, Center, Flex, Text } from "@chakra-ui/react";
import { FC } from "react";
import { useNavigate } from "react-router-dom";

export const Error: FC<{msg:string}> = ({msg}) => {
  const navigate = useNavigate();
  return (
    <Center h="100vh">
      <Box>
        <Text fontSize={"2xl"} fontWeight={"bold"}>
          {msg}
        </Text>
      
        <Button border={"solid 1px"} onClick={() => window.location.reload()}>Frissítés</Button>
      </Box>
    </Center>
  );
};
