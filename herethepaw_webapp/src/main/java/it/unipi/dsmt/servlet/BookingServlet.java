package it.unipi.dsmt.servlet;

import it.unipi.dsmt.ejb.BookingRemoteEJB;
import it.unipi.dsmt.interfaces.BookingRemote;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "BookingServlet", value = "/book_petsitter")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String petsitter_id = request.getParameter("pet_sitter");
        String petowner_id = request.getParameter("pet_owner");
        String from_date = request.getParameter("from_date");
        String to_date = request.getParameter("to_date");
        String pet = "dog";
        BookingRemote bookingRemoteEJB;
        try {
            bookingRemoteEJB = new BookingRemoteEJB();
            bookingRemoteEJB.insertPendingBooking(petsitter_id,petowner_id,from_date,to_date,pet);
        } catch (NamingException | SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
