import React, { useState, FC, useEffect, useCallback } from "react";

import {
  Box,
  Input,
  FormLabel,
  Button,
  FormErrorMessage,
  FormControl,
  Checkbox,
  Text,
  Flex,
  useSafeLayoutEffect,
  
} from "@chakra-ui/react";


import { showEditor } from "../../store/slices/editor-slice";
import { useDispatch, useSelector } from "react-redux";
import { News } from "../../models/news";
import { useNewsTypes } from "../../store/hooks/use-news-types";
import {  useFormik } from "formik";
import { GenreSelector } from "../../componens/genre-selector";
import { Image } from "@chakra-ui/react";
import { newsEditValidationSchema } from "./news-edit-validation.schema";

import { selectAuthUser } from "../../store/slices/auth-user-slice";

import { useNewsChancages } from "../../store/hooks/use-news-chancages";
import { useNavigate } from "react-router-dom";
export interface NewsEditorProps {
  news: News;
}

export const NewsEditor: FC<NewsEditorProps> = ({ news }) => {
  const user = useSelector(selectAuthUser).user;
  const { types } = useNewsTypes();
  const dispatch = useDispatch();
  const { save } = useNewsChancages();
  const navigate = useNavigate();
  const onSubmit = useCallback(
    async (news: News) => {
      await save(news);
      navigate("/")
    },
    [save, dispatch]
  );

  useEffect(()=>{
    setValues(news)
  },[news])

  const {
    errors,
    values,
    setFieldValue,
    handleSubmit,
    setValues,
  } = useFormik({
    initialValues: news,
    onSubmit: async (values: News, { setSubmitting }) => {
      setSubmitting(true) 
      if (user) {
        try {
          const validatedNews = { ...values };
          validatedNews.writer = user;
          await onSubmit(validatedNews);

        } catch (e) {
          console.error(e);
        }
      } else {
        window.confirm("jelentkezz be");
      }
      setSubmitting(false)
    },
    validationSchema: newsEditValidationSchema,
  });


 
  
  return (     
        <form onSubmit={handleSubmit}>
          {values.imgPath && (
            <Image
              src={values?.imgPath}
              style={{ width: "600px", height: "400px" }}
            ></Image>
          )}
          <FormControl isInvalid={!!errors.imgPath}>
            <FormLabel>Image URL</FormLabel>
            <Input
              backgroundColor={"white"}
              type="text"
              placeholder="Enter image URL (optional)"
              value={values.imgPath ? values.imgPath : ""}
              onChange={(event) => setFieldValue("imgPath", event.target.value)}
            />
            <FormErrorMessage>{errors.imgPath}</FormErrorMessage>
          </FormControl>

          <FormControl isInvalid={!!errors.title}>
            <FormLabel>Title</FormLabel>
            <Input
              backgroundColor={"white"}
              value={values.title}
              type="text"
              placeholder="Enter title"
              // value={values.title&&""}
              onChange={(event) => setFieldValue("title", event.target.value)}
            />
            <FormErrorMessage>{errors.title}</FormErrorMessage>
          </FormControl>

          <FormControl isInvalid={!!errors.subtitle}>
            <FormLabel>Subtitle</FormLabel>
            <Input
              backgroundColor={"white"}
              type="text"
              placeholder="Enter subtitle"
              value={values.subtitle ? values.subtitle : ""}
              onChange={(event) =>
                setFieldValue("subtitle", event.target.value)
              }
            />
            <FormErrorMessage>{errors.subtitle}</FormErrorMessage>
          </FormControl>
          <FormControl isInvalid={!!errors.text}>
            <FormLabel>Content</FormLabel>
            <Input
              as="textarea"
              type="text"
              backgroundColor={"white"}
              rows={3}

              placeholder="Enter article content"
              value={values.text ? values.text : ""}
              onChange={(event) => setFieldValue("text", event.target.value)}
            />

            <FormErrorMessage>{errors.text}</FormErrorMessage>
          </FormControl>
          <Flex   paddingTop={3}>
          <Text display={"flex"}>
            <FormLabel> Vezető hír</FormLabel>
           
          </Text>
          <Checkbox
            
              border={"1px black"}
              display={"flex"}
              size="lg"
              isChecked={values.priority}
              value={""}
              defaultChecked={false}
              onChange={(event) => {
                
                setFieldValue("priority", event.currentTarget.checked);
              }}
            /> 
          </Flex>
         
          <FormControl isInvalid={!!errors.types}>
            <FormLabel>Kategória</FormLabel>
            {types ? (
              <GenreSelector
                value={values.types}
                types={types}
                onChange={(genres) => {
                  return setFieldValue("types", genres);
                }}
              />
            ) : (
              ""
            )}
            <FormErrorMessage>{errors.types}</FormErrorMessage>
          </FormControl>
          <Button colorScheme="teal" variant="solid" type="submit" isDisabled={(Object.keys(errors).length>0)}>
            Küldés
          </Button>
          <Button
            m={2}
            colorScheme="teal"
            variant="solid"
            type="reset"
            onClick={(e) =>dispatch(showEditor())}
          >
            Reset
          </Button>
        </form>
     
  
  );
};

export default NewsEditor;
