import { useMemo } from "react";
import { useSelector } from "react-redux";



import { newsApi, useGetOneNewsQuery } from "../news-api";

export const useOneNews = (newsId: number | undefined) => {
  const { isLoading, isFetching, error } = useGetOneNewsQuery(newsId, {
    skip: !newsId,
  });
  const select = newsApi.endpoints.getOneNews.select(newsId );
  const { data } = useSelector(select);

  return {
    isLoading: isLoading || (!data && isFetching),
    error,
    news:data,
  };
};
