
import {
  GetRequestParamsForNewsQuery,
  newsApi,
  useGetNewsByTypeQuery,
} from "../news-api";
import { useSelector } from "react-redux";
export const useGetNewsByType = (params: GetRequestParamsForNewsQuery) => {
  const { isLoading, isFetching, error} = useGetNewsByTypeQuery(params);
  const select = newsApi.endpoints.getNewsByType.select(params);
  const { data } = useSelector(select);
  const news = data?.newsList
  const lastSide= data&&data?.lastSide
  return {
    isLoading,
    isFetching,
    error,
    news,
    lastSide,
  };
};
