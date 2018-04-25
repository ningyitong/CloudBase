<%
	if (session.getAttribute("user")==null) {
		response.sendRedirect("login.jsp");
	}
%>