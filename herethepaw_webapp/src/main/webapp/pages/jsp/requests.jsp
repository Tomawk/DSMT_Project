<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<%@ page import="it.unipi.dsmt.interfaces.BookingRemote" %>
<%@ page import="it.unipi.dsmt.ejb.BookingRemoteEJB" %>
<%@ page import="it.unipi.dsmt.dto.BookingDTO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Tommy
  Date: 24/01/2022
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User page</title>
    <link href="../../CSS/requests.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script>
</head>
<body>
<%
    UserRemote userRemoteEJB = new UserRemoteEJB();
    BookingRemote bookingRemoteEJB = new BookingRemoteEJB();
    ArrayList<BookingDTO> booking_list = bookingRemoteEJB.displayPendingBooking(userRemoteEJB.getLogged_user().getUsername());
%>
<nav class="topnav">
<img src="../../images/HereThePaw_Logo.png" alt="logo">
<table>
    <tr>
        <td><a href="/herethepaw_webapp">Home</a></td>
        <td><a href="/herethepaw_webapp/UserListServlet?username=<%=userRemoteEJB.getLogged_user().getUsername()%>"><i class="fas fa-user"></i>&nbsp;<%=userRemoteEJB.getLogged_user().getUsername()%></a></td>
        <td><a href="/herethepaw_webapp/logout">Logout</a></td>
    </tr>
</table>
</nav>
<aside class="rightnav">
    <table>
        <tr>
            <td id="facebook"></td>
        </tr>
        <tr>
            <td id="instagram"></td>
        </tr>
        <tr>
            <td id="google"></td>
        </tr>
    </table>
</aside>
<div id="main_div">
    <h1>Pending Booking Requests Sent:</h1>
    <% for(BookingDTO item:booking_list){%>
        <div class="div_book">
            <strong>Sender&nbsp;<i class="fas fa-user"></i>:&nbsp;</strong><%=item.getPo_username()%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>Receiver&nbsp;<i class="fas fa-user-tie"></i>:&nbsp;</strong><%=item.getPs_username()%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong style="color: limegreen;">From&nbsp;<i class="fas fa-calendar-check"></i>:&nbsp;</strong><%=item.getDate_from()%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong style="color: dodgerblue;">To&nbsp;<i class="fas fa-calendar-check"></i>:&nbsp;</strong><%=item.getDate_to()%>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>Pet&nbsp;<i class="fas fa-paw"></i>:&nbsp;</strong><%=item.getPet()%>
        </div>
    <% } %>
</div>
</body>
</html>
