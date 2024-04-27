import { FC, useEffect, useRef, useState } from "react";
import { Box, Link } from "@chakra-ui/react";
import { FaThumbsUp } from "react-icons/fa";
//import { Link } from "react-router-dom";
import { News } from "../models/news";
import { User } from "../models/user";
import { Like } from "../models/like";
import { useCallback } from "react";
import { newsFactory, serializNews } from "../utils/news_factory";
import {
  useCreateLikeMutation,
  useGetOneNewsQuery,
} from "../store/news/news-api";
import { selectNews, updateNewsItem } from "../store/news/news-slice";
import { useDispatch, useSelector } from "react-redux";
import {
  selectAuthUser,
  selectOnlineUser,
} from "../store/news/auth-user-slice";
export interface LikeButtonProps {
  id: number;
}

export const LikeButton: FC<{ id: number; onLineUser: User | undefined }> = ({
  id,
  onLineUser,
}) => {
  // const userFromState=useSelector(selectOnlineUser);
  const [user, setUser] = useState<User | undefined>(onLineUser);

  //news elkétem a hírt  a központi stateből    -------------   updateNewsItemmel tudom frissíteni
  const newsFromState = newsFactory(useSelector(selectNews)[id]);
  const [news, setNews] = useState<News>(newsFromState);
  const [addLike] = useCreateLikeMutation();
  useEffect(()=>{setUser(onLineUser)},[onLineUser])
  
  const userDidLike = useCallback(
    (news: News, user: User) => {
      setNews({
        ...news,
        likes: news.likes?.find((item) => item.id === user?.id)
          ? news.likes.filter((item) => item.id !== user?.id)
          : news.likes?.concat(user),
      });
      user &&
        setUser({
          ...user,
          likednews: user?.likednews?.find((item) => item.id === news.id)
            ? user.likednews.filter((item) => item.id !== news.id)
            : user.likednews.concat(news),
        });

      addLike({ user: user, news: serializNews(news) } as Like);
    },
    []
  );

  return (
    <Box display={"inline-flex"}>
      <Link>
        <FaThumbsUp
          className="me-2 fs-5 "
          style={
            news?.likes?.find((item) => item.id === user?.id)
              ? { color: "blue" }
              : { color: "gray" }
          }
          onClick={() => {
            user ? userDidLike(news, user) : window.alert("jelentkezz be!");
          }}
        />
      </Link>
      {news.likes?.length}
    </Box>
  );
};
