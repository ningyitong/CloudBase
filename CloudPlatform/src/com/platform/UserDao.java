package com.platform;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    // save user to DB
    public void saveUser (User user) {
        Connection conn = ConnectDB.getConnection();
        String sql = "insert into cloud_user(username,password,email,question,answer,balance) values(?,?,?,?,?,1000)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getQuestion());
            ps.setString(5, user.getAnswer());

            ps.executeUpdate();

            ps.close();
            System.out.println("Save user");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    // validate username cannot be duplicated
    public boolean isUsernameExists (String username) {
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from cloud_user where username = ?";
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
        String sql = "select * from cloud_user where username = ? and password = ?";
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

    // get user info by username
    public User userInfo (String username) {
        User user = null;
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from cloud_user where username = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);

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
                user.setAdmin(rs.getInt("admin"));
            }
            rs.close();
            ps.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return user;
    }

    // credit user peanut when upload app successful
    public void creditBalance(String username, int balance){
        Connection conn = ConnectDB.getConnection();

        String sql = "update cloud_user set balance=? where username=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, balance);
            ps.setString(2, username);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    // verify user info for reset password
    public boolean verifyUser (String username, String question, String answer) {
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from cloud_user where username = ? and question = ? and answer = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, question);
            ps.setString(3, answer);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return false;
    }

    // change password
    public void resetPass (String password, String username) {
        Connection conn = ConnectDB.getConnection();
        String sql = "update cloud_user set password=? where username=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    public boolean userExists (int id) {
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from cloud_user where id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
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

    // delete user function
    public void deleteUser(int id) {
        Connection conn = ConnectDB.getConnection();
        String sql = "delete from cloud_user where id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

}
