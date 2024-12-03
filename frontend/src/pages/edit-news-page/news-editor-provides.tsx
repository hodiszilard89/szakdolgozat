import React, { FC } from "react";
import { useSelector } from "react-redux";
import { selectEditor } from "../../store/slices/editor-slice";
import NewsEditor from "./news-editor";
import { newsFactory } from "../../utils/news_factory";
import { Box,  Text } from "@chakra-ui/react";

import {

  selectOnlineUser,
} from "../../store/slices/auth-user-slice";
import { Error } from "../Error";


export const NewsEditorProvider: FC = () => {
  const { news } = useSelector(selectEditor);
  const user = useSelector(selectOnlineUser);
  return (
    <>
      {user?.roles?.find((role) => 
        (role.title === "ADMIN" || role.title === "WRITER")
      ) ? (
        <Box width={"80%"} margin={"auto"}>
        
          {news && <NewsEditor news={newsFactory(news)} />}
        
        </Box>
      ) : 
       <Error msg="Nincs hozzáfárási jogod"/>
      }
    </>
  );
};
