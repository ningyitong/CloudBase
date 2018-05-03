package com.platform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = MD5.transMD5(request.getParameter("password"));
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        UserDao userDao = new UserDao();

        if (userDao.verifyUser(username, question, answer)) {
            userDao.resetPass(password, username);
            String script = "<script>alert('Reset Password Successful!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        } else {
            String script = "<script>alert('Reset password failed! Please double check the information you input!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        }
    }
}
