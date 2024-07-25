
import { RawNews, News, Comment, RawComment } from "../models";

export const newsFactory = (rawNewsData: RawNews) => {
    const releaseDate = new Date(Date.now());
    
    if (rawNewsData.releasedate) {
      const [year, month, day] = rawNewsData.releasedate.split("-");
      releaseDate.setFullYear(Number(year));
      releaseDate.setMonth(Number(month) - 1);
      releaseDate.setDate(Number(day));
  
      
    }

    return {
      ...rawNewsData,
     releasedate: releaseDate,
    } as News;
  };

  export const serializeNews = (news: News): RawNews => {

      return {
        ...news,
        releasedate: news.releasedate?new Date(news.releasedate).toISOString().split("T")[0]:new Date().toISOString().split("T")[0],
       //releasedate: news.releasedate.toISOString().split("T")[0],
      }
    };

  export const serializeComment = (comment: Comment): RawComment => {

    return {
      ...comment,
      releasedate: comment.releasedate.toISOString().split("T")[0],
    }
  };

