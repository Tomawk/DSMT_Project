package it.unipi.dsmt.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

//TEST SERVLET -- NON SERVE A NIENTE MA MAGARI CI PUO' TORNARE COMODO RECUPERARE DEL CODICE

@WebServlet(name = "TestServlet", value = "/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int a = Integer.parseInt(request.getParameter("a"));
        int b = Integer.parseInt(request.getParameter("b"));
        int result = a + b;
        String msg = "<html><body><h1>The sum is: " + result + "</h1></body></html>";
        PrintWriter writer = response.getWriter();
        writer.write(msg);
        writer.close();

    }
}
