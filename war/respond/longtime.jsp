<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>意見表單</title>
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
								<h1><a href="#" id="logo">意見表單-長期</a></h1>
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
										<h2><a href="#">長期表單</a></h2>
										您的意見是我們進步的動力，有話儘管說吧!
									</header>
									<div>
										<iframe id="view" src="https://docs.google.com/forms/d/10FUOmu0KDcSHKhzyWnCixb3Ot0jckPhhA2pPmdWuYjg/viewform?embedded=true" width="100%"  frameborder="0" marginheight="0" marginwidth="0">載入中…</iframe>
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