package com.example.hirportal01.exceptions;

import java.util.List;

public class InvalidEntityException extends RuntimeException{
    private List<String> messages;

    public InvalidEntityException(String message) {
        super(message);

    }
    public InvalidEntityException(String message, List<String> messages) {
        super(message);
        this.messages = messages;
    }


    public List<String> getMessages() {

        return messages;
    }
}
