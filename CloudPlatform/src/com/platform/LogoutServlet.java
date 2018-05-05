package com.platform;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LogoutServlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cookie ck = new Cookie("uname",null);
        ck.setMaxAge(0);
        ck.setPath("/");
        response.addCookie(ck);

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        if (user != null) {
            session.removeAttribute("user");
            session.removeAttribute("username");
            session.removeAttribute("email");
            session.removeAttribute("balance");

            String script = "<script>alert('Log out Successful!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        }
    }
}
