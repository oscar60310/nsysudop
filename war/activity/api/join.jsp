<%@page import="activity.Activity"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%
	String name = request.getParameter("name")+"";
    String t = request.getParameter("t")+"";
	if(name.length()<3 || t.length() <3)
	{
	    response.getWriter().println("Missing Parameter.@");
	}
	else
	{
	    Activity a = new Activity(session,name);
	    if(t.equals("join"))
	    {
	        response.getWriter().println(a.join()+"@");
	    }
	    else if(t.equals("check"))
	    {
	        response.getWriter().println(a.hasJoin()+"@");
	    }
	    else
	    {
	        response.getWriter().println("Unkown Parameter.@");
	    }
	}
%>