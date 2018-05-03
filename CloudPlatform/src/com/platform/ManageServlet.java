package com.platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ManageServlet")
public class ManageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // delete user
        if (request.getParameter("userId") != null) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            UserDao userDao = new UserDao();
            userDao.deleteUser(userId);

            if (userDao.userExists(userId)) {
                String script = "<script>alert('Delete user Successful!');location.href='admin.jsp'</script>";
                response.getWriter().println(script);
            } else {
                String script = "<script>alert('Failed to delete this user!');location.href='admin.jsp'</script>";
                response.getWriter().println(script);
            }
        }

        // delete APP
        if (request.getParameter("appId") != null) {
            int appId = Integer.parseInt(request.getParameter("appId"));
            AppDao appDao = new AppDao();
            appDao.deleteApp(appId);

            if (appDao.appExists(appId)) {
                String script = "<script>alert('Delete APP Successful!');location.href='admin.jsp'</script>";
                response.getWriter().println(script);
            } else {
                String script = "<script>alert('Failed to delete this APP!');location.href='admin.jsp'</script>";
                response.getWriter().println(script);
            }
        }
    }
}
