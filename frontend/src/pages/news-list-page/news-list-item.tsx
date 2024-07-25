import { FC, useCallback, useState  } from "react";

import {
  Card,
  CardBody,
  CardHeader,
  Image,
  Text,
  Flex,
} from "@chakra-ui/react";

import { Link } from "react-router-dom";

import { News } from "../../models/news";
import { useDispatch, useSelector } from "react-redux";
import { setNews as setNewsEditSlice } from "../../store/slices/editor-slice";
import {  serializeNews } from "../../utils/news_factory";
import { NewsItemMenu } from "./news-item-menu";
import { selectAuthUser } from "../../store/slices/auth-user-slice";

import { LikeButton } from "../../componens/like-button";


export interface NewsListItemProps {
  news: News;
  stateId: number;
}

export const NewsListItem: FC<NewsListItemProps> = ({
  news,
  stateId,
}) => {
  const dispach = useDispatch();
  const userInState = useSelector(selectAuthUser).user;

  const onClick = useCallback(() => {
    dispach(setNewsEditSlice(serializeNews(news)));
  }, [news, dispach]);
  
  return (
    <Card padding={0}>
      
       {(userInState?.roles?.find(role=>(role.title==="ADMIN") ))?
       <NewsItemMenu stateId={stateId} placement="bottom-end" news={news} />
        :""} 
      <CardBody margin={0} paddingTop={0}>
        <Link to={`/news/${news.id}`} 
          onClick={onClick}>
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
