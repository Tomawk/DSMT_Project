<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.dto.UserDTO" %>
<%@ page import="it.unipi.dsmt.ejb.ReviewRemoteEJB" %>
<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<%@ page import="it.unipi.dsmt.interfaces.ReviewRemote" %>

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
        UserRemote userRemoteEJB = new UserRemoteEJB();
        ArrayList<UserDTO> filtered_list = userRemoteEJB.getUserList(city_searched,pet_searched);
        if(city_searched.equals(""))
            city_searched = "All";
    ReviewRemote reviewRemoteEJB = new ReviewRemoteEJB();
    float avgRating = 0;
%>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <table>
        <tr>
            <td><a href="/herethepaw_webapp">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
            <% if(userRemoteEJB.getLogged_user() != null) { %>
                <td><a href="UserListServlet?username=<%=userRemoteEJB.getLogged_user().getUsername()%>"><i class="fas fa-user"></i>&nbsp;<%=userRemoteEJB.getLogged_user().getUsername()%></a></td>
                <td><a href="logout">Logout</a></td>
                <td><a href="pages/jsp/requests.jsp">Booking&nbsp;<i class="far fa-bookmark"></i></a></td>
            <% } else { %>
                <td><a href="pages/jsp/login.jsp">Login</a></td>
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
<div class="search_infos"><p><%= filtered_list.size()%> result found with City: <strong>"<%=city_searched%>"</strong> & Pet = <strong>"<%= pet_searched%>"</strong></p></div>
<div class="search_results">
<% for(UserDTO item:filtered_list){
         avgRating = reviewRemoteEJB.computeAvgRating(item.getUsername());
%>
        <div class="first_search_row">
            <p class="username">
                <i class="fas fa-dog"></i><strong><%= item.getUsername()%>: </strong>
            </p>
            <p class="description"><i class="far fa-comment-dots"></i>&nbsp; <%= item.getDescription()%></p>
            <button type="button" onclick="submitsearch('<%=item.getUsername()%>')">See Profile</button>
            <div class="star-rating" data-rating= <%= avgRating %>>

                <div class="empty-stars">
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                </div>

                <div class="full-stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </div>
<% } %>
</div>
<script>
    function submitsearch(username) {
        window.location.href = "UserListServlet?username=" + username ;
    }

    var starRatings = document.querySelectorAll('.star-rating');
        for (var index = 0; index < starRatings.length; index++) {
            var starRating = starRatings[index],
                fullStars = starRating.querySelector('.full-stars'),
                rating = parseFloat(starRating.dataset.rating) || 0,
                percentWidth = rating * 20;
            fullStars.style.width = percentWidth + '%';
        }
</script>
</body>
</html>
