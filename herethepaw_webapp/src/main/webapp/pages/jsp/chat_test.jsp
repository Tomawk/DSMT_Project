<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.net.InetAddress" %><%--
  Created by IntelliJ IDEA.
  User: Tommy
  Date: 27/01/2022
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserRemote userRemoteEJB = null;
    try {
        userRemoteEJB = new UserRemoteEJB();
    } catch (NamingException e) {
        e.printStackTrace();
    }
    String actual_ip = InetAddress.getLocalHost().getHostAddress();
%>
<html>
<head>
    <title>Chat Test</title>
    <link href="../../fontawesome/css/all.css" rel="stylesheet">
    <link href="../../CSS/chat.css" rel="stylesheet" type="text/css">
    <link href="../../CSS/chat_test.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../../javascript/websocket_chat.js"></script>
</head>
<body onload="connect('<%=userRemoteEJB.getLogged_user().getUsername()%>')" onunload="disconnect()">
<nav class="topnav">
    <img src="../../images/HereThePaw_Logo.png" alt="logo">
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
<div class='container'>
    <h1>HereThePaw Chatbox&nbsp;<i class="far fa-comments"></i></h1>
    <div class='chatbox'>
        <div class='chatbox__user-list'>
            <h1>User list</h1>
            <!-- Lista utenti dove andare ad inserire i nomi di tutti o di quelli online
                 se vuoi solo gli utenti online usa il div con --active che ti compare il bollino verde
                 altrimenti se decidi di metterli entrambi puoi usare anche il bollino rosso usando --busy
                 -->
            <div class='chatbox__user--active'>
                <p>Jack Thomson</p>
            </div>
            <div class='chatbox__user--busy'>
                <p>Angelina Jolie</p>
            </div>
            <div class='chatbox__user--active'>
                <p>George Clooney</p>
            </div>
            <div class='chatbox__user--active'>
                <p>Seth Rogen</p>
            </div>
            <div class='chatbox__user--away'>
                <p>John Lydon</p>
            </div>
        </div>
        <div class="chatbox__messages">
            <div class="chatbox__messages__user-message">
                <div class="chatbox__messages__user-message--right-message">
                    <p class="name">{{message.Name1}}</p>
                    <br/>
                    <p class="message">{{message.Message1}}</p>
                </div>
            </div>
            <div class="chatbox__messages__user-message">
                <div class="chatbox__messages__user-message--left-message">
                    <!-- A seconda se vuoi che il messaggio venga da destra o da sinistra devi usare l'apposito div con
                          --left-message se vuoi che venga da sinistra, --right-message se vuoi che venga da destra -->
                    <p class="name">{{message.Name1}}</p>
                    <br/>
                    <p class="message">{{message.Message1}}</p>
                </div>
            </div>
        </div>
        <form>
            <input type="text" placeholder="Enter your message">
        </form>
    </div>
</div>
</body>
</html>
