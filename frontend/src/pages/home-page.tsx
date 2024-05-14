import { FC, useDeferredValue, useEffect } from "react";
import { Box, Flex, Grid } from "@chakra-ui/react";

import { NewsList } from "./news-list/news-list";
import { Footer } from "../componens/footer";
import { Navbar } from "../componens/navbar";

import Carousel from "../componens/carousel/carousel";

import { CarouselProvider } from "../componens/carousel/carousel-provider";
import { NewsListProvider } from "./news-list/newslist.provider";

export const HomePage: FC = () => {

  console.log(process.env.REACT_APP_PROBA)
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
            <NewsListProvider />
            <Footer />
          </Box>
        </Flex>
      </Box>
    </Box>
  );
};
