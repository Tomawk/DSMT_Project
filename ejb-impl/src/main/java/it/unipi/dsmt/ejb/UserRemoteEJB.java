package it.unipi.dsmt.ejb;

import it.unipi.dsmt.UserDTO;
import it.unipi.dsmt.UserRemote;

import javax.ejb.*;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Stateless
public class UserRemoteEJB implements UserRemote {

    private static DataSource dataSource = null;

    public UserRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
    }
    
    @Override
    public UserDTO getUser(String username) throws SQLException {
        UserDTO returned_user = null;
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
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
            returned_user = new UserDTO(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,"temp",rs.getBoolean(9),rs.getBoolean(10));
        }
        return returned_user;
    }

    @Override
    public ArrayList<UserDTO> getUserList(String city, String pet) throws SQLException {
        ArrayList<UserDTO> returned_list = new ArrayList<UserDTO>();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
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
            UserDTO userDTO = new UserDTO(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,"temp",rs.getBoolean(9),rs.getBoolean(10));
            returned_list.add(userDTO);
        }
        return returned_list;
    }

}
