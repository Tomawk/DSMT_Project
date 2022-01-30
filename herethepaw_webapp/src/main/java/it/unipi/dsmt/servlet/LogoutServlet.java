package it.unipi.dsmt.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.naming.NamingException;
import java.io.IOException;

@WebServlet(name = "LogoutServlet",value="/logout")
public class LogoutServlet extends HttpServlet {

    public LogoutServlet() throws NamingException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        //userRemoteEJB.setLogged_user(null);
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}
