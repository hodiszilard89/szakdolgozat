import {
  Box,
  Flex,
  Icon,
  useBreakpointValue,
  useColorModeValue,
} from "@chakra-ui/react";
import { FC } from "react";
import { Link } from "react-router-dom";
import { setSearchText } from "../store/news/search-slice";
import { setSide, setNewsTypeId } from "../store/news/news-slice";
import { FaNewspaper } from "react-icons/fa";
import { useDispatch, useSelector } from "react-redux";
export const NewsIcon: FC = () => {
  const dispach = useDispatch();

  return (
    <Box
      display={"flex"}
      textAlign={useBreakpointValue({ base: "center", md: "left" })}
      fontFamily={"heading"}
      color={useColorModeValue("gray.800", "white")}
    >
      <Link
      to={"/"}
        onClick={() => {
          dispach(setSide(0))
          dispach(setSearchText(undefined));
          dispach(setNewsTypeId(-1));
        }}
        
      >
        <Flex
          display={"flex"}
          fontSize={"2xl"}
          padding={2}
          alignItems={"center"}
        >
          <Icon as={FaNewspaper} marginRight={3} />
          FAKE NEWS
        </Flex>
      </Link>
    </Box>
  );
};
