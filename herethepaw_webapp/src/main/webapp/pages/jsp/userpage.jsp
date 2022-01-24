<%@ page import="it.unipi.dsmt.ejb.UserRemoteEJB" %>
<%@ page import="it.unipi.dsmt.ejb.ReviewRemoteEJB" %>
<%@ page import="it.unipi.dsmt.dto.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unipi.dsmt.dto.ReviewDTO" %>
<%@ page import="it.unipi.dsmt.interfaces.UserRemote" %>
<%@ page import="it.unipi.dsmt.interfaces.ReviewRemote" %>

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
    UserRemote userRemoteEJB = new UserRemoteEJB();
    UserDTO target_user = userRemoteEJB.getUser(requested_user);
    ReviewRemote reviewRemoteEJB = new ReviewRemoteEJB();
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
<% if (!target_user.isPetsitter()) { %>
    <div id="profile_div" style="position: absolute; left:30%;">
<% } else {%>
    <div id="profile_div">
        <% } %>
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
<% if(target_user.isPetsitter()) { %> <!-- This user is a petsitter - Reviews page should appear -->

    <div id="review_div">
        <div id="review_list">
        <% for(ReviewDTO item:user_reviews){ %>

        <p class="review_text">
            <i class="fas fa-dog"></i><strong><%= item.getOwnerUsername()%>: </strong> <%=item.getText()%>
            <br>
            <i><%=item.getTimestamp()%></i>
        </p>
        <% } %>
            <% if(userRemoteEJB.getLogged_user() != null && !userRemoteEJB.getLogged_user().isPetsitter()) { %>
            </div>
                <div class="container">
                    <form method="post" id="review" action="http://localhost:8080/herethepaw_webapp/new_review">
                        <textarea type="text" name="review" class="input" placeholder="Write a review" v-model="newItem" @keyup.enter=""></textarea>
                        <input type="hidden" name="pet_owner" value="<%=userRemoteEJB.getLogged_user().getUser_id()%>">
                        <input type="hidden" name="pet_sitter" value="<%=target_user.getUser_id()%>">
                        <button class='primaryContained float-right' type="submit">Add Review</button>
                        <div class="box">
                            <select name="rating">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </form>
                </div><!--End Container -->

            </div>

        <% } %>

<% } %>


<% if(userRemoteEJB.getLogged_user() != null && target_user.isPetsitter()) { %>
    <!-- User is Logged & target == petsitter - Calendar should be displayed otherwise not -->

    <h1 id="calendar_h1">Book this pet sitter &nbsp;<i class="far fa-handshake"></i></h1>
    <div class="calendar-wrapper" id="calendar-wrapper"></div>
    <button id="confirm_date" onclick="first_btn_clicked()">Select date</button>
    <div id="selected_dates">
        <p id="booking_info"> You are trying to book this pet sitter &nbsp;<i class="fas fa-arrow-circle-down"></i></p>
        <p id="p_from"><strong>From: </strong></p>
        <p id="p_to"><strong>To: </strong></p>
    </div>
    <form method="post" id="book_form" action="http://localhost:8080/herethepaw_webapp/book_petsitter">
        <input type="hidden" name="pet_owner" value="<%=userRemoteEJB.getLogged_user().getUser_id()%>">
        <input type="hidden" name="pet_sitter" value="<%=target_user.getUser_id()%>">
    <button id="confirm_book" onclick="book_btn_clicked()">Book now!</button>
    </form>
<% } %>


<script type="text/javascript">
    var date_array = [];
    var todayDate = new Date();
    todayDate.setHours(0, 0, 0, 0);
    var selected_date;
    var previous_date;
    var reset_input = false;
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

    function first_btn_clicked(){
        if(reset_input){ //reset everything
            date_array = [];
            document.getElementById("p_from").innerHTML = "<strong>From: </strong>";
            document.getElementById("p_to").innerHTML = "<strong>To: </strong>";
            document.getElementById("confirm_date").innerHTML = "Select date";
            reset_input = false;
        } else {
            const dateArray = selected_date.split(" ");
            var formatted_date = dateArray[0] + " " + dateArray[2] + "-" + dateArray[1] + "-" + dateArray[3];
            if(date_array.length == 0){
                //Check if this date is from past
                if(currentDate >= todayDate){
                    document.getElementById("p_from").innerHTML = "<strong>From: </strong>" + formatted_date;
                    date_array.push(formatted_date);
                    previous_date = currentDate;
                } else {
                    alert("Invalid date, retry.");
                    return;
                }
            } else {
                if(previous_date<=currentDate){
                    document.getElementById("p_to").innerHTML = "<strong>To: </strong>" + formatted_date;
                    //document.getElementById("confirm_date").disabled = true;
                    date_array.push(formatted_date);
                    document.getElementById("confirm_date").innerHTML = "Reset Input";
                    reset_input = true;
                } else {
                    alert("You must select a date after/equal to the \"from\" one");
                    return;
                }

            }
        }
    }

    function book_btn_clicked(){
    // <input type="text" placeholder="Insert Username" name="username" class="input" required>
        if(reset_input){
            var form = document.getElementById('book_form');//retrieve the form as a DOM element

            var input = document.createElement("input");//prepare a new input DOM element
            input.setAttribute("name","from_date");//set the param name
            input.setAttribute("value", date_array[0]);//set the value
            input.setAttribute("type", "hidden")//set the type, like "hidden" or other
            form.appendChild(input);

            var input1 = document.createElement("input");//prepare a new input DOM element
            input1.setAttribute("name","to_date");//set the param name
            input1.setAttribute("value", date_array[1]);//set the value
            input1.setAttribute("type", "hidden")//set the type, like "hidden" or other
            form.appendChild(input1);

            form.submit();
        } else {
            alert("All fields must me filled! Retry");
        }

    }
</script>
</body>
</html>