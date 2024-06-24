import {FC} from 'react'
import Carousel from './carousel'
import { useSelector } from 'react-redux';
import { selectNews } from '../../store/slices/news-slice';
import { newsFactory } from '../../utils/news_factory';
export const CarouselProvider : FC = ()=>{
    const news = useSelector(selectNews)
    .filter((news) => news.priority)
    .map(newsFactory);
    return(<Carousel news = {news}/>)
}