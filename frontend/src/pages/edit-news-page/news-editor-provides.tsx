import React, { FC } from "react";
import { useSelector } from "react-redux";
import { selectEditor } from "../../store/news/editor-slice";
import NewsEditor from "./news-editor";
import { newsFactory } from "../../utils/news_factory";
import { Box,  Text } from "@chakra-ui/react";
import { Navbar } from "../../componens/navbar";
import { Footer } from "../../componens/footer";
import {

  selectOnlineUser,
} from "../../store/news/auth-user-slice";
import { NoPermission } from "../no-permission";


export const NewsEditorProvider: FC = () => {
  const { news } = useSelector(selectEditor);
  const user = useSelector(selectOnlineUser);
  return (
    <>
      {user?.roles?.find((role) => 
        (role.title === "ADMIN" || role.title === "WRITER")
      ) ? (
        <Box width={"80%"} margin={"auto"}>
          <Navbar />
          {news && <NewsEditor news={newsFactory(news)} />}
          <Footer />
        </Box>
      ) : 
       <NoPermission/>
      }
    </>
  );
};
