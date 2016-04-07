<%@page import="activity.Activity"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>活動報名</title>
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
								<h1><a href="#" id="logo">活動報名</a></h1>
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
										<h2><a href="#">宣傳組開放課程－HTML基礎教學</a></h2>
										<h4>日期：2015/12/3(四)</h4>
										<h4>時間：晚上7:00~9:00</h4>
										<h4>地點：確定人數後於粉專公布</h4>
										
									</header>
									 <%Activity a=new Activity(session,"htmlclass");%>
									<div style="color:blue;">
										第二次的開放課程來囉，
										這次是由宣傳組主辦的「基礎HTML課程」教學!<br>
										HTML到底是什麼呢?簡單來說就是瀏覽器看的標記語言，
										換句話說這次就是來教大家做網頁囉~
										<ul style="list-style:disc;margin-left:1em;color:black;">
											<li>這次活動需要大家自備筆電，沒有的話找個好同學一起看也可以</li>
											<li>教室插座不太多，所以最好充飽電再來</li>
											<li>不需要任何的基礎，我們會從頭開始教 :)</li>
											<li style="color:red;">為了確定人數，請要來參加的同學們按下下方的「報名」</li>
											<li>目前登入身分：<a href="../facebook/step1.jsp?state=/activity/htmlclass.jsp"><%=session.getAttribute("name")%></a></li>
										</ul>
										 <a id="btns" class="button" onclick="go()">報名</a>
										 <div id="joinok" style="transition:opacity 2s;opacity:0.0">

										 <i style="font-size:200%;color:green;" class="fa fa-check"><span style="font-family: 微軟正黑體;">&nbsp;報名成功</span></i>
										 </div>
										 <script>
										 var num ="<%=a.num()%>";
										 
										 var hasjoin ="<%=a.hasJoin()%>";
										 var id ="<%=session.getAttribute("fb")%>";
										 function check()
										 { 
										 	if(id=="null")
										 	{
										 		window.location = "../facebook/step1.jsp?state=/activity/htmlclass.jsp";
											} 
										 	if(hasjoin=="true")
										 	{
										 		document.getElementById("btns").style["display"] = "none";
										 		document.getElementById("joinok").style["opacity"] = "1.0";

										 	}
										 	if(num!="0")
										 		console.log(num);
										 }
										 check();
										 var xmlHttp;
										 function go()
										 {
										 	   xmlHttp = new XMLHttpRequest();
												xmlHttp.onreadystatechange = recall;
									   			xmlHttp.open( "GET", "../activity/api/join.jsp?name=htmlclass&t=join", true );
									    		xmlHttp.send(null);
										 }
										 function recall()
										 {
										 	if (xmlHttp.readyState==4)
        										{
            										if (xmlHttp.status==200)
            										{
                										var s = xmlHttp.responseText;
                										if(s.split('@')[0]=="true")
                										{
                											hasjoin = "true";
                    										check();
                										}
                										else
                										{
                											alert("報名失敗");
                										}
                    									
            										}
       											 }
										 }
									
										 </script>
									</div>
            						<div class="col-md-6 portfolio-item" align="center">
            						</div>
                             </div>

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