package it.unipi.dsmt.interfaces;

import javax.ejb.Remote;
import java.sql.SQLException;

@Remote
public interface BookingRemote {

    public void insertPendingBooking(String ps_id, String po_id, String from, String to, String pet_str) throws SQLException;
}
