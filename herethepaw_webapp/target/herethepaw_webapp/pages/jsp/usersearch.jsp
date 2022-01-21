<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.UserDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Search page</title>
    <link href="CSS/usersearch.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script>
</head>
<body>
<%
        String city_searched = request.getParameter("city");
        String pet_searched = request.getParameter("pet");
        UserRemoteEJB userRemoteEJB = new UserRemoteEJB();
        ArrayList<UserDTO> filtered_list = userRemoteEJB.getUserList(city_searched,pet_searched);
%>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <table>
        <tr>
            <td><a href="/herethepaw_webapp">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
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
<div class="search_infos"><p><%= filtered_list.size()%> result found with City: <strong>"<%=city_searched%>"</strong> & Pet = <strong>"<%= pet_searched%>"</strong></p></div>
<div class="search_results">
<% for(UserDTO item:filtered_list){ %>
        <div class="first_search_row">
        <p class="username">
            <i class="fas fa-dog"></i><strong><%= item.getUsername()%>: </strong>
        </p>
        <p class="description"><i class="far fa-comment-dots"></i>&nbsp; <%= item.getDescription()%></p>
        <button type="button" onclick="submitsearch('<%=item.getUsername()%>')">See Profile</button>
        <p class="rating"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
        </div>
<% } %>
</div>
<script>
    function submitsearch(username) {
        window.location.href = "UserListServlet?username=" + username ;
    }
</script>
</body>
</html>
