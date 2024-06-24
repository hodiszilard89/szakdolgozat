import { FC, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { selectSide, selectTypeId, setNews } from "../../store/slices/news-slice";
import { useGetNewsByType } from "../../store/hooks/use-get-news-by-type";
import { selectSearchText, setSearchText } from "../../store/slices/search-slice";
import { serializNews } from "../../utils/news_factory";
import { NewsList } from "./news-list";
import { Box, Text } from "@chakra-ui/react";
import { Pager } from "./pager";
import { useNewsTypes } from "../../store/hooks/use-news-types";
import { Error } from "../Error";

export const NewsListProvider: FC = () => {
  const itemsPerPage = 15;
  const dispatch = useDispatch();
  const side = useSelector(selectSide);
  const typeId = useSelector(selectTypeId);
  const searchText = useSelector(selectSearchText);
  const { types } = useNewsTypes();
  const { news: allNews } = useGetNewsByType({
    limit: itemsPerPage,
    typeId: typeId!,
    side: side,
    search: searchText,
  });

  useEffect(() => {
    dispatch(setSearchText(undefined));
  }, [typeId]);

  useEffect(() => {
    allNews && dispatch(setNews(allNews.newsList.map(serializNews)));
  }, [allNews, dispatch, searchText, side]);

  return (
    <>
      {allNews?.newsList ? (
        <>
          <Box textAlign={"center"}>
            <Text fontSize={"xx-large"} fontWeight={"bold"} mb={"5"}>
              {typeId !== -1 ? types[typeId! - 1].title : "ÖSSZES"}
            </Text>
          </Box>
          <NewsList news={allNews?.newsList} />
          <Box mt={10} textAlign={"center"} width={"80%"} margin={"auto"}>
            <Pager lastSide={allNews?.lastSide} />
          </Box>
        </>
      ) : (
        <Error msg="Nincs kapcsolat a szerverrel" />
      )}
    </>
  );
};
