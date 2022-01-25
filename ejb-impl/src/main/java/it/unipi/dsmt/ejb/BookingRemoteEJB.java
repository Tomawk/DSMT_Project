package it.unipi.dsmt.ejb;

import it.unipi.dsmt.dto.BookingDTO;
import it.unipi.dsmt.interfaces.BookingRemote;

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
public class BookingRemoteEJB implements BookingRemote{

    private static DataSource dataSource = null;

    public BookingRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
    }

    @Override
    public BookingDTO getBooking(String booking_id) throws SQLException{
        BookingDTO returnedBooking = null;
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from pending_booking where id_="+booking_id);
        con.close();
        if(rs.next()) {
            returnedBooking = new BookingDTO(rs.getString(5), rs.getString(3), rs.getString(6)
                    , rs.getString(7), rs.getString(8));
            returnedBooking.setPo_id(rs.getString(4));
            returnedBooking.setPs_id(rs.getString(2));
            returnedBooking.setBooking_id(rs.getString(1));
        }
        return returnedBooking;
    }

    @Override
    public void insertPendingBooking(String ps_id,String ps_us,String po_id, String po_us, String from, String to,String pet_str) throws SQLException {

        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate("INSERT INTO pending_booking (petsitter_id,petsitter_us, petowner_id, petowner_us, from_date, to_date, pet)\n" +
                "VALUES (" +"'" + ps_id + "'," + "'" + ps_us + "'," + "'" + po_id  + "'," +"'" + po_us + "',"+ "'" + from + "'," + "'" + to + "'," + "'" +  pet_str + "'" + ");");
        con.close();
    }

    @Override
    public ArrayList<BookingDTO> displayPendingBooking(String username, boolean petsitter) throws SQLException{
        String petowner_us = null;
        String petsitter_us = null;
        if(petsitter)  petsitter_us = username;
            else petowner_us = username;
        ArrayList<BookingDTO> returned_list = new ArrayList<>();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        if(petsitter){
             rs = stmt.executeQuery("select * from pending_booking where petsitter_us='"+petsitter_us+"'");
        } else {
             rs = stmt.executeQuery("select * from pending_booking where petowner_us='"+petowner_us+"'");
        }
        while (rs.next()) {
            BookingDTO bookingDTO = new BookingDTO(rs.getString(5),rs.getString(3),rs.getString(6)
                    ,rs.getString(7),rs.getString(8));
            bookingDTO.setPo_id(rs.getString(4));
            bookingDTO.setPs_id(rs.getString(2));
            bookingDTO.setBooking_id(rs.getString(1));
            returned_list.add(bookingDTO);
        }
        con.close();
        return returned_list;

    }

    @Override
    public ArrayList<BookingDTO> displayConfirmedBooking(String username, boolean petsitter) throws SQLException{
        String petowner_us = null;
        String petsitter_us = null;
        if(petsitter)  petsitter_us = username;
        else petowner_us = username;
        ArrayList<BookingDTO> returned_list = new ArrayList<>();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = null;
        if(petsitter){
            rs = stmt.executeQuery("select * from confirmed_booking where petsitter_username='"+petsitter_us+"'");
        } else {
            rs = stmt.executeQuery("select * from confirmed_booking where petowner_username='"+petowner_us+"'");
        }
        while (rs.next()) {
            BookingDTO bookingDTO = new BookingDTO(rs.getString(3),rs.getString(5),rs.getString(6)
                    ,rs.getString(7),rs.getString(8));
            bookingDTO.setPo_id(rs.getString(2));
            bookingDTO.setPs_id(rs.getString(4));
            bookingDTO.setBooking_id(rs.getString(1));
            bookingDTO.setAccepted(rs.getString(9));
            returned_list.add(bookingDTO);
        }
        con.close();
        return returned_list;

    }

    @Override
    public void removePendingBooking(BookingDTO bookingDTO, boolean accepted) throws SQLException{
        String status = null;
        if(accepted) status = "accepted";
            else status = "declined";
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate("delete from pending_booking where id_=" + bookingDTO.getBooking_id());
        stmt.executeUpdate("INSERT INTO confirmed_booking (petowner_id,petowner_username, petsitter_id, petsitter_username, from_date, to_date, pet,status)\n" +
                "VALUES (" +"'" + bookingDTO.getPo_id() + "'," + "'" + bookingDTO.getPo_username() + "'," + "'" + bookingDTO.getPs_id()  + "'," +"'" + bookingDTO.getPs_username() + "',"+ "'" + bookingDTO.getDate_from() + "'," + "'" + bookingDTO.getDate_to() + "'," + "'" +  bookingDTO.getPet() + "'," + "'" +  status + "'" + ");");
        con.close();
        return;
    }

}
