import { FC, useState, useEffect } from "react";
import { Box, Text, Image } from "@chakra-ui/react";
import { useMultiStyleConfig } from "@chakra-ui/react";
import { Comment } from "../../models/comment";
import { useDispatch } from "react-redux";
import { Link } from "react-router-dom";
import { setNewsTypeId } from "../../store/news/news-slice";

import { News } from "../../models/news";
export interface NewsDescProps {

  news: News;

}

export const NewsDescription: FC<NewsDescProps> = ({  news }) => {
  const dispatch = useDispatch();
  const style = useMultiStyleConfig("GenresLable", {});



  return (
    <Box margin={"auto"} w={"80%"}>
      <Box>
        <Box>
          <Image
            mb={"5"}
            style={{ width: "600px", height: "400px" }}
            src={news?.imgPath ? news?.imgPath : ""}
            borderRadius={"3"}
            className="mb-3"
          />
          <Box mb={"5"} maxWidth={"550px"}>
            {news?.types?.map((type, id) => {
              return (
                <Link to="/" key={id}>
                  <Text
                    sx={style.tag}
                    key={id}
                    onClick={() => dispatch(setNewsTypeId(type.id))}
                  >
                    #{type.title}
                  </Text>
                </Link>
              );
            })}
          </Box>
          <Text>Szerző: {news && news.writer?.chatName}</Text>
          <Text fontSize={"2xl"} fontWeight={"bold"}>
            {news?.title}
          </Text>
          <section style={{ fontSize: "18px" }}>{news?.text}</section>
        </Box>
      </Box>
    </Box>
  );
};
