<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<jsp:include page="header.jsp"/>

<% if (session.getAttribute("username") != null) { %>
    <div class="row" style="margin-top: 120px" id="dashboard_showInfo">
        <div class="col-sm-6" style="text-align: center">
            <h3>
                <a href="chatting.jsp" target="_blank" class="log_btn">Chatting With Friends</a>
            </h3>
        </div>
        <div class="col-sm-6" style="text-align: center">
            <h3>
                Credits: <%=session.getAttribute("balance")%>
            </h3>
        </div>
    </div>
<% } %>

<hr>
<div class="container">
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
    <div class="row">
        <%
        try{
            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            statement=connection.createStatement();
            String sql ="select * from cloud_app";
            String title = "";
            String icon = "";
            String path = "";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()) {
                title = (String) resultSet.getString("title");
                icon = (String) resultSet.getString("icon");
                path = (String) resultSet.getString("path");
                icon = "images/appDefault.png";
        %>

        <div class="col-xs-4" style="margin-top:30px">
            <form method="post" action="ChargeServlet">
                <input class="invisible_input" name="app_owner" value="<%=resultSet.getString("owner")%>" />
                <input class="invisible_input" name="app_path" value="<%=resultSet.getString("path")%>" />
                <input class="invisible_input" name="app_price" value="<%=resultSet.getString("price")%>" />
                <div style="text-align:center">
                    <button class="app_btn" type="submit" formtarget="_blank" id="goApp_btn" onclick="return confirm('Opening : <%=resultSet.getString("title")%>... It is <%=resultSet.getString("price")%> peanuts per use!')" ><img class="app_image" src="<%=icon %>" alt=""></button>
                </div>
            </form>
        </div>

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

        <div class="col-xs-4" style="margin-top:30px; text-align: center" id="addApp_col">
            <div style="text-align:center">
                <button class="app_btn" data-toggle="modal" data-target="#uploadInstruction">
                    <img class="app_image" src="images/upload_app.png" alt="" style="max-width: 100px; max-height: 100px">
                </button>
            </div>
        </div>
    </div>
    <hr style="padding-bottom: 200px">
</div>

<jsp:include page="footer.jsp"/>