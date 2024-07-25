import { useCallback } from "react";


import {useCreateCommentMutation, useCreateNewsMutaion, useDeleteNewsMutaion, useUpdateNewsMutaion} from "../news-api";
import {News} from "../../models/news"
import {serializeNews } from "../../utils/news_factory";


export const useNewsChancages = () =>{
    const [addComment] = useCreateCommentMutation();
    const [createNews]  = useCreateNewsMutaion();
    const [deleteNews] = useDeleteNewsMutaion();
    const [updateNews] = useUpdateNewsMutaion();


    const save = useCallback(
        async (news: News) => {
          const mutation = news.id ? updateNews : createNews;
          const rawNews = serializeNews(news);
          const result = await mutation(rawNews);
          if ("error" in result) {
       
            throw result.error;
          }

        },
        [updateNews, createNews]
      );

     
    return{
        deleteNews,
        save,
        addComment,
    };
}