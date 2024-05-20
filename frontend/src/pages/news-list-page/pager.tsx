
import {FC} from 'react'
import { useDispatch, useSelector } from 'react-redux';
import { selectSide, setSide } from '../../store/news/news-slice';
import { Box, Flex, Button } from '@chakra-ui/react';
import { FaArrowLeft, FaArrowRight } from 'react-icons/fa';
export const Pager : FC <{lastSide:boolean|undefined}>= ({lastSide})=>{
    const side=useSelector(selectSide)
    const dispatch=useDispatch()

    return (
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
            isDisabled={lastSide}
            onClick={() => {
              dispatch(setSide(side + 1));
            }}
            rightIcon={<FaArrowRight />}
          >
            Következő
          </Button>
        </Flex>
      </Box>);
}