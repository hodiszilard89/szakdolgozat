package com.example.hirportal01.dto;

public class UserDTOForUpdate
{
    private UsersDTO usersDTO;
    private String image;

    public UserDTOForUpdate() {
    }

    public UsersDTO getUsersDTO() {
        return usersDTO;
    }

    public void setUsersDTO(UsersDTO usersDTO) {
        this.usersDTO = usersDTO;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
