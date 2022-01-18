package it.unipi.dsmt.dto;

import java.util.List;

public class UserPagesDTO {

    private List<UserDTO> user_list;

    public List<UserDTO> getUser_list() {
        return user_list;
    }

    public void setUser_list(List<UserDTO> user_list) {
        this.user_list = user_list;
    }
}
