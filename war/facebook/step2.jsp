<%@page import="facebook.Token"%>
<%@page import="nsysudop.gb.ServerData"%>
<!DOCTYPE html>
<html>
<head>
<title>Facebook Login</title>
<meta charset="UTF-8">
</head>
<%
	String showmsg="正在登入...";
	ServerData sd = new ServerData();

	String appID = sd.facebookID;
	String redirect = sd.host +"/facebook/step2.jsp";
	String state = request.getParameter("code");
	if(state ==null)
	{
	    showmsg="認證失敗，點<a href='/facebook/step1.jsp'>此處</a>重新認證";
	}
	else
	{
	    Token fb = new Token();
	    if(!fb.getToken(state))
	    {
	    	session.setAttribute("state", "not_student");
	        response.sendRedirect("../message/notmember.jsp?id="+fb.FB_ID);
	    }
	    else
	    {
	        session.setAttribute("name", fb.FB_Name);
	        session.setAttribute("fb", fb.FB_ID);
	        showmsg="OK";
	        response.sendRedirect(".."+request.getParameter("state"));
	    }
	}
	
%>
<body>
<%=showmsg %>
</body>
</html>