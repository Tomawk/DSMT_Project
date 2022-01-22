<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.ejb.ReviewRemoteEJB" %>
<%@ page import="it.unipi.dsmt.dto.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unipi.dsmt.dto.ReviewDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User page</title>
    <link href="CSS/userpage.css" rel="stylesheet" type="text/css">
    <link href="CSS/calendar.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/a30f811c28.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/gh/jquery/jquery@3.2.1/dist/jquery.min.js"></script>
    <!-- change to relative path -> something like this <script src="/javascript/calendar.js"></script> -->
    <script src="https://cdn.jsdelivr.net/gh/wrick17/calendar-plugin@master/calendar.min.js"></script>
</head>
<body>
<%
    String requested_user = request.getParameter("username");
    UserRemoteEJB userRemoteEJB = new UserRemoteEJB();
    UserDTO target_user = userRemoteEJB.getUser(requested_user);
    ReviewRemoteEJB reviewRemoteEJB = new ReviewRemoteEJB();
    ArrayList<ReviewDTO> user_reviews = reviewRemoteEJB.getPetSitterReviewList(requested_user);
    %>
<nav class="topnav">
    <img src="images/HereThePaw_Logo.png" alt="logo">
    <table>
        <tr>
            <td><a href="/herethepaw_webapp">Home</a></td> <!-- TODO CHANGE PATH IF REQUIRED -->
            <% if(userRemoteEJB.getLogged_user() != null) { %>
            <td><a href="UserListServlet?username=<%=userRemoteEJB.getLogged_user().getUsername()%>"><i class="fas fa-user"></i>&nbsp;<%=userRemoteEJB.getLogged_user().getUsername()%></a></td>
            <td><a href="logout">Logout</a></td>
            <% } else { %>
            <td><a href="pages/jsp/login.jsp">Login</a></td>
            <% } %>
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

    <div class="review_results">
        <% for(ReviewDTO item:user_reviews){ %>
        <p><%=item.getTimestamp()%></p>
            <p class="review_text">
                <i class="fas fa-dog"></i><strong><%= item.getOwnerUsername()%>: </strong> <%=item.getText()%>
            </p>
        <% } %>
    </div>
    <h1 id="calendar_h1">Book this petsitter:</h1>
    <div class="calendar-wrapper" id="calendar-wrapper"></div>
    <button id="confirm_date" onclick="btn_clicked()">Select date</button>
    <div id="selected_dates">
        <p id="booking_info"> You selected the following dates: </p>
    </div>
</div>
<script type="text/javascript">
    var date_array = [];
    var selected_date;
    var config = `
function selectDate(date) {
  $('#calendar-wrapper').updateCalendarOptions({
    date: date
  });
  selected_date = date;
}

var defaultConfig = {
  weekDayLength: 1,
  onClickDate: selectDate,
  showYearDropdown: true,
  startOnMonday: false,
};

var calendar = $('#calendar-wrapper').calendar(defaultConfig);
`;
    eval(config);
    const flask = new CodeFlask('#editor', {
        language: 'js',
        lineNumbers: true
    });
    flask.updateCode(config);
    flask.onUpdate((code) => {
        try {
            eval(code);
        } catch(e) {}
    });

    function btn_clicked(){
        const dateArray = selected_date.split(" ");
        var formatted_date = dateArray[0] + " " + dateArray[2] + "-" + dateArray[1] + "-" + dateArray[3];
        date_array.push(formatted_date);
        var node = document.createElement("p");
        node.setAttribute("class","p_node")
        var textnode = document.createTextNode(formatted_date);
        node.appendChild(textnode);
        document.getElementById("selected_dates").appendChild(node);
    }
</script>
</body>
</html>