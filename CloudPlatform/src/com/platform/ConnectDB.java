package com.platform;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Servlet implementation class ConnectDB
 */
public class ConnectDB {
    public static Connection getConnection() {
        Connection conn = null;
        try{

            // This is for using MySQL
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/Users?useSSL=false";
            conn = DriverManager.getConnection(url, "root", "11111111");

            // This is for using SQLite
//            Class.forName("org.sqlite.JDBC");
//            conn = DriverManager.getConnection("jdbc:sqlite:" + "/mydb.db");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void closeConnection (Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
