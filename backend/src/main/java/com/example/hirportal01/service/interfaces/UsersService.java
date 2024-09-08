package com.example.hirportal01.service.interfaces;

import com.example.hirportal01.dto.CommentDTO;
import com.example.hirportal01.dto.UserDTOForUpdate;
import com.example.hirportal01.dto.UsersDTO;
import com.example.hirportal01.entity.Users;


import java.util.List;
import java.util.Optional;

public interface UsersService {
    List<UsersDTO> findAll();
    Users findUserByChatName(String chatName);
    UsersDTO create(UsersDTO newsDTO);
    Optional<UsersDTO> findById(Long id);
    boolean checkEmail(String email);
    UsersDTO update(UsersDTO usersDTO);
    UsersDTO update(UserDTOForUpdate userDTOForUpdate) ;
    void delete(Long id);
    UsersDTO findUser(String username, String password);
    void addComment(CommentDTO commentDTO);
}