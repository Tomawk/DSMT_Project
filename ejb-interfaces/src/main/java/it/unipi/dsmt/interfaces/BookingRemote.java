package it.unipi.dsmt.interfaces;

import it.unipi.dsmt.dto.BookingDTO;

import javax.ejb.Remote;
import java.sql.SQLException;
import java.util.ArrayList;

@Remote
public interface BookingRemote {

    public void insertPendingBooking(String ps_id, String ps_us, String po_id, String po_us, String from, String to, String pet_str) throws SQLException;
    public ArrayList<BookingDTO> displayPendingBooking(String petowner_us) throws SQLException;
}
