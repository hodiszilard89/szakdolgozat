package com.example.hirportal01.security;

import com.example.hirportal01.dto.UsersDTO;
import com.example.hirportal01.entity.Users;
import com.example.hirportal01.exception.UserIsBlockedException;
import com.example.hirportal01.repository.UsersRepository;
import com.example.hirportal01.service.impl.UsersServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


@Service
@Transactional
@EnableTransactionManagement
public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    private final UsersServiceImpl usersService;
    @Autowired
    private final ModelMapper modelMapper;
    public UserDetailsServiceImpl(UsersServiceImpl usersService, ModelMapper modelMapper) {
        this.usersService = usersService;
        this.modelMapper = modelMapper;
    }
    private List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
    @Override
    public UserDetails loadUserByUsername(String username) {
        String chatName;
        String password;
        Users users = usersService.findUserByChatName(username);
        if (users != null){
            chatName=users.getChatName();
            password=users.getPassword();
           if (users.getLocked()) throw  new UserIsBlockedException(username+" is blocked");
        }
        else{
            throw new UsernameNotFoundException(username);
        }



        return new User(chatName,password, true,true,true,true,users.getAuthorities());
    }

}
