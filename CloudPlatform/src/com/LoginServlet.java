package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User;
import com.UserDao;
import com.MD5;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String username = request.getParameter("username");
		String password = MD5.transMD5(request.getParameter("password"));
		UserDao userDao = new UserDao();
		User user = userDao.login(username, password);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("username", username);
			
			response.sendRedirect("dashboard.jsp");
		} else {
			String script = "<script>alert('Login failed! Please check your username or password!');location.href='login.jsp'</script>";
			response.getWriter().println(script);
		}
	}

}
