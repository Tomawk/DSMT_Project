<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<%@ page import="javax.naming.NamingException" %>
<%
    UserRemote userRemoteEJB = null;
    try {
        userRemoteEJB = new UserRemoteEJB();
    } catch (NamingException e) {
        e.printStackTrace();
    }
%>
<html>
    <head>
        <title>HereThePaw Chat</title>
        <script type="text/javascript" src="../../javascript/websocket_chat.js"></script>
        <link href = "../../CSS/chat.css" rel = "stylesheet" type = "text/css">
        <link href="../../CSS/index.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script>
    </head>
    <body onload="connect('<%=userRemoteEJB.getLogged_user().getUsername()%>')" onunload="disconnect()">
    <nav class="topnav">
        <img src="images/HereThePaw_Logo.png" alt="logo">
        <table>
            <tr>
                <td><a href="/herethepaw_webapp">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
                <% if(userRemoteEJB.getLogged_user() != null) { %>
                <td><a href="UserListServlet?username=<%=userRemoteEJB.getLogged_user().getUsername()%>"><i class="fas fa-user"></i>&nbsp;<%=userRemoteEJB.getLogged_user().getUsername()%></a></td>
                <td><a href="">Logout</a></td>
                <td><a href="">Booking&nbsp;<i class="far fa-bookmark"></i></a></td>
                <% } else { %>
                <td><a href="">Login</a></td>
                <% } %>
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
        <div id = "container">
            <div id = "message_area"></div>
            <div>
                <label for="select_receiver">Select the online user to send the message to:</label>
                <select name="select_receiver" id="select_receiver">
                    <option value="choose-one" data-placeholder="true" id = "placeholder" disabled selected>Choose one...</option>
                </select>
            </div>
            <div>
                <textarea placeholder = "Type your message here" type = "text" id = "typed_message"></textarea>
                <button onclick = "send_message()" type = "submit"> Invia Messaggio </button>
            </div>
        </div>
    </body>
</html>
