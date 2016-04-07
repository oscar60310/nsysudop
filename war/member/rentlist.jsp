
<%@page import="java.util.Calendar"%>
<%@page import="nsysudop.gb.Bgrent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>桌遊租借</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
       	<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
	</head>
    
	<body class="left-sidebar">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="#" id="logo">桌遊租借</a></h1>
							</header>
							
						</div>

					<!-- Nav -->
					<%@ include file="../head/top.jsp"%>

				</div>

			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<div class="row 200%">
							
							<div class="12u 12u(mobile)" id="content">
								<article id="main">
									<header>
										<h2><a href="#">租借查詢</a></h2>
                                        </header>
										<%
											String msg="";
												if(session.getAttribute("fb")==null)
												{
												    msg="<a href='../facebook/step1.jsp?state=/member/rentlist.jsp' >"+
												            "您必須先登入才能查看</a>";
												}
												else
												{
												    msg ="<a href='../facebook/step1.jsp?state=/member/rentlist.jsp' >"+
												"登入:"+session.getAttribute("fb")+"</a>";
												}
							%>
											<%=msg %>
                                            
                                   <table class="table table-hover">
 									<tr>
  										<td>#</td>
										<td>桌遊名稱</td>
                                        <td>租借日期</td>
                                        <td>申請人員</td>
                                        <td>聯絡方式</td>
                                        <td>申請日期</td>
                                        <td>動作</td>
									</tr>
									<%
									String data  = "";
									if(session.getAttribute("fb")!=null)
									{
									    Bgrent bg = new Bgrent();
									    data = bg.getList(session.getAttribute("fb")+"");
									    
									}
									%>
									<%=data %>
									</table>
                                            
 									 </article>
  					
							</div>
							</div>
						</div>
					</div>

			</div>

			<!-- Footer -->
			<%@ include file="../head/footer.jsp"%>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/jquery.onvisible.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>

	</body>
</html>