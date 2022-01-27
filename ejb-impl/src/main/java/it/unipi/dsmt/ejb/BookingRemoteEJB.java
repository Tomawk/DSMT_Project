package it.unipi.dsmt.ejb;

import it.unipi.dsmt.dto.BookingDTO;
import it.unipi.dsmt.ejb.entities.Booking;
import it.unipi.dsmt.interfaces.BookingRemote;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Stateless
public class BookingRemoteEJB implements BookingRemote{

    private static DataSource dataSource = null;

    @PersistenceContext
    private EntityManager entityManager;

    public BookingRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("dsmt_projectPU");
        entityManager = emf.createEntityManager();
    }

    @Override
    public void insertPendingBooking(String ps_id,String ps_us,String po_id, String po_us, String from, String to,String pet_str) throws SQLException {

        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate("INSERT INTO booking (petowner_id,petowner_username, petsitter_id, petsitter_username, from_date, to_date, pet,status)\n" +
                "VALUES (" +"'" + po_id + "'," + "'" + po_us + "'," + "'" + ps_id  + "'," +"'" + ps_us + "',"+ "'" + from + "'," + "'" + to + "'," + "'" +  pet_str + "'," + "'pending');");
        con.close();
    }

    @Override
    public ArrayList<BookingDTO> displayBooking(String username, boolean petsitter, boolean pending) throws SQLException {
        String petowner_us = null;
        String petsitter_us = null;
        if(petsitter)  petsitter_us = username;
        else petowner_us = username;
        ArrayList<BookingDTO> returned_list = new ArrayList<BookingDTO>();
        if(petsitter){
            List<Booking> bookings = entityManager.createQuery(
                    "SELECT u from Booking u WHERE u.ps_us = :username", Booking.class).
                    setParameter("username", petsitter_us).getResultList();
            for(Booking item: bookings){
                if(pending){
                    if(item.getStatus().equals("pending")) {
                        BookingDTO bookingDTO = new BookingDTO(item.getPo_us(), item.getPs_us(), item.getFrom(), item.getTo(), item.getPet());
                        bookingDTO.setPo_id(item.getPo_id());
                        bookingDTO.setPs_id(item.getPs_id());
                        bookingDTO.setBooking_id(item.getId().toString());
                        bookingDTO.setAccepted("pending");
                        returned_list.add(bookingDTO);
                    }
                } else{
                    if(!item.getStatus().equals("pending")) {
                        BookingDTO bookingDTO = new BookingDTO(item.getPo_us(), item.getPs_us(), item.getFrom(), item.getTo(), item.getPet());
                        bookingDTO.setPo_id(item.getPo_id());
                        bookingDTO.setPs_id(item.getPs_id());
                        bookingDTO.setBooking_id(item.getId().toString());
                        bookingDTO.setAccepted(item.getStatus());
                        returned_list.add(bookingDTO);
                    }
                }
            }
        }else{
            List<Booking> bookings = entityManager.createQuery(
                    "SELECT u from Booking u WHERE u.po_us = :username", Booking.class).
                    setParameter("username", petowner_us).getResultList();
            for(Booking item: bookings){
                if(pending){
                    if(item.getStatus().equals("pending")) {
                        BookingDTO bookingDTO = new BookingDTO(item.getPo_us(), item.getPs_us(), item.getFrom(), item.getTo(), item.getPet());
                        bookingDTO.setPo_id(item.getPo_id());
                        bookingDTO.setPs_id(item.getPs_id());
                        bookingDTO.setBooking_id(item.getId().toString());
                        bookingDTO.setAccepted("pending");
                        returned_list.add(bookingDTO);
                    }
                } else {
                    if(!item.getStatus().equals("pending")) {
                        BookingDTO bookingDTO = new BookingDTO(item.getPo_us(), item.getPs_us(), item.getFrom(), item.getTo(), item.getPet());
                        bookingDTO.setPo_id(item.getPo_id());
                        bookingDTO.setPs_id(item.getPs_id());
                        bookingDTO.setBooking_id(item.getId().toString());
                        bookingDTO.setAccepted(item.getStatus());
                        returned_list.add(bookingDTO);
                    }
                }

            }
        }
        return returned_list;
    }

    @Override
    public void removePendingBooking(String booking_id, boolean accepted) throws SQLException{
        String status = null;
        if(accepted) status = "accepted";
            else status = "declined";
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate("UPDATE booking SET status='"+status+"' WHERE id_=" + booking_id);
        con.close();
    }

    @Override
    public boolean searchBooking(String owner, String petSitter) throws SQLException{
        List<Booking> confirmedBookings = entityManager.createQuery(
                        "SELECT u from Booking u WHERE u.po_id = :id_o AND u.ps_id = :id_p", Booking.class).
                setParameter("id_o", owner).setParameter("id_p", petSitter).getResultList();
        if(confirmedBookings.isEmpty())
            return false;
        return true;

    }

}
