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
        String petsitter_id = request.getParameter("pet_sitter_id");
        String petowner_id = request.getParameter("pet_owner_id");
        String petsitter_us = request.getParameter("pet_sitter_us");
        String petowner_us = request.getParameter("pet_owner_us");
        String from_date = request.getParameter("from_date");

        String to_date = request.getParameter("to_date");

        if(from_date == null || to_date == null) {
            response.sendRedirect(request.getContextPath()+"/pages/BookingError.html");
            return;
        }

        String pet = request.getParameter("pets");

        BookingRemote bookingRemoteEJB;
        try {
            bookingRemoteEJB = new BookingRemoteEJB();
            bookingRemoteEJB.insertPendingBooking(petsitter_id,petsitter_us,petowner_id,petowner_us,from_date,to_date,pet);
        } catch (NamingException | SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/pages/BookingSent.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
