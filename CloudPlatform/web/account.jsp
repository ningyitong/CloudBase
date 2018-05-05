<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<jsp:include page="header.jsp"/>
<%
    if (session.getAttribute("user")==null)
    {
        response.sendRedirect("dashboard.jsp");
    }
%>

<div class="container" style="margin-left: 80px; margin-right: 80px">
    <div style="margin-top: 120px">
        <h3>Manage your APP</h3>
        <hr style="min-width: 800px;">
    </div>
    <br>
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
        <table class="table table-bordered table-hover table-striped" id="table" style="text-align: center; min-width: 800px;">
            <thead>
            <tr>
                <td style="min-width: 250px;"><b>APP Title</b></td>
                <td style="min-width: 500px;"><b>Description</b></td>
                <td style="width: 50px;"><b>Delete</b></td>
            </tr>
            </thead>
            <tbody>
            <%
                String user = (String) session.getAttribute("username");
                try{
                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                    statement=connection.createStatement();
                    String sql ="select * from cloud_app where owner = '" + user + "'";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()) {
            %>
            <tr>
                <td><%=resultSet.getString("title") %></td>
                <td><%=resultSet.getString("description") %></td>
                <td>
                    <form method="post" action="AccountServlet">
                        <input type="hidden" name="appId" value="<%=resultSet.getInt("id")%>" />
                        <div>
                            <button type="submit" class="btn" style="border: none; background-color: transparent; width: 30px; height: 30px;" onclick="return confirm('Are you sure to DELETE this APP?')">
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
