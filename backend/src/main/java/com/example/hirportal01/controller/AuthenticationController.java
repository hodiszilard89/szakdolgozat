package com.example.hirportal01.controller;

import com.example.hirportal01.dto.NewsDTO;
import com.example.hirportal01.dto.UsersDTO;
import com.example.hirportal01.dto.TokenDTO;
import com.example.hirportal01.entity.Users;
import com.example.hirportal01.exception.EntityNotFoundException;
import com.example.hirportal01.exception.UserIsBlockedException;
import com.example.hirportal01.request.AuthenticationRequest;
import com.example.hirportal01.security.UserDetailsServiceImpl;
import com.example.hirportal01.service.impl.UsersServiceImpl;
import com.example.hirportal01.util.JwtUtil;

import org.apache.tomcat.websocket.AuthenticationException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@RestController
@RequestMapping(path = "/authentication")
public class AuthenticationController {

    private final JwtUtil jwtUtil;
    private final UserDetailsServiceImpl usersDetailService;
    private final UsersServiceImpl usersService;
    public AuthenticationController(JwtUtil jwtUtil, UserDetailsServiceImpl usersDetailService, UsersServiceImpl usersService) {
        this.jwtUtil = jwtUtil;

        this.usersDetailService = usersDetailService;
        this.usersService = usersService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<TokenDTO> authenticate(@RequestBody AuthenticationRequest authenticationRequest) {

        authenticateUser(authenticationRequest);


        UsersDTO usersDTO=
        usersService.findUser(authenticationRequest.getUsername(),authenticationRequest.getPassword());
        TokenDTO tokenDTO = new TokenDTO(jwtUtil.createAndSignToken(usersDTO.getChatName(), usersDTO.rolesToString(), usersDTO.getId()));
        return ResponseEntity.ok().body(tokenDTO);
    }

    private void authenticateUser(AuthenticationRequest authenticationRequest) {
        UserDetails users = usersDetailService.loadUserByUsername(authenticationRequest.getUsername());
        if (!users.getUsername().equals(authenticationRequest.getUsername()) || !users.getPassword().equals(authenticationRequest.getPassword())) {
            throw new EntityNotFoundException("autettikációs hiba a controllerből");
        }
    }

}
