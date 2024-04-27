import  { FC, useCallback} from "react";

import { News } from "../../models/news";
import { useParams } from "react-router-dom";
import { NewsDescription } from "./news-description";
import { Comment } from "../../models/comment";
import { createComment } from "../../utils/create-comment";

import  useAuthUser  from "react-auth-kit/hooks/useAuthUser";
import { useGetUser } from "../../store/hooks/use-get-user";
import { Footer } from "../../componens/footer";
import { useCreateCommentMutation } from "../../store/news/news-api";

interface prop {
  news?: News;
}

export const NewsDescProvider: FC<prop> = ({ news }) => {

  const { id } = useParams<"id">();



  const [addComment] = useCreateCommentMutation();

  const onSubmit = useCallback(async (comment: Comment) => {


    addComment(comment);
  }, []);

  return (
    <>
      <NewsDescription
        key={id}
        id={Number(id)}
        onSubmit={onSubmit}
      />
      <Footer />
    </>
  );
};
