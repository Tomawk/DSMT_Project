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
    <script type = "text/javascript" src = "websocket_chat.js"></script>
    <link href = "../../CSS/chat.css" rel = "stylesheet" type = "text/css">
</head>
<body onload="connect(<%=userRemoteEJB.getLogged_user().getUsername()%>)">
    <div id = "container">
        <div id = "message_area"></div>
        <textarea placeholder = "Type your message here" type = "text" id = "typed_message"></textarea>
        <button onclick = "send_message(<%=userRemoteEJB.getLogged_user().getUsername()%>)" type = "submit"> Invia Messaggio </button>
    </div>
</body>
</html>
