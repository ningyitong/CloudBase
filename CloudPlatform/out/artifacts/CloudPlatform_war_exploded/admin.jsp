<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<jsp:include page="header.jsp"/>
<%
    if (session.getAttribute("user")==null || (Integer)session.getAttribute("admin")!=1)
    {
        response.sendRedirect("dashboard.jsp");
    }
%>>

<div class="container" style="margin-left: 80px; margin-right: 80px">
    <div style="margin-top: 100px">
        <h3>Manage Users and Apps</h3>
        <hr style="min-width: 800px;">
    </div>
    <div class="container_table">
        <%
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "Users?useSSL=false";
            String userId = "root";
            String password = "1111";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement;
            ResultSet resultSet;
        %>

        <div style="margin-top: 30px">
            <h4>User List</h4>
        </div>
        <table class="table table-bordered table-hover table-striped" id= "table" style="text-align: center; min-width: 800px;">
            <thead>
            <tr>
                <td style="width: 50px; text-align: center"><b>ID</b></td>
                <td style="min-width: 150px;"><b>Username</b></td>
                <td style="min-width: 400px"><b>Email</b></td>
                <td style="width: 150px"><b>Balance</b></td>
                <td style="width: 50px"><b>Delete</b></td>
            </tr>
            </thead>

            <tbody>
            <%
                try{
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="select * from cloud_user";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getInt("id") %></td>
                <td><%=resultSet.getString("username") %></td>
                <td><%=resultSet.getString("email") %></td>
                <td><%=resultSet.getInt("balance") %></td>
                <td>
                    <form method="post" action="ManageServlet">
                        <input type="hidden" name="userId" value="<%=resultSet.getInt("id")%>" />
                        <div>
                            <button type="submit" class="btn" style="border: none; background-color: transparent; height: 30px; width: 30px" onclick="return confirm('Are you sure to DELETE this user?')">
                                <span class="glyphicon glyphicon-trash" style="color:#c94c4c"></span>
                            </button>
                        </div>
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (connection != null) {
                        try {
                            connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
            </tbody>
        </table>

        <div style="margin-top: 30px">
            <h4 style="margin-top: 30px">APP List</h4>
        </div>
        <table class="table table-bordered table-hover table-striped" id="table" style="text-align: center; min-width: 800px;">
            <thead>
            <tr>
                <td style="width: 50px"><b>ID</b></td>
                <td style="width: 180px"><b>APP Title</b></td>
                <td style="min-width: 270px"><b>Description</b></td>
                <td style="width: 150px"><b>Owner</b></td>
                <td style="width: 100px"><b>Price</b></td>
                <td style="width: 50px"><b>Delete</b></td>
            </tr>
            </thead>
            <tbody>
            <%
                try{
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="select * from cloud_app";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getInt("id") %></td>
                <td><%=resultSet.getString("title") %></td>
                <td><%=resultSet.getString("description") %></td>
                <td><%=resultSet.getString("owner") %></td>
                <td><%=resultSet.getString("price") %></td>
                <td>
                    <form method="post" action="ManageServlet">
                        <input type="hidden" name="appId" value="<%=resultSet.getInt("id")%>" />
                        <div>
                            <button type="submit" class="btn" style="border: none; background-color: transparent; height: 30px; width: 30px" onclick="return confirm('Are you sure to DELETE this APP?')">
                                <span class="glyphicon glyphicon-trash" style="color:#c94c4c"></span>
                            </button>
                        </div>
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (connection != null) {
                        try {
                            connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"/>