package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User;
import com.UserDao;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = MD5.transMD5(request.getParameter("password"));
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		UserDao userDao = new UserDao();
		if (username != null && !username.isEmpty()) {
			if (userDao.sameUsername(username)) {
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				user.setQuestion(question);
				user.setAnswer(answer);
				
				userDao.saveUser(user);
				
				String script = "<script>alert('Registration Successful!');location.href='login.jsp'</script>";
				response.getWriter().println(script);
			} else {
				String script = "<script>alert('Register failed! The USERNAME is already existed.');location.href='registration.jsp'</script>";
				response.getWriter().println(script);
			}
		} 
	}
}
