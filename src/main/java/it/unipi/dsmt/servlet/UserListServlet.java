package it.unipi.dsmt.servlet;

import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.utils.UserPagesUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "UserListServlet", value = "/UserListServlet")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String content = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>User page</title>\n" +
                "<link rel=\"icon\" href=\"images/user_icon.png\" sizes=\"32x32\">" +
                "    <link href=\"CSS/userpage.css\" rel=\"stylesheet\" type=\"text/css\">\n" +
                "    <script src=\"https://kit.fontawesome.com/a30f811c28.js\" crossorigin=\"anonymous\"></script>\n" +
                "</head>\n" +
                "<body>\n" +
                "<nav class=\"topnav\">\n" +
                "    <img src=\"images/HereThePaw_Logo.png\" alt=\"logo\">\n" +
                "    <table>\n" +
                "        <tr>\n" +
                "            <td><a onclick=\"scrollup()\">Home</a></td>\n" +
                "            <td><a href=\"#hr1\">Pets</a></td>\n" +
                "            <td><a href=\"#hr2\">My Profile</a></td>\n" +
                "            <td><a href=\"#contatti\">Reviews</a></td>\n" +
                "        </tr>\n" +
                "    </table>\n" +
                "</nav>\n" +
                "<aside class=\"rightnav\">\n" +
                "    <table>\n" +
                "        <tr>\n" +
                "            <td id=\"facebook\"></td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td id=\"instagram\"></td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td id=\"google\"></td>\n" +
                "        </tr>\n" +
                "    </table>\n" +
                "</aside>" +
                "<div id=\"center_div\">\n" +
                "    <div id=\"image\">";

        List<UserDTO> user_list = UserPagesUtil.list(); //List of all users
        String requested_user = request.getParameter("username");
        UserDTO target_user = UserPagesUtil.byUsername(requested_user);

        if(target_user.isMale()) {
            content = content + "<img src=\"images/avatar_male.png\" alt=\"avatar\">\n" +
                    "    </div>";
        } else{
            content = content + "<img src=\"images/avatar_female.png\" alt=\"avatar\">\n" +
                    "    </div>";
        }
        content = content + "<p id= \"username\"><strong>" + target_user.getUsername() + "</strong></p>";
        if(target_user.isPetsitter()){
            content = content + "<p id=\"petsitter\"><strong><i class=\"far fa-check-circle\"></i>&nbsp;Verified pet sitter </strong></p>";
        } else {
            content = content + "<p id=\"petsitter\"><strong><i class=\"fas fa-user\"></i>&nbsp;Registered user</strong></p>";

        }

        content = content + "<p id= \"name\"><strong>Name: </strong> " + target_user.getName() + "</p>";
        content = content + "<p id= \"cognome\"><strong>Surname: </strong>" + target_user.getSurname() + "</p>";


        content = content + "<p id= \"email\"><strong>Email: </strong>"+ target_user.getEmail() +"</p>";
        content = content + "<p id= \"citta\"><strong>City: </strong>" + target_user.getCity() + "</p>";
        content = content + "<p id= \"cap\"><strong>ZIP Code: </strong>"+ target_user.getPostal_code()  + "</p>";

        content = content + "<p id= \"description\">\""+ target_user.getDescription() +"\"</p></div>";

/*
        for(UserDTO userDTO: user_list){
            content = content + "<h1><href>" + userDTO.getUsername() + "</h1>";
            
        }*/
        content = content + "</body></html>";
        PrintWriter writer = response.getWriter();
        writer.write(content);
        writer.close();
    }
}
