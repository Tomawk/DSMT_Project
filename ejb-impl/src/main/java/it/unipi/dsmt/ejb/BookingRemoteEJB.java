package it.unipi.dsmt.ejb;

import it.unipi.dsmt.interfaces.BookingRemote;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

@Stateless
public class BookingRemoteEJB implements BookingRemote{

    private static DataSource dataSource = null;

    public BookingRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
    }

    @Override
    public void insertPendingBooking(String ps_id,String po_id, String from, String to,String pet_str) throws SQLException {

        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate("INSERT INTO pending_booking (petsitter_id, petowner_id, from_date, to_date, pet)\n" +
                "VALUES (" +"'" + ps_id + "'," +"'" + po_id + "',"+ "'" + from + "'," + "'" + to + "'," + "'" +  pet_str + "'" + ");");
        con.close();
    }

}
