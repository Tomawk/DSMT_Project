package it.unipi.dsmt.interfaces;

import it.unipi.dsmt.dto.UserDTO;

import javax.ejb.Remote;
import java.sql.SQLException;
import java.util.ArrayList;

@Remote
public interface UserRemote {
    public UserDTO getUser(String username) throws SQLException;
    public ArrayList<UserDTO> getUserList(String city, String pet) throws SQLException;
}