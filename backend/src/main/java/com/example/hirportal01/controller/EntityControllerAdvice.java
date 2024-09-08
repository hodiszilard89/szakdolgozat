package com.example.hirportal01.controller;


import com.example.hirportal01.exceptions.InvalidEntityException;
import com.example.hirportal01.exceptions.EntityNotFoundException;
import com.example.hirportal01.exceptions.UserIsBlockedException;
import com.example.hirportal01.response.ErrorResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.ArrayList;
import java.util.List;


@RestControllerAdvice
public class EntityControllerAdvice {

    @ExceptionHandler(value= EntityNotFoundException.class)
    public ResponseEntity<ErrorResponse> handelEntityNotFoundException(EntityNotFoundException exception) {
        List<String> errors= new ArrayList<>();
        errors.add(exception.getMessage());
        exception.setMessages(errors);
        ErrorResponse errorResponse = new ErrorResponse(exception.getMessages());
        return ResponseEntity.badRequest().body(errorResponse);
    }

    @ExceptionHandler(value = UserIsBlockedException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<ErrorResponse> handleUserIsBlockedException(UserIsBlockedException exception){
        List<String> errors= new ArrayList<>();
        errors.add("felhasználót blokkoltuk");
        exception.setMessages(errors);
        ErrorResponse errorsResponse = new ErrorResponse(exception.getMessages());
        return ResponseEntity.badRequest().body(errorsResponse);
        //return new ResponseEntity<>("Felhasznólót blokkoltuk",HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(value= InvalidEntityException.class)
    public ResponseEntity<ErrorResponse> handleInvalidEntityException(InvalidEntityException exception){
        ErrorResponse errorResponse = new ErrorResponse(exception.getMessages());
        return  ResponseEntity.badRequest().body(errorResponse);
    }
}
