package com.platform;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AppDao {

    // save app info to database
    public void SaveApp (App app) {
        Connection conn = ConnectDB.getConnection();
        String sql = "insert into cloud_app(title,icon,description,path,owner,price) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, app.getTitle());
            ps.setString(2, app.getIcon());
            ps.setString(3, app.getDescription());
            ps.setString(4, app.getPath());
            ps.setString(5, app.getOwner());
            ps.setInt(6, app.getPrice());

            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    // if app title exists, prevent upload
    public boolean SameAppname (String title) {
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from cloud_app where title = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
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

    // delete app function
    public void deleteApp(int id) {
        Connection conn = ConnectDB.getConnection();
        String sql = "delete from cloud_app where id=?";
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

    public boolean appExists (int id) {
        Connection conn = ConnectDB.getConnection();
        String sql = "select * from cloud_app where id = ?";
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
}
