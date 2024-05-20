
import {FC} from 'react'
import { useSelector } from 'react-redux'

import {UserDesc} from './user-desc'
import {selectUser} from '../../store/news/users-slice'



export const UserDescProvides : FC  = () =>{
    const user = useSelector(selectUser)

    return (
        user?
        <UserDesc  
         user={user}
         onSubmit={Promise.resolve}></UserDesc>:<></>)

}