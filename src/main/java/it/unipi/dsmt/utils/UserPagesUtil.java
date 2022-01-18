package it.unipi.dsmt.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.dto.UserPagesDTO;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class UserPagesUtil {

    private static UserPagesDTO user_list = null;

    static {
        user_list = load();
    }

    public static List<UserDTO> list(){
        return user_list.getUser_list();
    }

    public static UserDTO byUsername(String username){
        for(UserDTO item:user_list.getUser_list()){
            if (item.getUsername().equals(username)){
                return item;
            }
        }
        return null;
    }

    private static UserPagesDTO load(){
        String path = "/files/users_info.json";
        InputStream is = UserPagesUtil.class.getResourceAsStream(path);

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return (UserPagesDTO)objectMapper.readValue(is,UserPagesDTO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
