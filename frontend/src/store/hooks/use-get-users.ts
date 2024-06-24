import { useGetUsersQuery } from "../news-api"

export const useGetUsers = ()=>{

    const {isLoading, isFetching, data} = useGetUsersQuery();
    
    return (
        data
    )
}