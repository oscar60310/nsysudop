<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Date"%>
<%@page import="nsysudop.gb.Bgrent"%>

<%
String t = request.getParameter("t");
String num = request.getParameter("id")+"";
if(t.equals("check"))
{
Bgrent bg = new Bgrent();
Date [] c  =bg.nextrent();
Boolean [] b = bg.canrent(c[0], num);
String s="";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
for(int i=0;i<b.length;i++)
{
    s+=sdf.format(c[i].getTime())+","+b[i]+"#";
}
response.getWriter().println(s+"@");
}
else if(t.equals("rent"))
{
    String date = request.getParameter("date")+"";
    String name = request.getParameter("name")+"";
    String phone = request.getParameter("phone")+"";
    if(date.length()<1||name.length()<1||phone.length()<1)
    {
        response.getWriter().println("Target error");
        return;
    }
    Bgrent bg = new Bgrent();
    response.getWriter().println(bg.rent(num, date, name, phone, session)+"@");
}

else if(t.equals("cancle"))
{
    String key = request.getParameter("key");
    String bgd = request.getParameter("bg");
    String id = session.getAttribute("fb")+"";
    Bgrent bg = new Bgrent();
    String state= bg.cancle(key, id,bgd);
    if(state.equals("success"))
    {
        	response.sendRedirect("../rentlist.jsp?cancle=success");
    }	
    else
    {
        response.getWriter().println(state);
    }
    
}
else if(t.equals("back"))
{
    String key = request.getParameter("key");
    String bgd = request.getParameter("bg");
    String id = session.getAttribute("fb")+"";
    Bgrent bg = new Bgrent();
    String state= bg.back(key, id,bgd);
    if(state.equals("success"))
    {
        	response.sendRedirect("../rentlist.jsp?cancle=success");
    }	
    else
    {
        response.getWriter().println(state);
    }
    
}
else
{
    response.getWriter().println("Target error "+t);
}
%>
