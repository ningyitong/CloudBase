package com.platform;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, maxFileSize=1024*1024*10, maxRequestSize=1024*1024*50)
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int INCREASE_CREDITS = 100;
    private static String fileName = "";
    private static String path = "";
    private static String icon = "";

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename") && s.length()>0) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return null;
    }
    // get file extension method
    private String getFileExtension(String fileName) {
        if (fileName.length() == 3) {
            return fileName;
        } else if (fileName.length() > 3) {
            return fileName.substring(fileName.length() - 3);
        } else {
            return "Error";
        }
    }
    // jar extractor method
    private void jarExtractor(String sourcePath, String targetPath) throws IOException {
        JarFile jarfile = new JarFile(sourcePath);
        for (Enumeration<JarEntry> iter = jarfile.entries(); iter.hasMoreElements();) {
            JarEntry entry = iter.nextElement();
            File outfile = new File(targetPath, entry.getName());
            if (! outfile.exists())
                outfile.getParentFile().mkdirs();
            if (! entry.isDirectory()) {
                InputStream instream = jarfile.getInputStream(entry);
                FileOutputStream outstream = new FileOutputStream(outfile);
                while (instream.available() > 0) {
                    outstream.write(instream.read());
                }
                outstream.close();
                instream.close();
            }
        }
        jarfile.close();
    }
    // add credits method
    private void addCredits(String username) {
        UserDao userDao = new UserDao();
        User user = userDao.userInfo(username);
        int credit = user.getBalance() + INCREASE_CREDITS;
        userDao.creditBalance(username, credit);
    }
    // set app info method
    private void setAppInfo(String title, String path, String description, String icon, String owner, int price) {
        AppDao appDao = new AppDao();
        App app = new App();
        app.setTitle(title);
        app.setPath(path);
        app.setDescription(description);
        app.setIcon(icon);
        app.setOwner(owner);
        app.setPrice(price);
        appDao.SaveApp(app);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        String username = (String) session.getAttribute("username");
        String title = request.getParameter("title");
        String tomcatPath = (new File(request.getServletContext().getRealPath(""))).getParent();
        String description = request.getParameter("description");
        String owner = (String) session.getAttribute("username");
        int price = Integer.parseInt(request.getParameter("price"));

        AppDao appDao = new AppDao();
        if (appDao.SameAppname(title)) {
            response.setContentType("text/html");

            for (Part part : request.getParts()) {
                fileName = extractFileName(part);
                if (fileName != null) {
                    String fileExtension = getFileExtension(fileName);

                    if (fileExtension.equals("jar") || fileExtension.equals("war")) {
                        path = title + "." + fileExtension;
                        part.write(tomcatPath + File.separator + path);

                    } else {
                        icon = owner + fileName;
                        part.write(tomcatPath + icon);
                    }
                }
            }

            // save App info to database
            String pathWithoutExtenson = (owner + fileName).substring(0, (owner + fileName).length() - 4);

            String sourcePath = tomcatPath + File.separator + path;
//            String targetPath = tomcatPath;
            jarExtractor(sourcePath, tomcatPath);

            // check if app exists
            Path app_path = Paths.get(tomcatPath + File.separator + title);
            File file_icon = new File(tomcatPath + File.separator + icon);

            // move app icon to app folder
            if (Files.exists(app_path)) {
                file_icon.renameTo(new File(app_path + File.separator + icon));
            }
            icon = app_path + File.separator + icon;

            setAppInfo(title, pathWithoutExtenson, description, icon, owner, price);

            // increase credits of the app owner
            addCredits(username);

            // Refresh user balance
            UserDao userDao = new UserDao();
            session.setAttribute("balance", userDao.userInfo(username).getBalance());

            String script = "<script>alert('Upload App Successful! Enjoy your 100 credits reward!');location.href='dashboard.jsp'</script>";
            response.getWriter().println(script);
        } else {
            String script = "<script>alert('Upload failed: the app title has been used, please change to another one.');location.href='upload.jsp'</script>";
            response.getWriter().println(script);
        }
    }
}

