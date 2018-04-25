package com.platform;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    // save user to DB
    public void saveUser (User user) {
        Connection conn = ConnectDB.getConnection();
        String sql = "insert into users(username,password,email,question,answer) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getQuestion());
            ps.setString(5, user.getAnswer());

            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    // validate username cannot be duplicated
    public boolean sameUsername (String username) {
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from users where username = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                return true;
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return false;
    }

    // verify username and password
    public User login (String username, String password) {
        User user = null;
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from users where username = ? and password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();

                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setQuestion(rs.getString("question"));
                user.setAnswer(rs.getString("answer"));
                user.setBalance(rs.getInt("balance"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return user;
    }

}
