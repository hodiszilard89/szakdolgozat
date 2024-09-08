package com.example.hirportal01.security;

import com.example.hirportal01.entity.Users;
import com.example.hirportal01.exceptions.EntityNotFoundException;
import com.example.hirportal01.exceptions.UserIsBlockedException;
import com.example.hirportal01.service.impl.UsersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
@EnableTransactionManagement
public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    private final UsersServiceImpl usersService;

    public UserDetailsServiceImpl(UsersServiceImpl usersService) {
        this.usersService = usersService;
    }
    @Override
    public UserDetails loadUserByUsername(String email) {
        String chatName;
        String password;
        Users users = usersService.findUserByEmail(email);
        if (users != null){
            chatName=users.getChatName();
            password=users.getPassword();
           if (users.getLocked()) throw  new UserIsBlockedException(chatName+" is blocked");
        }
        else{
            throw new EntityNotFoundException(email);
        }

        return new User(chatName,password, true,true,true,true,users.getAuthorities());
    }
    public User loadUserByEmail(String email) {
        String chatName;
        String password;
        Users users = usersService.findUserByEmail(email);
        if (users != null){
            chatName=users.getChatName();
            password=users.getPassword();
            if (users.getLocked()) throw  new UserIsBlockedException(chatName+" is blocked");
        }
        else{
            throw new EntityNotFoundException("Hibás felhasználóinév vagy jelszó");
        }

        return new User(email,password, true,true,true,true,users.getAuthorities());
    }
}
