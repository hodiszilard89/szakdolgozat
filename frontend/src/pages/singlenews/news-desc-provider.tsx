import { FC, useCallback, useEffect } from "react";

import { News } from "../../models/news";
import { useNavigate, useParams } from "react-router-dom";
import { NewsDescription } from "./news-description";
import { Comment } from "../../models/comment";
import { createComment } from "../../utils/create-comment";

import useAuthUser from "react-auth-kit/hooks/useAuthUser";
import { useGetUser } from "../../store/hooks/use-get-user";
import { Footer } from "../../componens/footer";
import { useCreateCommentMutation } from "../../store/news/news-api";
import { useSelector } from "react-redux";
import { selectNews } from "../../store/news/editor-slice";
import { createRawNews } from "../../utils/create-raw-news";
import { createNews } from "../../utils/create-news";
import { newsFactory } from "../../utils/news_factory";
import { Navbar } from "../../componens/navbar";
import { Box } from "@chakra-ui/react";

export const NewsDescProvider: FC = () => {
  const navigate = useNavigate();
  const news = useSelector(selectNews);
  const { id } = useParams<"id">();

  useEffect(() => {
    if (news === null) navigate("/");
  }, []);

  const [addComment] = useCreateCommentMutation();
  console.log(news);
  const onSubmit = useCallback(async (comment: Comment) => {
    addComment(comment);
  }, []);

  return (
    <>
      {news ? (
        <Box margin={"auto"} w={"80%"}>
          <Navbar />
          <NewsDescription
            key={id}
            id={Number(id)}
            news={newsFactory(news)}
            onSubmit={onSubmit}
          />
          <Footer />
        </Box>
      ) : (
        ""
      )}
    </>
  );
};
