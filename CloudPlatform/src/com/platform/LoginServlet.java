package com.platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = MD5.transMD5(request.getParameter("password"));
        UserDao userDao = new UserDao();
        HttpSession session = request.getSession();

        User user = userDao.login(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            // set session data
            session.setAttribute("username", username);
            session.setAttribute("admin", userDao.userInfo(username).getAdmin());
            session.setAttribute("email", userDao.userInfo(username).getEmail());
            session.setAttribute("balance", userDao.userInfo(username).getBalance());

            // set up cookie
            Cookie ck = new Cookie("uname", username);
            ck.setPath("/");
            ck.setMaxAge(3000);
            response.addCookie(ck);

            response.sendRedirect("dashboard.jsp");
        } else {
            String script = "<script>alert('Wrong Username or Password!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        }
    }
}
