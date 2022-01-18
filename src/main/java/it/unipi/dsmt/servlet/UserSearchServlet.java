package it.unipi.dsmt.servlet;

import it.unipi.dsmt.dto.UserDTO;
import it.unipi.dsmt.utils.UserPagesUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserSearchServlet", value = "/search_user")
public class UserSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>User Search page</title>\n" +
                "    <link href=\"CSS/usersearch.css\" rel=\"stylesheet\" type=\"text/css\">\n" +
                "    <script src=\"https://kit.fontawesome.com/a30f811c28.js\" crossorigin=\"anonymous\"></script>\n" +
                "</head>\n" +
                "<body>\n" +
                "<nav class=\"topnav\">\n" +
                "    <img src=\"images/HereThePaw_Logo.png\" alt=\"logo\">\n" +
                "    <table>\n" +
                "        <tr>\n" +
                "            <td><a href=\"../HereThePaw_DSMT_Project_war\">Home</a></td>\n" +
                "            <td><a href=\"\">Pets</a></td>\n" +
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
                "</aside>";


        String city_searched = request.getParameter("city");
        String pet_searched = request.getParameter("pet");

        ArrayList<UserDTO> filtered_list = UserPagesUtil.filter_list(city_searched,pet_searched);

        content = content + "<div class=\"search_infos\"><p>" + filtered_list.size() + " result found with City: <strong>\""
                + city_searched + "\"</strong> & Pet = <strong>\"" + pet_searched + "\"</strong></p></div>";

        content = content + "<div class=\"search_results\">";

        for(UserDTO item:filtered_list){
            content = content + "<div class=\"first_search_row\">\n" +
                    "        <p class=\"username\">\n" +
                    "            <i class=\"fas fa-dog\"></i><strong>" + item.getUsername() + "</strong>\n" +
                    "        </p>\n" +
                    "        <p class=\"description\"><i class=\"far fa-comment-dots\"></i>&nbsp;" + item.getDescription() + "</p>\n" +
                    "        <button type=\"button\">See Profile</button>\n" +
                    "        <p class=\"rating\"><i class=\"fas fa-star\"></i><i class=\"fas fa-star\"></i><i class=\"fas fa-star\"></i><i class=\"far fa-star\"></i><i class=\"far fa-star\"></i></p>\n" +
                    "    </div>";
        }

        content = content + "</div>\n" +
                "</body>\n" +
                "</html>";

        PrintWriter writer = response.getWriter();
        writer.write(content);
        writer.close();
    }
}
