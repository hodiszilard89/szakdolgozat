import { FC, useDeferredValue, useEffect } from "react";
import { Box, Flex, Grid } from "@chakra-ui/react";

import { NewsList } from "./news-list/news-list";

import { useDispatch, useSelector } from "react-redux";

import { selectNews, setPriorityNews } from "../store/news/news-slice";
import { newsFactory, serializNews } from "../utils/news_factory";
import { Footer } from "../componens/footer";
import { Navbar } from "../componens/navbar";

import Carousel from "../componens/carousel/carousel";
import { closeEditor } from "../store/news/editor-slice";
import { CarouselProvider } from "../componens/carousel/carousel-provider";

export const HomePage: FC = () => {
  // const priority = useSelector(selectNews)
  //   .filter((news) => news.priority)
  //   .map(newsFactory);

  return (
    <Box margin={"auto"} w={"80%"}>
      <Navbar />

      <Box>
        <Flex maxWidth="auto" flexDir="column" height="full">
          <Box flexGrow={3}>
            {/* <Box
              margin={"auto"}
              w={"80%"}
              display={{ base: "none", md: "block" }}
            >
              <Grid justifyItems={"center"} marginBottom={10} h={"550px"}> */}
                <CarouselProvider/>
              {/* </Grid>
            </Box> */}
            <NewsList />
            <Footer />
          </Box>
        </Flex>
      </Box>
    </Box>
  );
};
