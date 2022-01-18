package it.unipi.dsmt.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.dto.UserPagesDTO;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
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


    //display both petsitters and petowners
    public static ArrayList<UserDTO> filter_list(String city, String pet){
        ArrayList<UserDTO> filtered_list = new ArrayList<>();
        for(UserDTO item:user_list.getUser_list()){
            if(item.getCity().equals(city)){
                for(String pet_selected: item.getPets()){
                    if(pet_selected.equals(pet)) filtered_list.add(item);
                }
            }
        }
        return filtered_list;
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
