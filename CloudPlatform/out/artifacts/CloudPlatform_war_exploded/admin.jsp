<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <hr>
    </div>
    <div class="container_table">
        <%
            String id = request.getParameter("userId");
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "Users";
            String userId = "root";
            String password = "0908";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        <table class="table table-bordered table-hover table-striped" id= "table">
            <div style="margin-top: 30px">
                <h4>User List</h4>
            </div>
            <thead>
            <tr>
                <td><b>ID</b></td>
                <td><b>Username</b></td>
                <td><b>Email</b></td>
                <td><b>Balance</b></td>
                <td><b>Delete</b></td>
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
                            <button type="submit" class="btn" style="border:none;background-color:transparent" onclick="return confirm('Are you sure to DELETE this user?')">
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
                }
            %>
            </tbody>
        </table>
        <table class="table table-bordered table-hover table-striped" id="table">
            <div style="margin-top: 30px">
                <h4>APP List</h4>
            </div>
            <thead>
            <tr>
                <td><b>ID</b></td>
                <td><b>APP Title</b></td>
                <td><b>Description</b></td>
                <td><b>Owner</b></td>
                <td><b>Price</b></td>
                <td><b>Delete</b></td>
            </tr>
            </thead>
            <tbody>
            <%
                try{
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="select * from cloud_app";
                    String delUser = "delete from cloud_user where id =";
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
                            <button type="submit" class="btn" style="border:none;background-color:transparent" onclick="return confirm('Are you sure to DELETE this APP?')">
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
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"/>