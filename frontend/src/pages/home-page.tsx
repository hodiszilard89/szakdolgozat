import { FC, useDeferredValue, useEffect } from "react";
import { Box, Flex, Grid } from "@chakra-ui/react";

import { NewsList } from "./news-list-page/news-list";
import { Footer } from "../componens/footer";


import { CarouselProvider } from "../componens/carousel/carousel-provider";
import { NewsListProvider } from "./news-list-page/newslist-provider";

export const HomePage: FC = () => {

  return (
    <Box margin={"auto"} w={"80%"}>
      <Box>
        <Flex maxWidth="auto" flexDir="column" height="full">
          <Box flexGrow={3}>
            <CarouselProvider/>
            <NewsListProvider />
          </Box>
        </Flex>
      </Box>
    </Box>
  );
};
