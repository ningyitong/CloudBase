package com.platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AccountServlet")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("appId") != null) {
            int appId = Integer.parseInt(request.getParameter("appId"));
            AppDao appDao = new AppDao();
            appDao.deleteApp(appId);

            if (appDao.appExists(appId)) {
                String script = "<script>alert('Delete APP Successful!');location.href='account.jsp'</script>";
                response.getWriter().println(script);
            } else {
                String script = "<script>alert('Failed to delete this APP!');location.href='account.jsp'</script>";
                response.getWriter().println(script);
            }
        }
    }

}
