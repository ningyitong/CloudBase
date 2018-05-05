package com.platform;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;



@WebServlet(name = "ChattingServlet")
public class ChattingServlet extends HttpServlet {
    List<String> OnLineUserList = new ArrayList<String>();
    static List<String> strSendConentList=new ArrayList<String>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        //get user action , name, pass, content
        String strAction = request.getParameter("action");
        String strName = request.getParameter("name");
        String strPass = request.getParameter("pass");
        String strContent = request.getParameter("content");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        //base on action to do things

        if(strAction.equals("Login")) {
            String res = UserLogin(strName, strPass, session);
            out.print(res);
            out.close();
        } else if (strAction.equals("ChatList")){
            String result1=AllChatList();
            out.println(result1);
            out.close();

        }else if(strAction.equals("OnLineList")){
            String result2=GetOnlineUserList(session);
            out.println(result2);
            out.close();

        }else if(strAction.equals("OnLineList")){
            Boolean res2=AddSendContent(strContent,session);
            String result="";
            if(res2){
                result="1";
            }else{
                result="2";
            }
            out.println(result);
            out.close();
        }else if(strAction.equals("Logout")){
            boolean res3=Logout(session);
            out.println(res3);
            out.close();
        }
    }

    //check user login
    public String UserLogin(String strName,String strPass,HttpSession session){
        String flag = "no";
        String username = (String) session.getAttribute("username");
        if (!username.equals(""))//check session
        {
            if (OnLineUserList.size() == 0)//check use if empty
            {
                OnLineUserList = new ArrayList<String>();// in use is empty , init the arraylist
            }
            OnLineUserList.add(strName);//add use to the arrayList
            session.setAttribute("LOGINUSER",strName);//session to set user info
            flag = "ok";
        }
        return flag;
    }

    //logout
    public boolean Logout(HttpSession session){
        if(null==session.getAttribute("LOGINUSER")){
            return false;
        }
        String name = session.getAttribute("LOGINUSER").toString();
        session.removeAttribute("LOGINUSER");
        if(OnLineUserList.size()!=0){
            for(int i=0;i<OnLineUserList.size();i++) {
                if(name.equals(OnLineUserList.get(i))) {
                    OnLineUserList.remove(i);
                }
                return true;
            }
        }
        return false;
    }

    //get chat content
    public String AllChatList(){
        String result="";
        if (strSendConentList.size() == 0)
        {
            result = "Empty board, say hello to your friends!";
        }
        else
        {
            Iterator<String> it=strSendConentList.iterator();
            while(it.hasNext()){
                result += it.next() + "</br>";
            }
        }
//        result= result.replace("<:", "<img src='Face/");
//        result=result.replace(":>", ".gif '/>");
        return result;
    }

    //user list
    public String GetOnlineUserList(HttpSession session){
        String result="";
        if (OnLineUserList.size()==0)
        {
            result="No one online currently.";
        }else{
            Iterator<String> it=OnLineUserList.iterator();
            while(it.hasNext()){
                result += it.next() + "</br>";
            }
        }
        return result;
    }

    //send message
    public Boolean AddSendContent(String strContent,HttpSession session){
        String user=(String) session.getAttribute("LOGINUSER");

        //String name = session.getAttribute("LOGINUSER").toString();
        if(null==user){
            return false;
        }
        String strSendConent = user + " 于 " + new java.util.Date(System.currentTimeMillis()) + " 说: " + strContent;
        if (strSendConentList.size() == 0)
        {
            strSendConentList = new ArrayList<String>();
        }
        strSendConentList.add(strSendConent);
        return true;
    }
}
