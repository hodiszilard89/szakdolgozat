package com.example.hirportal01.service.impl;

import com.example.hirportal01.dto.*;

import com.example.hirportal01.entity.Comment;
import com.example.hirportal01.entity.News;

import com.example.hirportal01.entity.Users;
import com.example.hirportal01.exception.EntityNotFoundException;
import com.example.hirportal01.exception.InvalidEntityException;
import com.example.hirportal01.repository.NewsRepository;
import com.example.hirportal01.repository.TypeOfNewsRepository;
import com.example.hirportal01.repository.UsersRepository;
import com.example.hirportal01.service.NewsService;
import com.example.hirportal01.service.emial.EmailService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class NewsServiceImpl implements NewsService {
    ModelMapper modelMapper;

    EmailService emailService;
    UsersServiceImpl usersService;
    NewsRepository newsRepository;

    TypeOfNewsRepository typeOfNewsRepository;
    UsersRepository usersRepository;


    public NewsServiceImpl(EmailService emailService, ModelMapper modelMapper, UsersServiceImpl usersService, NewsRepository newsRepository, TypeOfNewsRepository typeOfNewsRepository, UsersRepository usersRepository) {

        this.emailService =emailService;
        this.modelMapper = modelMapper;
        this.usersService = usersService;
        this.newsRepository = newsRepository;
        this.typeOfNewsRepository = typeOfNewsRepository;
        this.usersRepository = usersRepository;
    }



    @Override
    public Optional<NewsDTO> findByID(Long id) {
        Optional<News> optionalNews=newsRepository.findById(id);
        return optionalNews.map(news -> modelMapper.map(news,NewsDTO.class));
    }

    @Override
    public List<NewsDTO> findAll() {
        List<News> newsList = newsRepository.findAll();
        return newsList.stream().map(news -> modelMapper
                        .map(news,NewsDTO.class))
                        .collect(Collectors.toList());
    }

    @Override
    public void delete(Long id) {
        System.out.println(id);
        Optional<News> optionalNews = newsRepository.findById(id);
        if(optionalNews.isPresent()){
            newsRepository.delete(optionalNews.get());
        }
        else{
            throw new RuntimeException();
        }
    }

    @Override
    public NewsDTO update(NewsDTO newsDTO) {
        Optional<News> optionalNews=newsRepository.findById(newsDTO.getId());
        if (optionalNews.isEmpty()){
            throw new RuntimeException();
            }
        News savedNews = newsRepository.save(modelMapper.map(newsDTO,News.class));
        return modelMapper.map(savedNews,NewsDTO.class);
    }

    @Override
    public NewsDTO save(NewsDTO newsDTO) {
        newsDTO.setId(null);
        News news=newsRepository.save(modelMapper
                                      .map(newsDTO,News.class));
        return modelMapper.map(news,NewsDTO.class);
    }

    /**
     * TODO
     */
    public List<UsersDTO> getLikers(Long id){
        Optional<News> optionalNews = newsRepository.findById(id);
        if (optionalNews.isPresent()){

            List<Users> usersList =  null;

            return usersList.stream().map(users -> modelMapper
                               .map(users,UsersDTO.class))
                               .collect(Collectors.toList());
        }
        return null;
    }

    @Override
    public ResponseForNewsDTO getNewsByTypeId(Long id, int limit, int side, String search) {
        List<NewsDTO> listOfNews = null;
        Optional<List<News>> listOfNewsByType = Optional.empty();

        int startIndex= (side)*limit;
        int lastIndex=startIndex+limit;
        if (id==-1) {
            listOfNewsByType = newsRepository.getNewsBySearch(search);

        } else {
            listOfNewsByType = newsRepository.getNewsBySearchAndId(id,search);
            System.out.println(search);
            }

        if (listOfNewsByType.isPresent()) {
            listOfNews = listOfNewsByType.get().stream().map(
                        news -> modelMapper.map(news, NewsDTO.class))
                .collect(Collectors.toList());
        } else {
            throw new EntityNotFoundException("");
        }
        if (listOfNews.size() < lastIndex) lastIndex = listOfNews.size();
        ResponseForNewsDTO response = new ResponseForNewsDTO();
        response.setNewsList(listOfNews.subList(startIndex,lastIndex));
        response.setLastSide(side == (listOfNews.size()/limit));
        return response;
    }

    public void addComment(CommentDTO commentDTO) {

        Optional<NewsDTO> optionalNewsDTO=findByID(commentDTO.getNews().getId());
        if (optionalNewsDTO.isPresent()){
            News news=modelMapper.map(optionalNewsDTO.get(),News.class);
            List<Comment> list=news.getComments();
            list.add(modelMapper.map(commentDTO,Comment.class));
            news.setComments(list);
            System.out.println(news.getComments().size());
        }else{
            throw new RuntimeException();
        }
    }

    public void addLike(LikeDTO likeDTO) {
        Optional<NewsDTO> optionalNewsDTO;
        Optional<Users> optionalUsersDTO;
        try {
            optionalNewsDTO=findByID(likeDTO.getNews().getId());
            optionalUsersDTO=usersRepository.findById(likeDTO.getUser().getId());
        } catch (Exception e){
//            Átírni!
            throw new InvalidEntityException("User or News Not Found Exception");
        }

        if (optionalNewsDTO.isPresent() && optionalUsersDTO.isPresent()) {
            News news = modelMapper.map(optionalNewsDTO.get(), News.class);
            Users user = modelMapper.map(optionalUsersDTO.get(), Users.class);
            if (user.getLikes().contains(news)) {

                user.removeFromLikes(news);
                news.removeFromLikedUsers(user);
            } else {
                user.addLikedNews(news);
                news.addLikedUser(user);
            }

            usersService.update(modelMapper.map(user, UsersDTO.class));
            update(modelMapper.map(news, NewsDTO.class));
        }
        else throw new EntityNotFoundException("User os News Not found");
    }
}
