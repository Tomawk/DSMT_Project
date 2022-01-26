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
    </head>
    <body onload="connect('<%=userRemoteEJB.getLogged_user().getUsername()%>')" onunload="disconnect()">
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
