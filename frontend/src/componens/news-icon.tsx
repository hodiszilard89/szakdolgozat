import {
  Box,
  Button,
  Flex,
  Icon,
  useBreakpointValue,
  useColorModeValue,
  Link
} from "@chakra-ui/react";
import { FC, useCallback, useEffect, useMemo, useState } from "react";
import {  NavLink, useNavigate } from "react-router-dom";
import { setSearchText } from "../store/slices/search-slice";
import { setSide, setNewsTypeId } from "../store/slices/news-slice";
import { FaNewspaper } from "react-icons/fa";
import { useDispatch, useSelector } from "react-redux";
export const NewsIcon: FC<{onClick:()=>void}> = ({onClick}) => {
  const dispach = useDispatch();

  return (
    <Box

      display={"flex"}
      textAlign={useBreakpointValue({ base: "center", md: "left" })}
      fontFamily={"heading"}
      color={useColorModeValue("gray.800", "white")}
    >
      <Link
        //to={"/"}
        onClick={() => {
          onClick();
          dispach(setSide(0));
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
