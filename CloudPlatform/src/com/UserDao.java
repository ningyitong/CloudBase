package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.User;

public class UserDao {
	
	// save user to DB
	public void saveUser (User user) {
		Connection conn = ConnectDB.getConnection();
		String sql = "insert into cb_user(username,password,email,question,answer,balance) values(?,?,?,?,?,1000)";
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
	
	// verify username and password
	public User login (String username, String password) {
		User user = null;
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from cb_user where username = ? and password = ?";
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
	
	// verify user security question
	public boolean verifyUser (String username, String answer) {
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from cb_user where username = ? and question = ? and password = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, username);
			ps.setString(2, answer);
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
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
	
	// set new password to DB
	public void changePassword (String password, String username) {
		Connection conn = ConnectDB.getConnection();
		String sql = "update cb_user set password=? where username=?";
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
	
	// validate username cannot be duplicated
	public boolean sameUsername (String username) {
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from cb_user where username = ?";
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
	
	// get user info from DB
	public User value (String username) {
		User user = null;
		Connection conn = ConnectDB.getConnection();
		String sql = "select * from cb_user where username = ?";
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