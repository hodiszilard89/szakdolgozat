import {FC, useCallback, useMemo} from 'react'
import { useLocation, useNavigate } from "react-router-dom"
import { NewsIcon } from "./news-icon"

export const IconProvider:FC = ()=>{
    const nav = useNavigate();
    const loc=useLocation();
    const handleNavigation = useMemo(() => {
      return () => nav('/');
    }, [nav]);
    return(
      
        <NewsIcon onClick={handleNavigation}/>
    )
}