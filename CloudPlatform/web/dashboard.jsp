<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 --%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="javax.sql.*" %>
<jsp:include page="header.jsp"/>
<%
    String username = (String)session.getAttribute("username");
%>

<div class="container">

    <div class="app-row">
        <%
            try (
                    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Users", "root", "1014");
                    Statement stmt = conn.createStatement();
            ) {
                String strSelect = "select * from cb_app";
                String title = "";
                String icon = "";
                String path = "";
                ResultSet rset = stmt.executeQuery(strSelect);
                while(rset.next()) {   // Move the cursor to the next row
                    title = (String) rset.getString("title");
                    icon = (String) rset.getString("icon");
                    path = (String) rset.getString("path");
        %>
        <div class="col-xs-4" style="margin-top:30px">
            <form method="post" action="ChargeServlet">
                <div style="text-align:center">
                    <button class="app_btn" type="submit" style="background:none" id="goApp_btn" onclick="return confirm('Are you sure you PAY for this application? This APP will COST you <%=rset.getString("price")%> peanuts!')" ><img class="app_image" src="<%=path %>/<%=icon %>" alt=""></button>
                </div>
            </form>
        </div>

        <%
                }
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        %>


        <div class="col-xs-4" style="margin-top:30px" id="addApp_col">
            <div style="text-align:center">
                <button class="app_btn" style="background: none" data-toggle="modal" data-target="#uploadInstruction"><img class="app_image" src="images/addApp.png" alt=""></button>
            </div>
        </div>
    </div>

</div> <!-- /container -->


<jsp:include page="footer.jsp"/>