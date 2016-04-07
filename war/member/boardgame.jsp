
<%@page import="java.util.Calendar"%>
<%@page import="nsysudop.gb.Bgrent"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
							<div class="4u 12u(mobile) important(mobile)" id="sidebar">
						
								<section>
                                <ul>
                		<li><a href="../member/boardgame.jsp">租借申請</a></li>
                        <li><a href="../member/rentlist.jsp">租借查詢</a></li>
                        <li><a href="https://drive.google.com/file/d/0B94HRxPOCfYcR01pTlkyOXhlNlk/view?usp=sharing">租借方案</a></li>
                </ul>
									<header>
										<h3>系桌遊租借方案</h3>
									</header>
                                    <p>
										租借時間：每周一晚上7點到9點<br>
                                        見面地點：系倉（EC4040）<br>
                                        負責人：林威辰
									</p>
									<p>
										由於系上有許多桌遊，平常沒有機會能使用，因此希望藉由系桌遊租借的方式，讓系上的桌遊能物盡其用，以及讓系上的同學不用花錢便能大肆地玩桌遊，站在福利大家的角度，但同時我們也希望使用的人能夠好好愛惜公物。
									</p>
                                    <p>
                                     	<i class="fa fa-exclamation-triangle"></i>
使用前請先閱讀規章
                                    </p>
									<footer>
										<a href="https://drive.google.com/file/d/0B94HRxPOCfYcR01pTlkyOXhlNlk/view?usp=sharing" class="button" target="_blank">詳細規章</a>
									</footer>
								</section>
							</div>
							<div class="8u 12u(mobile)" id="content">
								<article id="main">
									<header>
										<h2><a href="#">租借申請</a></h2>
										<p>
											<%
											String msg="";
												if(session.getAttribute("fb")==null)
												{
												    msg="<a href='../facebook/step1.jsp?state=/member/boardgame.jsp' >"+
												            "您必須先登入才能租借</a>";
												}
												else
												{
												    msg ="<a href='../facebook/step1.jsp?state=/member/boardgame.jsp' >"+
												"登入:"+session.getAttribute("fb")+"</a>";
												}
											%>
											<%=msg %>
										</p>
									</header>
                                    <div class="form-group">
                                    <script>
									var selected = false;
                                    var xmlHttp;
									function checktime()
									{
										if(!selected)
										return;
										var s = document.getElementById("item");
										
										xmlHttp = new XMLHttpRequest();
										xmlHttp.onreadystatechange = recall;
									    xmlHttp.open( "GET", "../member/api/rentbg.jsp?t=check&id="+s.value, true );
									    xmlHttp.send(null);
									    console.log("Check "+s.value);
									}
									var st ;
									function recall()
									{
										if (xmlHttp.readyState==4)
										{
											if (xmlHttp.status==200)
											{
												var s = xmlHttp.responseText.split('@')[0];
											    st = s.split('#');
												document.getElementById("chooseday").innerHTML = "請選擇租借時間:<br>";
												for(var i = 0 ;i<st.length-2;i++)
												{
													console.log(st[i]);
													var chose = document.createElement("button");
													chose.type = "button";

													if(st[i].split(',')[1]=="true")
													{
														chose.className = "btn btn-success";
														chose.innerHTML = st[i].split(',')[0];
														chose.setAttribute('onclick', "rent('"+i+"');");
													}
													else
													{
														chose.className = "btn btn-danger";
														chose.disabled = "disabled";
														chose.innerHTML = st[i].split(',')[0]+"(已登記)";
														chose.setAttribute('onclick', "alert('此日期已經被登記');");
													}
													
													
													
													document.getElementById("chooseday").appendChild(chose); 
													document.getElementById("chooseday").innerHTML+="&nbsp;";
												}
											}
										}
									}
									function changesel()
									{
										selected = true;
										document.getElementById("chooseday").innerHTML = "";
										id = document.getElementById("item").value;
										var it = ["吹牛大王骰盅","蟑螂沙拉","蟑螂濃湯","Modern art","HALLI GALLI","象棋","俄羅斯輪盤","123 GAMES","波多黎各","卡卡頌"];
										name = it[parseInt(id)-1];
									}
									function ret()
									{
										document.getElementById("stpe1").style["display"]="block";
										document.getElementById("detail").style["display"]="none";
									}
									var name,id,datenum;
									function rent(s)
									{
										document.getElementById("rentdate").innerHTML = "租借日期: "+st[s].split(',')[0];
										var n =  parseInt(s) + 1 ;
										
										document.getElementById("backdate").innerHTML = "歸還日期: "+st[n].split(',')[0];									
										document.getElementById("itemname").innerHTML = "租借桌遊: "+name;
										document.getElementById("itemid").innerHTML = "桌遊編號: "+id;									
										document.getElementById("stpe1").style["display"]="none";
										document.getElementById("detail").style["display"]="block";
										datenum = s;
									}
									function go()
									{
										var realname = document.getElementById("realname").value;
										var phone = document.getElementById("phone").value;
										if(realname.length<2 || realname.length>4 ||phone.length <5 ||phone.length>15)
										{
											alert("請輸入正確姓名和聯絡方式");
											return;
										}
										xmlHttp = new XMLHttpRequest();
										xmlHttp.onreadystatechange = rerent;
									    xmlHttp.open( "GET", "../member/api/rentbg.jsp?t=rent&id="+id+"&date="+st[datenum].split(',')[0]+"&name="+realname+"&phone="+phone, true );
									    xmlHttp.send(null);
									    console.log("rent "+id+" at "+st[datenum].split(',')[0]);
									}
									function rerent()
									{
										if (xmlHttp.readyState==4)
										{
											if (xmlHttp.status==200)
											{
												var s = xmlHttp.responseText.split('@')[0];
												if(s=="success")
												{
													alert("申請成功，請在預定時間前往系倉拿取");
													window.location="../member/rentlist.jsp";
												}
												else
												{
											    alert(s);
												}
											}
										}
									}
									
									</script>
                               <div id="stpe1">
    								<label>選擇桌遊</label>
									 <select class="form-control" id="item" onchange="changesel()" >
                                     	<option value="0">請選擇</option>
    									<option value="1">吹牛大王骰盅</option>
   										<option value="2">蟑螂沙拉</option>
    									<option value="3">蟑螂濃湯</option>
    									<option value="4">Modern art</option>
                                        <option value="5">HALLI GALLI</option>
                                        <option value="6">象棋</option>
   										<option value="7">俄羅斯輪盤</option>
    									<option value="8">123 GAMES</option>
    									<option value="9">波多黎各</option>
                                        <option value="10">卡卡頌</option>
 									 </select>	
                                 	
                                    <button class="btn btn-default" onclick="checktime()">查詢可出借時間</button><br>
                    			    <div id="chooseday">
                                    </div>             
                                  </div>	
                                    <div id="detail" style="display:none;"> 
                                    <button class="btn btn-default" onclick="ret()">返回選擇項目</button>
                                  		<div id="itemname"></div>
                                        <div id="itemid"></div>
                                    	<div id="rentdate"></div>
                                        <div id="backdate"></div>
                                    	<div class="form-group">
    										<label>真實姓名</label>
    										<input id="realname" class="form-control"  placeholder="曾達幸">
  										</div>
                                        <div class="form-group">
    										<label>連絡電話</label>
    										<input id="phone" class="form-control"   placeholder="0912345678">
  										</div>
                                        <button type="button" class="btn btn-primary" onclick="go()">確定租借</button>
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