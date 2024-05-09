import { FC, useCallback, useState  } from "react";

import {
  Card,
  Box,
  CardBody,
  CardHeader,
  Image,
  Text,
  Flex,
  Link as ChakraLink,
} from "@chakra-ui/react";

import { Link } from "react-router-dom";

import { News } from "../models/news";
import { useDispatch, useSelector } from "react-redux";
import { setNews as setNewsEditSlice } from "../store/news/editor-slice";
import { newsFactory, serializNews } from "../utils/news_factory";
import { NewsItemMenu } from "./news-item-menu";
import { selectAuthUser } from "../store/news/auth-user-slice";

import { LikeButton } from "./like-button";
import { selectNews } from "../store/news/news-slice";
import { User } from "../models/user";

export interface NewsListItemProps {
  news: News;
  stateId: number;
}

export const NewsListItem: FC<NewsListItemProps> = ({
  news,
  //id?
  stateId,
}) => {
  const dispach = useDispatch();
  const userInState = useSelector(selectAuthUser).user;

  const onClick = useCallback(() => {
    dispach(setNewsEditSlice(serializNews(news)));
  }, [news, dispach]);

  return (
    <Card padding={0}>
      
       {(userInState?.roles?.find(role=>(role.title==="ADMIN") ))?
       <NewsItemMenu stateId={stateId} placement="bottom-end" news={news} />
        :""} 
      <CardBody margin={0} paddingTop={0}>
        <Link to={`/news`} onClick={onClick}>
          <CardHeader padding={0}>
            <Text fontSize={"2xl"} fontWeight={"bold"}>
              {news.title}
            </Text>
          </CardHeader>

          {news.imgPath && (
            <Image
              src={news.imgPath}
              onClick={onClick}
              style={{ width: "100%", height: "150px" }}
            />
          )}

          <Text>
            {news?.subtitle ? news.subtitle.substring(0, 25) + "..." : ""}
          </Text>
        </Link>

        <Flex justifyItems="center" justify="space-between" margin={0}>
          <LikeButton id={stateId}  onLineUser={userInState} newsProp = {news}/>
          <Text>szerző: {news.writer?.chatName}</Text>
        </Flex>
      </CardBody>
    </Card>
  );
};
