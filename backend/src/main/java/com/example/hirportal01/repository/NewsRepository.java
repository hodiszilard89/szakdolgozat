package com.example.hirportal01.repository;

import com.example.hirportal01.entity.News;
import com.example.hirportal01.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface NewsRepository extends JpaRepository<News, Long> {
    @Query(value= "select * from news join news_type on news.id = news_type.news_id " +
            "where news_type.type_id = :id AND news.title LIKE %:search% ", nativeQuery = true)
    Optional<List<News>> getNewsBySearchAndId(@Param("id")Long id, @Param("search") String search);

    @Query(value= "select * from news join news_type on news.id = " +
            "news_type.news_id where news_type.type_id = :id ", nativeQuery = true)
    Optional<List<News>> searchWithId(@Param("id") Long id);
    @Query(value= "select * from news where title LIKE %:search%", nativeQuery = true)
    Optional<List<News>> getNewsBySearch( @Param("search") String search);

}
