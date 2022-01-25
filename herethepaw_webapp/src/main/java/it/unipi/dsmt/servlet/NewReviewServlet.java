package it.unipi.dsmt.servlet;

import it.unipi.dsmt.ejb.BookingRemoteEJB;
import it.unipi.dsmt.ejb.ReviewRemoteEJB;
import it.unipi.dsmt.interfaces.BookingRemote;
import it.unipi.dsmt.interfaces.ReviewRemote;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.ejb.EJB;
import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.Integer.parseInt;

@WebServlet(name = "NewReviewServlet", value = "/new_review")
public class NewReviewServlet extends HttpServlet {

        @EJB
        private ReviewRemote remoteReviewEJB;
        {
            try {
                remoteReviewEJB = new ReviewRemoteEJB();
            } catch (NamingException e) {
                e.printStackTrace();
            }
        }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String text = request.getParameter("review");
        String pet_owner = request.getParameter("pet_owner");
        String pet_sitter = request.getParameter("pet_sitter");
        int rating = parseInt(request.getParameter("rating"));

        try {
            remoteReviewEJB.insertReview(pet_owner, pet_sitter, text, rating);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath()+"/UserListServlet?username=" + request.getParameter("pet_sitter_user"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
