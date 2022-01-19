package it.unipi.dsmt.utils;

import java.sql.*;

public class MySQLHandler {

    public static String database_url = "jdbc:mysql://localhost:3306/dsmt_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public static Connection con;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    database_url, "root", "tommy123");
            System.out.println("My SQL Connection has been successfully established");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getCon() {
        return con;
    }
}