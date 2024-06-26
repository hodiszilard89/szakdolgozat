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

export interface NewsListItemProps {
  //news: News;
  stateId: number;
}

export const NewsListItem: FC<NewsListItemProps> = ({
  //news: fromState,
  stateId,
}) => {
  const dispach = useDispatch();

  const newsFromGlobal = newsFactory(useSelector(selectNews)[stateId]);
  const [news, setNews] = useState<News>(newsFromGlobal);
  const userInState = useSelector(selectAuthUser).user;

  const onClick = useCallback(() => {
    dispach(setNewsEditSlice(serializNews(news)));
  }, [news, dispach]);



  

  return (
    <Card padding={0}>
      
       {(userInState?.roles?.filter(item=>item.title==="ADMIN")) ?
       <NewsItemMenu stateId={stateId} placement="bottom-end" />:""}
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
            {news?.subtitle ? news.subtitle.substring(0, 40) + "..." : ""}
          </Text>
        </Link>

        <Flex justifyItems="center" justify="space-between" margin={0}>
          <LikeButton id={stateId}  onLineUser={userInState} />
          <Text>szerző: {news.writer?.chatName}</Text>
        </Flex>
      </CardBody>
    </Card>
  );
};
