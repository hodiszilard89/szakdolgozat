import { FC } from "react";
import { Box,  Flex, Grid } from "@chakra-ui/react";

import { NewsList } from "./news-list/news-list";

import { useSelector } from "react-redux";

import { selectNews } from "../store/news/news-slice";
import { newsFactory } from "../utils/news_factory";
import { Footer } from "../componens/footer";
import { Navbar } from "../componens/navbar";

import Carousel from "../componens/carousel";

export const HomePage: FC = () => {
  const priority = useSelector(selectNews)
    .filter((news) => news.priority)
    .map(newsFactory);

  return (
    
      <Box margin={"auto"} w={"80%"}>
        <Navbar />

        <Box>
          <Flex maxWidth="auto" flexDir="column" height="full">
            <Box flexGrow={3}>
           
              {!!priority.length &&
                <Box margin={"auto"} w={"80%"} display={{ base: "none", md: "block" }}>
                  <Grid
                  justifyItems={"center"}
                    marginBottom={10}
                    h={"550px"}
                   
                  >
                    <Carousel news={priority} />
                  </Grid>
                </Box>
              }
              <NewsList />
              <Footer />
            </Box>
          </Flex>
        </Box>
      </Box>
   
  );
};
