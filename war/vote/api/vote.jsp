<%@page import="vote.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("id");
	if(num==null)
	{
	    response.getWriter().println("missing id");
	}
	else
	{
	    Info info = new Info();
	    response.getWriter().println(info.vote(num, session));
			
	}

%>
