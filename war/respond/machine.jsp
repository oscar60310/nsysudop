<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>意見調查</title>
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
								<h1><a href="#" id="logo">意見表單-短期</a></h1>
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
										<h2><a href="#">販賣機設置意願調查</a></h2>
										關於販賣機設置計畫，我們也會發放紙本調查<br>
										若您無法顯示表單，您可以點擊<a href="https://docs.google.com/forms/d/1SwgKvsaJmTvW0AVOR5e9iNf2rYnja5cpZQmvwcYdgtg/viewform" target="_blank">此處</a>
									</header>
									<div>
										<iframe id="view" src="https://docs.google.com/forms/d/1SwgKvsaJmTvW0AVOR5e9iNf2rYnja5cpZQmvwcYdgtg/viewform?embedded=true" width="100%"  height="1000" frameborder="0" marginheight="0" marginwidth="0">載入中…</iframe>
									</div>
									<script language="javascript">
							function reSize(){
　　//parent.document.all.frameid.height=document.body.scrollHeight; 
　　					parent.document.getElementById("view").height=document.body.scrollHeight;
							} 
							window.onload=reSize;
								</script>
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