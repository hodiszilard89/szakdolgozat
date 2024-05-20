import { FC, useRef } from "react";
import { createComment } from "../../utils/create-comment";
import { Comment, News } from "../../models";
import { useFormik } from "formik";
import { serializNews } from "../../utils/news_factory";
import { selectAuthUser } from "../../store/news/auth-user-slice";
import { useDispatch, useSelector } from "react-redux";
import {
  Text,
  FormControl,
  Input,
  FormLabel,
  Button,
  FormErrorMessage,
} from "@chakra-ui/react";

///import { newsCommentValidationSchema } from "../single-news-page/comment-validation.schema";
import { User } from "../../models/user";
import { newsCommentValidationSchema } from "./comment-validation.schema";

export interface NewsDescProps {
  comments: Comment[];
  setComments: React.Dispatch<React.SetStateAction<Comment[]>>;
  news: News;
  user:User|undefined;
  onSubmit: (comment: Comment) => Promise<void>;
}

export const CommentForm: FC<NewsDescProps> = ({
  onSubmit,
  news,
  user,
  setComments,
  comments
}) => {
  
  //const inputRef = useRef<HTMLTextAreaElement>(null);
  const { errors, values, setFieldValue, handleSubmit, resetForm } = useFormik({
    initialValues: createComment(),
    onSubmit: async (values: Comment) => {
      resetForm();

      values.releasedate = new Date();
      values.news = serializNews(news);
      if (user !== undefined) {
        try {
          values.writer = user;
          setComments([...comments, values]);
  
          await onSubmit(values);
        } catch (e) {
          console.error(e);
        }
      } else {
        window.confirm("Jelentkezz be!");
      }

    },
    validationSchema: newsCommentValidationSchema,
  });
  return (
    <form
      onSubmit={(e) => {
        e.preventDefault();
        handleSubmit(e);
      }}
    >
      <FormControl isInvalid>
        <FormLabel>
          <Text fontSize={"2xl"} fontWeight={"bold"}>
            Írj egy kommentet
          </Text>
        </FormLabel>
        <Input
       
          h={"100"}
          as="textarea"
          backgroundColor={"white"}
          rows={15}
          placeholder="Ide írd a kommentedet"

          value={values.text}
          onChange={(event) => {
            setFieldValue("text", event.target.value);
          }}
        />
        <FormErrorMessage>{errors.text}</FormErrorMessage>
      </FormControl>
      <Button colorScheme="teal" variant="solid" size={"lg"} type="submit">
        Küldés
      </Button>
    </form>
  );
};
