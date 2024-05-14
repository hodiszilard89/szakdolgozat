import { FC, useState, useEffect } from "react";
import {
  Box,
  Text,
  FormControl,
  Input,
  FormLabel,
  Button,
  Image,
  FormErrorMessage,
} from "@chakra-ui/react";
import { useFormik } from "formik";
import { useMultiStyleConfig } from "@chakra-ui/react";
import { Comment } from "../../models/comment";
import { useDispatch, useSelector } from "react-redux";

import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { setNewsTypeId } from "../../store/news/news-slice";
import { selectNews } from "../../store/news/editor-slice";
import { newsFactory, serializNews } from "../../utils/news_factory";
import { newsCommentValidationSchema } from "./comment-validation.schema";
import { selectAuthUser } from "../../store/news/auth-user-slice";
import { News } from "../../models/news";
import { Navbar } from "../../componens/navbar";
import { createComment } from "../../utils/create-comment";
import { CommentForm } from "./comment-form";
import { MyComment } from "../../componens/my-comment";
import { useGetNewsQuery, useGetOneNewsQuery } from "../../store/news/news-api";
import { useOneNews } from "../../store/hooks/use-one-news";

export interface NewsDescProps {
  id: number;
  news: News;
  onSubmit: (comment: Comment) => Promise<void>;
}
export interface CommentText {
  text: string;
}

export const NewsDescription: FC<NewsDescProps> = ({ onSubmit, news }) => {

  const dispatch = useDispatch();
  const style = useMultiStyleConfig("GenresLable", {});
  const newsFromState = news;

  const [comments, setComments] = useState<Comment[]>(
    newsFromState.comments ? newsFromState.comments : []
  );
  

  return (
    <Box margin={"auto"} w={"80%"}>
      <Box>
        <Box>
          <Image
            style={{ width: "600px", height: "400px" }}
            src={newsFromState?.imgPath ? newsFromState?.imgPath : ""}
            borderRadius={"3"}
            className="mb-3"
          />
          <Box maxWidth={"550px"}>
            {newsFromState?.types?.map((type, id) => {
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
          <Text>Szerző: {newsFromState && newsFromState.writer?.chatName}</Text>
          <Text fontSize={"2xl"} fontWeight={"bold"}>
            {newsFromState?.title}
          </Text>
          <section style={{ fontSize: "18px" }}>{newsFromState?.text}</section>
        </Box>
      </Box>
      <Box width={"75%"} mt={10}>
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
          news={newsFromState}
          setComments={setComments}
          comments={comments}
        />
      </Box>
    </Box>
  );
};
