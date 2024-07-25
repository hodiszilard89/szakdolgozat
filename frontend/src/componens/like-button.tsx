import { FC, useEffect, useState } from "react";
import { Box, Link } from "@chakra-ui/react";
import { FaThumbsUp } from "react-icons/fa";

import { News } from "../models/news";
import { User } from "../models/user";
import { Like } from "../models/like";
import { useCallback } from "react";
import { newsFactory, serializeNews } from "../utils/news_factory";
import { useCreateLikeMutation } from "../store/news-api";
export interface LikeButtonProps {
  id: number;
  newsProp: News;
  onLineUser: User | undefined;
}

export const LikeButton: FC<LikeButtonProps> = ({
  id,
  onLineUser,
  newsProp,
}) => {
  // const userFromState=useSelector(selectOnlineUser);
  const [user, setUser] = useState<User | undefined>(onLineUser);

  //news elkétem a hírt  a központi stateből    -------------   updateNewsItemmel tudom frissíteni
  //const newsFromState = newsFactory(useSelector(selectNews)[id]);
  const [news, setNews] = useState<News>(newsProp);
  const [addLike] = useCreateLikeMutation();
  useEffect(() => {
    setUser(onLineUser);
  }, [onLineUser]);

  const userDidLike = useCallback((news: News, user: User) => {
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

    addLike({ user: user, news: serializeNews(news) } as Like);
  }, []);

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
