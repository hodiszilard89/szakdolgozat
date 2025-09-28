import { FC} from "react";
import {
  Grid,
  GridItem,
  ListItem,
  OrderedList,
  Box

} from "@chakra-ui/react";

import { NewsListItem } from "./news-list-item";
import { News } from "../../models";




export const NewsList: FC<{news:News[]|undefined}> = ({news}) => {

  return (
    <Grid justifyItems={"center"}>
     
      <Box  w={"80%"}>
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
          {news?.map((newsItem, id) => (
            <GridItem as={ListItem} key={id}>
              <NewsListItem key={newsItem.id} stateId={newsItem.id!} news={newsItem} />
            </GridItem>
          ))}
        </Grid>
      </Box>
    </Grid>
  );
};
