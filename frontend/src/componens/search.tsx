import { Box, Button, Input } from '@chakra-ui/react'
import {FC, useRef, useState} from 'react'

import { useFormik } from 'formik';
import { useDispatch } from 'react-redux';
import { setSearchText } from '../store/slices/search-slice';
import { setSide } from '../store/slices/news-slice';


export const Search :FC=() =>{
    const dispach = useDispatch();
    const { errors, values, setFieldValue, handleSubmit, setValues } = useFormik({
      initialValues:{
        search: "",
        },
      onSubmit: async (values) => {
        dispach(setSide(0))
        dispach(setSearchText(values.search))
        setValues({search:""})
      },
    });
    return(
    <Box>
          <form onSubmit={handleSubmit}>
              <Box ml={3} mt={1} display="flex">
                <Input
                  type="search"
                  placeholder="Search"
                  className="me-2"
                  size="sm"
                  aria-label="Search"
                  value={values.search}
                  onChange={(e)=>{setFieldValue("search",e.target.value)}}
                />
                <Button
                  as="button"
                  type="submit"
                  variant="outline-success"
                  size="sm"
                >
                  Keresés
                </Button>
              </Box>
            </form>
    </Box>)
}