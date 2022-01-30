package it.unipi.dsmt.servlet;

import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.ejb.UserRemoteEJB;
import it.unipi.dsmt.ejb.entities.Users;
import it.unipi.dsmt.interfaces.UserRemote;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet",value = "/login")
public class LoginServlet extends HttpServlet {
    private UserRemote userRemoteEJB;

    {
        try {
            userRemoteEJB = new UserRemoteEJB();
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username_ = request.getParameter("username");
        String password_ = request.getParameter("password");
        UserDTO logged_user = null;

        try {
            userRemoteEJB = new UserRemoteEJB();
            logged_user = userRemoteEJB.loginUser(username_,password_);
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        session.setAttribute("logged_user", logged_user);
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
