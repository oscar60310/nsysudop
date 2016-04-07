
<%@page import="java.util.Calendar"%>
<%@page import="nsysudop.gb.Bgrent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>登入失敗</title>
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
								<h1><a href="#" id="logo">登入失敗</a></h1>
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
										<h2><a href="#">無法確認身分</a></h2>
                                        </header>
										<p>
                                        很抱歉，我們無法確認您是中山大學光電系的成員<br>
                                        您必須加入<a href="https://www.facebook.com/groups/204310116291421/" target="_blank">國立中山大學光電工程學系</a>社團來驗證您的身分<br>
                                        若您認為這有問題，請填寫回報表單並提供您的ID:<%=request.getParameter("id")+""%>
                                        </p>
                                       
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