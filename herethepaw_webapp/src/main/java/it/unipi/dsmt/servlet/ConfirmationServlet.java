package it.unipi.dsmt.servlet;

import it.unipi.dsmt.dto.BookingDTO;
import it.unipi.dsmt.ejb.BookingRemoteEJB;
import it.unipi.dsmt.interfaces.BookingRemote;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ConfirmationServlet", value="/confirm_booking")
public class ConfirmationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean accepted = true;
        String booking_id = request.getParameter("booking_id");
        if(request.getParameter("accept_btn") == null){
            accepted = false;
        }
        BookingRemote bookingRemoteEJB;
        try {
            bookingRemoteEJB = new BookingRemoteEJB();
            BookingDTO bookingDTO = bookingRemoteEJB.getBooking(booking_id);
            bookingRemoteEJB.removePendingBooking(bookingDTO,accepted);
        } catch (NamingException | SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/pages/jsp/requests.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
