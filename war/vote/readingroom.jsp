<%@page import="vote.Info"%>
<%@page import="java.util.Calendar"%>
<%@page import="nsysudop.gb.Bgrent"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>系K徵名－投票</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
       	<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
	</head>
    <%
Info info = new Info();
%>
	<body class="left-sidebar">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="#" id="logo">系K徵名－投票</a></h1>
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
										<h2><a href="#">系K徵名</a></h2>
										
									</header>
									<div>
										<p>
											系K徵名活動現在進行投票囉，趕快投下自己理想的名子吧!<br>
											<font color="red">因為這是正式的命名活動，我們刪除了一部份不太合適的徵名</font>
											<div id="timeshow"></div>
											<ui>
												<%
													String FB_State = "登入";
												    String name = session.getAttribute("name")+"";
													if(!name.startsWith("null"))
													{
													    FB_State = "已登入"+name;
													}
												%>
												<li>投票身分:中山光電系學生，
													<a href="/facebook/step1.jsp?state=/vote/readingroom.jsp"><%=FB_State %></a>
												</li>
												<li>投票規則:每人<%=info.getticket()%>票，您還剩下<%=info.last_ticket(session) %>票。</li>
												<li>投票時間:2015/11/23~2015/11/29</li>
										
												<script>
												   
													var endDate = new Date('2015/11/29 23:59:59');
													var ss = document.getElementById("timeshow");
													function update()
													{
														var now = new Date();
														var spantime = (endDate - now)/1000;
														if(spantime>0){
														var d = Math.floor(spantime / (24 * 3600));
             											var h = Math.floor((spantime % (24*3600))/3600);
             											var m = Math.floor((spantime % 3600)/(60));
             											var s = Math.floor(spantime%60);
             											ss.innerHTML ="離投票結束還有"+ d +"天"+h+"時"+m+"分"+s+"秒";
														setTimeout(update,1000);
														}
														else
														{
															ss.innerHTML = "投票結束";
														}
													}
													update();
												</script>
											</ui>

										</p>
										 <select class="form-control" id="vote_list" >
                                     	<option value="0">請選擇</option>	
 									 	</select>	
										  <br>
										  <a class="button" onclick="vote()">投票</a>
										<script>
										    var xmlHttp;
										 
											var list = "精神時光屋,佛足殿,佳儒軒,微光草堂,飲冰室,水濂洞,山海聽,四當齋,老學庵,靜虛村,積微廳".split(',');
											create();
											function create()
											{
												for(var i = 0  ; i < list.length ;i++)
												{
												var chose = document.createElement("option");
												chose.value = i+1;
												chose.innerHTML = list[i];
												//chose.setAttribute('onclick', "rent('"+i+"');");
											
												document.getElementById("vote_list").appendChild(chose); 
												
												}
											}
											function vote()
											{

												var c = document.getElementById("vote_list").value;
												if(c==0)
													return;
												var r=confirm("確定要投給"+ list[c-1]+"嗎?");
												if(r)
												{
													xmlHttp = new XMLHttpRequest();
													xmlHttp.onreadystatechange = recall;
									   				xmlHttp.open( "GET", "../vote/api/vote.jsp?id="+ c, true );
									    			xmlHttp.send(null);
												}
	
											}
											function recall()
    										{
        										if (xmlHttp.readyState==4)
        										{
            										if (xmlHttp.status==200)
            										{
                										var s = xmlHttp.responseText;
                										if(s.split('@')[0]=="success")
                										{
                    										alert("投票成功");
                     										location.reload();
                										}
                										else
                    									alert(s.split('@')[0]);

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