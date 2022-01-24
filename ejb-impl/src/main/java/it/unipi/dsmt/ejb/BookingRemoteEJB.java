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
    public void insertPendingBooking(String ps_id,String ps_us,String po_id, String po_us, String from, String to,String pet_str) throws SQLException {

        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate("INSERT INTO pending_booking (petsitter_id,petsitter_us, petowner_id, petowner_us, from_date, to_date, pet)\n" +
                "VALUES (" +"'" + ps_id + "'," + "'" + ps_us + "'," + "'" + po_id  + "'," +"'" + po_us + "',"+ "'" + from + "'," + "'" + to + "'," + "'" +  pet_str + "'" + ");");
        con.close();
    }

    @Override
    public ArrayList<BookingDTO> displayPendingBooking(String petowner_us) throws SQLException{
        ArrayList<BookingDTO> returned_list = new ArrayList<>();
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from pending_booking where petowner_us='"+petowner_us+"'");
        while (rs.next()) {
            BookingDTO bookingDTO = new BookingDTO(rs.getString(5),rs.getString(3),rs.getString(6)
                    ,rs.getString(7),rs.getString(8));
            returned_list.add(bookingDTO);
        }
        con.close();
        return returned_list;

    }

}
