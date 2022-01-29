<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HereThePaw Petsitters</title>
    <link rel="icon" href="images/paw_icon.png" sizes="32x32">
    <link href="CSS/index.css" rel="stylesheet" type="text/css">
    <link href="fontawesome/css/all.css" rel="stylesheet"> 
</head>
<body>
<% UserRemote userRemoteEJB = new UserRemoteEJB(); %>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <% if(userRemoteEJB.getLogged_user() == null){ %>
    <table style="position:relative; left:80vw;">
        <% } else {%>
            <table style="position:relative; left:62vw;">
                <% } %>
        <tr>
            <td><a onclick="scrollup()">Home</a></td>

            <%
                if(userRemoteEJB.getLogged_user() != null){ %>
                <td><a href="chat">Chat</a></td>
                <td><a href="UserListServlet?username=<%=userRemoteEJB.getLogged_user().getUsername()%>"><i class="fas fa-user"></i>&nbsp;<%=userRemoteEJB.getLogged_user().getUsername()%></a></td>
                <td><a href="logout">Logout</a></td>
                <td><a href="pages/jsp/requests.jsp">Booking&nbsp;<i class="far fa-bookmark"></i></a></td>
            <% } else {%>
                 <td><a href="pages/jsp/login.jsp">Login</a></td>
            <%} %>
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
<div class="image_div">
    <div class="search_div">
        <div class="pet_search">
            <h2><i class="fas fa-dog"></i> Pets</h2>
            <select name="pets" id="pets">
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
                <option value="rabbit">Rabbit</option>
                <option value="hamster">Hamster</option>
            </select>
        </div>
        <div class="location_search">
            <h2><i class="fas fa-search"></i> Where</h2>
            <input type="text" placeholder="Location" id="location">
        </div>
        <div class="confirmation_search">
            <button type="submit" onclick="submitsearch()">Search Now</button>
        </div>
    </div>
</div>
<hr>
<div class="info_div">
    <h1> Here is how HereThePaw service works.</h1>
    <h2> Search and connect with trusted pet sitters. It's easy as 1, 2, 3. </h2>
    <div class="infos">
        <div class="info_1">
            <h3><i class="fas fa-search"></i>&nbsp;&nbsp;1. Find a verified pet sitter</h3>
            <p>Search and find experienced local pet sitters nearby</p>
        </div>
        <div class="info_2">
            <h3><i class="far fa-calendar-alt"></i>&nbsp;&nbsp;2. Arrange a meet & greet online</h3>
            <p>Get to know your sitter online, obligation-free.</p>
        </div>
        <div class="info_3">
            <h3><i class="far fa-credit-card"></i>&nbsp;&nbsp;3. Pay online</h3>
            <p>Book your sitter through our safe online system, with flexible cancellations in case your plans change.</p>
        </div>
    </div>
</div>
<script>
    function submitsearch() {
        var pets_selection = document.getElementById("pets");
        var pet_searched = pets_selection.value;
        var city_searched = document.getElementById("location").value;
        window.location.href = "search_user?city=" + city_searched + "&pet=" + pet_searched;
    }
    function scrollup() {
        window.scrollTo(0,0);
    }
</script>
</body>
</html>
