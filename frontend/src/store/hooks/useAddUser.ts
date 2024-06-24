import { useCreateUserMutation } from "../news-api"

export const useAddUser =()=>{
    const [addUser] = useCreateUserMutation();
    return {
        addUser
    }
}