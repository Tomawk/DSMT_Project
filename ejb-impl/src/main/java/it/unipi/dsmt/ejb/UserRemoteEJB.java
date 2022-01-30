package it.unipi.dsmt.ejb;

import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.ejb.entities.Users;
import it.unipi.dsmt.interfaces.UserRemote;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Stateless
public class UserRemoteEJB implements UserRemote {

    private static DataSource dataSource = null;

    @PersistenceContext
    private EntityManager entityManager;

    public UserRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dsmt_projectPU");
        entityManager = emf.createEntityManager();
    }

    @Override
    public UserDTO getUser(String username) throws SQLException{
        Users user = entityManager.createQuery(
                "SELECT u from Users u WHERE u.username = :username", Users.class).
                setParameter("username", username).getSingleResult();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from pets_user where user_id='" + user.getUser_id() + "'");
        ArrayList<String> pets = new ArrayList<>();
        if(rs.next()){
            if(rs.getBoolean(2)) pets.add("dog");
            if(rs.getBoolean(3)) pets.add("cat");
            if(rs.getBoolean(4)) pets.add("rabbit");
            if(rs.getBoolean(5)) pets.add("hamster");
        }
        UserDTO userDTO = new UserDTO(user.getUser_id(),user.getName(),user.getSurname(),user.getUsername(),
                user.getEmail(),user.getCity(),user.getPostal_code(),user.getDescription(),pets,user.getPassword(),user.getPetsitter(),user.getMale());
        con.close();
        return userDTO;
    }

    @Override
    public ArrayList<UserDTO> getUserList(String city, String pet) throws SQLException{
        ArrayList<UserDTO> returned_list = new ArrayList<UserDTO>();
        Connection con = dataSource.getConnection();
        Statement stms = con.createStatement();
        ResultSet rs = stms.executeQuery("select * from pets_user where " + pet + "=TRUE");
        while (rs.next()){
            ArrayList<String> pets = new ArrayList<String>();
            String user_id = rs.getString(1);
            if(rs.getBoolean(2)) pets.add("dog");
            if(rs.getBoolean(3)) pets.add("cat");
            if(rs.getBoolean(4)) pets.add("rabbit");
            if(rs.getBoolean(5)) pets.add("hamster");
            Users user = entityManager.find(Users.class,user_id);
            UserDTO userDTO = new UserDTO(user.getUser_id(),user.getName(),user.getSurname(),user.getUsername(),
                    user.getEmail(),user.getCity(),user.getPostal_code(),user.getDescription(),pets,user.getPassword(),user.getPetsitter(),user.getMale());
            if(city.equals("") && userDTO.isPetsitter()) returned_list.add(userDTO);
            if(userDTO.getCity().equals(city) && !city.equals("") && userDTO.isPetsitter()) returned_list.add(userDTO);
        }
        con.close();
        return  returned_list;
    }

    @Override
    public ArrayList<UserDTO> getAllUserList() throws SQLException{
        ArrayList<UserDTO> returned_list = new ArrayList<UserDTO>();
        Connection con = dataSource.getConnection();
        Statement stms = con.createStatement();
        ResultSet rs = stms.executeQuery("select * from users");
        while (rs.next()){
            ArrayList<String> pets = new ArrayList<String>();
            String user_id = rs.getString(1);
            if(rs.getBoolean(2)) pets.add("dog");
            if(rs.getBoolean(3)) pets.add("cat");
            if(rs.getBoolean(4)) pets.add("rabbit");
            if(rs.getBoolean(5)) pets.add("hamster");
            Users user = entityManager.find(Users.class,user_id);
            UserDTO userDTO = new UserDTO(user.getUser_id(),user.getName(),user.getSurname(),user.getUsername(),
                    user.getEmail(),user.getCity(),user.getPostal_code(),user.getDescription(),pets,user.getPassword(),user.getPetsitter(),user.getMale());
            returned_list.add(userDTO);
        }
        con.close();
        return  returned_list;
    }

    @Override
    public UserDTO loginUser(String username, String password) throws SQLException {
        Users user = null;

        try{
            user = entityManager.createQuery(
                    "SELECT u from Users u WHERE u.username = :username", Users.class).
                    setParameter("username", username).getSingleResult();
        } catch (NoResultException e){
            return null;
        }

        if(user.getPassword().equals(password)){
            Connection con = dataSource.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from pets_user where user_id='"+ user.getUser_id() + "'");
            ArrayList<String> pets = new ArrayList<String>();
            if(rs.next()){
                if(rs.getBoolean(2)) pets.add("dog");
                if(rs.getBoolean(3)) pets.add("cat");
                if(rs.getBoolean(4)) pets.add("rabbit");
                if(rs.getBoolean(5)) pets.add("hamster");
            }
            UserDTO logged_user = new UserDTO(user.getUser_id(),user.getName(),user.getSurname(),user.getUsername(),
                    user.getEmail(),user.getCity(),user.getPostal_code(),user.getDescription(),pets,user.getPassword(),user.getPetsitter(),user.getMale());
            return logged_user;
        } else return null;
    }

}
