package it.unipi.dsmt.ejb;

import it.unipi.dsmt.dto.ReviewDTO;
import it.unipi.dsmt.ejb.entities.Reviews;
import it.unipi.dsmt.ejb.entities.Users;
import it.unipi.dsmt.interfaces.ReviewRemote;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Stateless
public class ReviewRemoteEJB implements ReviewRemote {

    private static DataSource dataSource = null;

    @PersistenceContext
    private EntityManager entityManager;

    public ReviewRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dsmt_projectPU");
        entityManager = emf.createEntityManager();
    }

    public ArrayList<ReviewDTO> getPetSitterReviewList(String petSitter) throws SQLException {
        ArrayList<ReviewDTO> returned_list = new ArrayList<ReviewDTO>();
        Users user = entityManager.createQuery(
                "SELECT u from Users u WHERE u.username = :username", Users.class).
                setParameter("username", petSitter).getSingleResult();
        List<Reviews> reviews_list = entityManager.createQuery(
                "SELECT u from Reviews u WHERE u.petsitter = :petsitter_id", Reviews.class).
                setParameter("petsitter_id", user.getUser_id()).getResultList();
        for(Reviews item:reviews_list){
            Users owner = entityManager.find(Users.class,item.getOwner());
            ReviewDTO reviewDTO = new ReviewDTO(item.getId(),item.getOwner(),owner.getUsername(),item.getPetsitter(),item.getText(),item.getRating(),item.getTimestamp());
            returned_list.add(reviewDTO);
        }
        return returned_list;
    }

    @Override
    public void insertReview(String owner, String pet_sitter, String text, int rating) throws SQLException {

        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        Timestamp now = new Timestamp(System.currentTimeMillis());

        stmt.executeUpdate("INSERT INTO review (owner, pet_sitter, text, rating, timestamp)\n" +
                        "VALUES ( '" + owner  + "', '" + pet_sitter + "', '" + text + "'," + rating + ", '" + now + "');"); //Retrieve all review about this pet sitter

        con.close();
    }


    @Override
    public float computeAvgRating(String petSitter) throws SQLException {;
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select AVG(r.rating) from review r inner join users u1  where r.pet_sitter = " +
                "u1.user_id AND u1.username = '" + petSitter + "' "); //Retrieve all rating about this pet sitter
        System.out.println(rs);
        if(rs.next()){
            con.close();
            return rs.getFloat(1);
        }else {
            con.close();
            return 0;
        }
    }


    }