package com.platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        User user = userDao.login(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("username", username);

            response.sendRedirect("dashboard.jsp");
        } else {
            String script = "<script>alert('Login failed! Please check your username or password!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        }
    }
}
