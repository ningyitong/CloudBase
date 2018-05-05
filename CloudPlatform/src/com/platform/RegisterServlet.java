package com.platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = MD5.transMD5(request.getParameter("password"));
        String email = request.getParameter("email");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        HttpSession session = request.getSession();

        UserDao userDao = new UserDao();
        if (username != null && !username.isEmpty()) {
            if (userDao.isUsernameExists(username)) {
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);
                user.setQuestion(question);
                user.setAnswer(answer);

                userDao.saveUser(user);

                // create session
                session.setAttribute("username", username);
                session.setAttribute("admin", 0);
                session.setAttribute("email", email);
                session.setAttribute("balance", 1000);

                // create cookie
                Cookie ck = new Cookie("uname", username);
                ck.setPath("/");
                ck.setMaxAge(3000);
                response.addCookie(ck);
                String script = "<script>alert('Registration Successful!');location.href='dashboard.jsp'</script>";
                response.getWriter().println(script);
            } else {
                String script = "<script>alert('Register failed! The USERNAME is already existed.');location.href='dashboard.jsp'</script>";
                response.getWriter().println(script);
            }
        }
    }
}
