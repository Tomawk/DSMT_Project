<%@ page import="it.unipi.dsmt.dto.UserDTO" %>
<%@ page import="it.unipi.dsmt.utils.UserPagesUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User page</title>
    <link href="CSS/userpage.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script>
</head>
<body>
<%
    String requested_user = request.getParameter("username");
    UserDTO target_user = UserPagesUtil.byUsername(requested_user);
%>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <table>
        <tr>
            <td><a href="/HereThePaw_DSMT_Project_war">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
            <td><a href="#hr1">Pets</a></td>
            <td><a href="#hr2">My Profile</a></td>
            <td><a href="#contatti">Reviews</a></td>
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
<div id="center_div">
    <div id="image">
        <% if(target_user.isMale()){ %>
            <img src="images/avatar_male.png" alt="avatar">
        <% } else {%>
            <img src="images/avatar_female.png" alt="avatar">
        <% } %>
    </div>
    <p id= "username"><strong><%= target_user.getUsername()%></strong></p>
    <% if(target_user.isPetsitter()){ %>
        <p id="petsitter"><strong><i class="far fa-check-circle"></i>&nbsp;Verified pet sitter </strong></p>
    <% } else {%>
        <p id="petsitter"><strong><i class="fas fa-user"></i>&nbsp;Registered user</strong></p>
    <% } %>
    <p id= "name"><strong>Name: </strong><%=target_user.getName()%></p>
    <p id= "cognome"><strong>Surname: </strong><%=target_user.getSurname()%></p>
    <p id= "email"><strong>Email: </strong><%=target_user.getEmail()%></p>
    <p id= "citta"><strong>City: </strong><%=target_user.getCity()%></p>
    <p id= "cap"><strong>ZIP Code: </strong><%=target_user.getPostal_code()%></p>
    <p id= "description">"<%=target_user.getDescription()%>"</p>
</div>
</body>
</html>