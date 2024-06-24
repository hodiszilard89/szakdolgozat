import { useDeleteUserMutation, useUpdateUserMutaion } from "../news-api"

export const useUserChancages=()=>{
    const [deleteUser] = useDeleteUserMutation();
    const [updateUser] = useUpdateUserMutaion();

     return  {deleteUser, updateUser};

}