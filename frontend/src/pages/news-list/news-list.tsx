import { FC, useEffect, useState } from "react";
import {
  Grid,
  GridItem,
  ListItem,
  OrderedList,
  Box,
  Button,
  Flex,
  Text,
} from "@chakra-ui/react";

import { NewsListItem } from "../../componens/news-list-item";
import { RawNews } from "../../models";
import { useDispatch, useSelector } from "react-redux";
import {
  selectSide,
  selectTypeId,
  setNews,
  setSide,
} from "../../store/news/news-slice";
import { useGetNewsByType } from "../../store/hooks/use-get-news-by-type";
import { serializNews } from "../../utils/news_factory";
import { selectSearchText, setSearchText } from "../../store/news/search-slice";
import { FaArrowLeft, FaArrowRight } from "react-icons/fa";
import { useNewsTypes } from "../../store/hooks/use-news-types";

export const NewsList: FC = () => {
  const itemsPerPage = 12;
  const dispatch = useDispatch();
  //LAPOZÁS

  const idFromState = useSelector(selectTypeId);
  const [newsDataState, setNewsDataState] = useState<RawNews[]>([]);
  const side = useSelector(selectSide);
  const [pageIndex, setPageIndex] = useState(useSelector(selectSide));
  const { types } = useNewsTypes();

  const searchText = useSelector(selectSearchText);

  const { news: allNews } = useGetNewsByType({
    limit: 15,
    typeId: idFromState!,
    side: side,
    search: searchText,
  });

 

  useEffect(() => {
    setPageIndex(side);
    dispatch(setSearchText(undefined));
  }, [idFromState]);
  useEffect(() => {
    allNews && setNewsDataState(allNews.newsList.map(serializNews));
    allNews && dispatch(setNews(allNews.newsList.map(serializNews)));

  }, [allNews, dispatch, searchText, side]);
  return (
    <Grid justifyItems={"center"}>
      <Box>
        <Text fontSize={"xx-large"} fontWeight={"bold"} mb={"5"}>
          {idFromState !== -1 ? types[idFromState! - 1].title : "ÖSSZES"}
        </Text>
      </Box>
      <Box w={"80%"}>
        <Grid
          as={OrderedList}
          templateColumns={{ base: "1fr", md: "1fr 1fr", lg: "1fr 1fr 1fr" }}
          sx={{
            gap: 12,
            listStyleType: "none",
            padding: 0,
            margin: 0,
          }}
        >
          {allNews?.newsList.map((news, id) => (
            <GridItem as={ListItem} key={id}>
              <NewsListItem key={news.id} stateId={news.id!} news={news} />
            </GridItem>
          ))}
        </Grid>
        <Box mt={10} textAlign={"center"}>
          <Flex justifyItems="center" justify="space-between">
            <Button
              isDisabled={side === 0}
              onClick={() => {
                dispatch(setSide(side - 1));
              }}
              m={2}
              pe={5}
              leftIcon={<FaArrowLeft />}
            >
              Előző
            </Button>
            <Box ms={5} me={5} justifyContent={"center"}>
              {side + 1} .oldal
            </Box>

            <Button
              ps={5}
              isDisabled={allNews?.lastSide}
              onClick={() => {
                dispatch(setSide(side + 1));
              }}
              rightIcon={<FaArrowRight />}
            >
              Következő
            </Button>
          </Flex>
        </Box>
      </Box>
    </Grid>
  );
};
