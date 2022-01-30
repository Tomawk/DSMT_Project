package it.unipi.dsmt.servlet;

import it.unipi.dsmt.ejb.UserRemoteEJB;
import it.unipi.dsmt.interfaces.UserRemote;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javax.ejb.EJB;
import javax.naming.NamingException;
import java.io.IOException;

@WebServlet(name = "ChatServlet", value = "/chat")
public class ChatServlet extends HttpServlet {
    @EJB
    UserRemote userRemote;
    {
        try {
            userRemote = new UserRemoteEJB();
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String targetJSP = "/pages/jsp/chat.jsp";
        HttpSession session = request.getSession();
        if(session.getAttribute("logged_user") == null)
            //the user has to be logged in to enter the chat
            targetJSP = "pages/jsp/login.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetJSP);
        requestDispatcher.forward(request,response);

    }
}
