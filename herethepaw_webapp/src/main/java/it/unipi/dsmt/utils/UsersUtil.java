package it.unipi.dsmt.utils;

import it.unipi.dsmt.dto.Users;

import java.sql.*;
import java.util.ArrayList;

public class UsersUtil {

    public ArrayList<Users> userlist;
    public Users userDTO = null;

    public UsersUtil(String username) throws SQLException{
        Statement stmt = MySQLHandler.getCon().createStatement();
        ResultSet rs = stmt.executeQuery("select * from users INNER JOIN pets_user pu on users.user_id = pu.user_id where username='"
                +username+"'");
        while (rs.next()){
            ArrayList<String> pets = new ArrayList<String>();
            if(rs.getBoolean(12) == true){
                pets.add("dog");
            }
            if(rs.getBoolean(13) == true){
                pets.add("cat");
            }
            if(rs.getBoolean(14) == true){
                pets.add("rabbit");
            }
            if(rs.getBoolean(15) == true){
                pets.add("hamster");
            }
            userDTO = new Users(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,"temp",rs.getBoolean(9),rs.getBoolean(10));
        }
    }

    public UsersUtil(String city, String pet) throws SQLException {
        userlist = new ArrayList<Users>();
        Statement stmt = MySQLHandler.getCon().createStatement();
        ResultSet rs = stmt.executeQuery("select * from users INNER JOIN pets_user pu on users.user_id = pu.user_id where city='"
                +city + "'AND " +  pet +"= TRUE"); //Retrieve all users with that city
        while (rs.next()) {
            ArrayList<String> pets = new ArrayList<String>();
            if(rs.getBoolean(12) == true){
                pets.add("dog");
            }
            if(rs.getBoolean(13) == true){
                pets.add("cat");
            }
            if(rs.getBoolean(14) == true){
                pets.add("rabbit");
            }
            if(rs.getBoolean(15) == true){
                pets.add("hamster");
            }
            Users userDTO = new Users(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,"temp",rs.getBoolean(9),rs.getBoolean(10));
            userlist.add(userDTO);
        }
    }

    public ArrayList<Users> getUserlist() {
        return userlist;
    }

    public Users getUserDTO() {
        return userDTO;
    }
}
