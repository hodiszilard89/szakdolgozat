import { FC, useCallback, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { NewsDescription } from "./news-description";
import { Comment } from "../../models/comment";

import { useCreateCommentMutation } from "../../store/news-api";
import { Box, Text } from "@chakra-ui/react";
import { useOneNews } from "../../store/hooks/use-one-news";
import { Error } from "../Error";
import { CommentForm } from "./comment-form";
import { MyComment } from "../../componens/my-comment";
import { useSelector } from "react-redux";
import { selectAuthUser } from "../../store/slices/auth-user-slice";

export const NewsDescProvider: FC = () => {
  const { id } = useParams();

  const [addComment] = useCreateCommentMutation();
  const { news } = useOneNews(Number(id));
  const [comments, setComments] = useState<Comment[]>(
    news?.comments ? news.comments : []
  );

  const onSubmit = useCallback(async (comment: Comment) => {
    addComment(comment);
  }, []);
  const user = useSelector(selectAuthUser).user;
  useEffect(() => {
    setComments(news?.comments ? news.comments : []);
  }, [news]);
  return (
    <>
      {news ? (
        <Box margin={"auto"} w={"80%"}>
          <NewsDescription key={Number(id)} news={news} />
          <Box width={"75%"} margin={"auto"} mt={"10"}>
            <Text fontWeight={"bold"} fontSize={"2xl"}>
              Hozzászólások: ({comments.length})
            </Text>

            <Box>
              {comments.map((comment, id) => (
                <MyComment key={id} comment={comment} />
              ))}
            </Box>
            <CommentForm
              onSubmit={onSubmit}
              news={news}
              user={user}
              setComments={setComments}
              comments={comments}
            />
          </Box>
        </Box>
      ) : (
        <Error msg="A hír nem található" />
      )}
    </>
  );
};
