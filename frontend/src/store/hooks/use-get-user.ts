import {useMemo,FC} from 'react'
import { useSelector } from "react-redux";
import { newsApi, useGetUserQuery } from "../news-api"
import { User } from '../../models/user';



export const useGetUser = (userId : User["id"]) => {
    const {isLoading, isFetching,error} =  useGetUserQuery(userId,{skip:!userId});

    const select = newsApi.endpoints.getUser.select(userId );
    const { data } = useSelector(select);
    
 

    return {
        isLoading: isLoading || (!data && isFetching),
        error,  
        data,
      };
}