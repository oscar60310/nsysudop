<%@page import="nsysudop.gb.ServerData"%>
<%@page import="javax.mail.Session"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Facebook Login</title>
<meta charset="UTF-8">
</head>
<%
	ServerData sd = new ServerData();

	String appID = sd.facebookID;
	String redirect = sd.host +"/facebook/step2.jsp";
	response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id="+appID+"&redirect_uri="+redirect+"&state="
	        +request.getParameter("state"));
%>
<body>
Login to Facebook
</body>
</html>