package com.platform;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ChargeServlet")
public class ChargeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user == null) {
            String script = "<script>alert('You need login first!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        }

        String app_owner = request.getParameter("app_owner");
        String app_path = request.getParameter("app_path");
        String appUser_name = (String)session.getAttribute("username");

        // check user balance
//        int app_price = Integer.parseInt(request.getParameter("app_price"));
        int app_price = 22;
        UserDao temp_appUser = new UserDao();
        User appUser_pre_account = temp_appUser.userInfo(appUser_name);
        if (appUser_pre_account.getBalance() >= app_price) {

            // peanuts APP owner could get
            int charging_owner = (int)(app_price * 0.9);

            // peanuts platform provide could get
            int charging_platowner = (int)(app_price * 0.1);

            // Charging APP owner peanut
            UserDao owner = new UserDao();

//            User owner_account = owner.userInfo(app_owner);
//            owner.creditBalance(app_owner, owner_account.getBalance() + charging_owner);

            // Charging platform owner
            UserDao platform_owner = new UserDao();

            User platform_owner_account = platform_owner.userInfo("duan");
            platform_owner.creditBalance("duan", platform_owner_account.getBalance() + charging_platowner);

            // Debt APP user peanut
            UserDao appUser = new UserDao();
            User appUser_account = appUser.userInfo(appUser_name);

            appUser.userInfo(appUser_name);
            appUser.creditBalance(appUser_name, appUser_account.getBalance() - app_price);

            // Go to APP after debit process
            String appLink = app_path.substring(0, app_path.length() - 4);
            response.sendRedirect("/" + appLink + "/");
        }
        String script = "<script>alert('You need more peanuts! Please top up your account first!');location.href='index.jsp'</script>";
        response.getWriter().println(script);
    }
}