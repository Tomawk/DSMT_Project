package it.unipi.dsmt.ejb;

import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.interfaces.UserRemote;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@Stateless
public class UserRemoteEJB implements UserRemote {

    private static DataSource dataSource = null;
    private static UserDTO logged_user = null;

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
            if(rs.getBoolean(13) == true){
                pets.add("dog");
            }
            if(rs.getBoolean(14) == true){
                pets.add("cat");
            }
            if(rs.getBoolean(15) == true){
                pets.add("rabbit");
            }
            if(rs.getBoolean(16) == true){
                pets.add("hamster");
            }
            returned_user = new UserDTO(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,rs.getString(11),rs.getBoolean(9),rs.getBoolean(10));
        }
        return returned_user;
    }

    @Override
    public ArrayList<UserDTO> getUserList(String city, String pet) throws SQLException {
        ArrayList<UserDTO> returned_list = new ArrayList<UserDTO>();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        if(city.equals("")){
            rs = stmt.executeQuery("select * from users INNER JOIN pets_user pu on users.user_id = pu.user_id where "
                    +pet +"= TRUE AND users.petsitter = 1"); //Retrieve all users with that pet in all cities
        }
        else{
            rs = stmt.executeQuery("select * from users INNER JOIN pets_user pu on users.user_id = pu.user_id where city='"
                    +city + "'AND " +  pet +"= TRUE AND users.petsitter = 1"); //Retrieve all users with that city
        }

        while (rs.next()) {
            ArrayList<String> pets = new ArrayList<String>();
            if(rs.getBoolean(13) == true){
                pets.add("dog");
            }
            if(rs.getBoolean(14) == true){
                pets.add("cat");
            }
            if(rs.getBoolean(15) == true){
                pets.add("rabbit");
            }
            if(rs.getBoolean(16) == true){
                pets.add("hamster");
            }
            UserDTO userDTO = new UserDTO(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,rs.getString(11),rs.getBoolean(9),rs.getBoolean(10));
            returned_list.add(userDTO);
        }
        con.close();
        return returned_list;
    }

    @Override
    public void loginUser(String username, String password) throws SQLException {
        //UserDTO return_user = null;
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from users INNER JOIN pets_user pu on users.user_id = pu.user_id where username='"
                + username + "'AND password='" + password + "'");
        while(rs.next()){
            ArrayList<String> pets = new ArrayList<String>();
            if(rs.getBoolean(13) == true){
                pets.add("dog");
            }
            if(rs.getBoolean(14) == true){
                pets.add("cat");
            }
            if(rs.getBoolean(15) == true){
                pets.add("rabbit");
            }
            if(rs.getBoolean(16) == true){
                pets.add("hamster");
            }
            logged_user = new UserDTO(rs.getString(1),rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getString(8),pets,rs.getString(11),rs.getBoolean(9),rs.getBoolean(10));
        }
        con.close();
        return;
        //return return_user;
    }

    public static UserDTO getLogged_user() {
        return logged_user;
    }

    public static void setLogged_user(UserDTO logged_user) {
        UserRemoteEJB.logged_user = logged_user;
    }
}
