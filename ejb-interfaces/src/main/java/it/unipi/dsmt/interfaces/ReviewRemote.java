package it.unipi.dsmt.interfaces;

import it.unipi.dsmt.dto.ReviewDTO;
import it.unipi.dsmt.dto.UserDTO;

import javax.ejb.Remote;
import java.sql.SQLException;
import java.util.ArrayList;

@Remote
public interface ReviewRemote {
    public ArrayList<ReviewDTO> getPetSitterReviewList(String petSitter) throws SQLException;
}
