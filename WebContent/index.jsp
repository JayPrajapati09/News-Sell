<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.HomeDao"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Home</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Bootstrap css -->
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Main css -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!-- pop-up-box -->
	<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />
	<!-- menu style -->
	<!-- //Custom-Files -->

	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->
<style>
.b-style{
	width:100%;
	color:#F45C5D;
	text-align:center;
	border-left: 30px solid #0879c9;
	border-right: 30px solid #0879c9;
	border-top: 1px solid #0879c9;
	border-bottom: 1px solid #0879c9;

	border-radius:40%;
}
.l{
    border-left: 110px solid #0879c9;
    border-radius: 100%;
    width: 820px;
    height: 300px;
    color:#F45C5D;
  
}
.r{
    border-right: 110px solid #0879c9;
    border-radius: 100%;
    width: 780px;
    height: 300px;
    color:#F45C5D;
}
</style>
</head>
<body >
<div class="agile-main-top" >
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-4 header-most-top">
			
				</div>
				<div class="col-lg-8 header-right mt-lg-0 mt-2">
					<!-- header lists -->
					<ul  style="text-align: right">
	                   <li class="text-center border-right text-white">
							<a href="login_as.jsp" data-toggle="modal" data-target="#exampleModal" class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
						</li>
						<li class="text-center text-white">
							<a href="registration_as.jsp"  class="text-white">
								<i class="fas fa-sign-out-alt mr-2"></i>Register </a>
						</li>	  
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- header-bottom-->
	<div class="header-bot">
		<div class="container">
			<div class="row header-bot_inner_wthreeinfo_header_mid">
				<!-- logo -->
				<div class="col-md-3 logo_agile">
					<h1 class="text-center">
						<a href="index.jsp" class="font-weight-bold font-italic">
							<img src="images/logo2.png" alt=" " class="img-fluid">News Sell
						</a>
					</h1>
			    </div>
		    </div>
	    </div>
	</div>	
	<!-- navigation -->
	<div class="navbar-inner">
		 <div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				  <ul class="navbar-nav ml-auto text-center mr-xl-5">
						<li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="index.jsp">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
					
					</ul>
				</div>
			</nav>
		</div>
	</div>
<div >

	<div class="container  l" ><br><br><br><br>
	<h4 style=" font-size: 100px;"><b>Advertise Here</b></h4>
	</div>
	<div class="container  r" ><br><br><br><br><br>
		<h3 style=" font-size: 70px;">Total Media House <% out.print(HomeDao.mediaCount()); %></h3>
	</div>
	<div class="container  l" ><br><br><br><br><br>
		<h3 style=" font-size: 70px;">Total Users <%out.print(HomeDao.users()); %>  </h3>
	</div>
	<div class="container  r" ><br><br><br><br><br>
		<h3 style=" font-size: 70px;">Total News <%out.print(HomeDao.news()); %></h3>
	</div>
	</div>
			<!-- footer third section -->
		<div class="w3l-middlefooter-sec">
			<div class="container py-md-5 py-sm-4 py-3">
				<div class="row footer-info w3-agileits-info">
					<!-- footer categories -->
					<!-- //footer categories -->
					<!-- quick links -->
					<div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
						<ul>
							<li class="mb-3">
								<a href="about.jsp">About Us</a>
							</li>
							<li class="mb-3">
								<a href="contact.jsp">Contact Us</a>
							</li>
							<li class="mb-3">
								<a href="terms.jsp">Terms of use</a>
							</li>
						
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
						<ul>
							<li class="mb-3">
								<i class="fas fa-map-marker"></i>Sal College</li>
							
							<li class="mb-3">
								<i class="fas fa-phone"></i> +814 030 9546</li>
							<li class="mb-3">
								<i class="fas fa-envelope-open"></i>
								 NewsSell78@gmail.com
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids w3l-agileits mt-md-0 mt-4">
			
						
					</div>
				</div>
			</div>
		</div>
	<!-- copyright -->
	<div class="copy-right py-3">
		<div class="container">
			<p class="text-center text-white">News Sell || The Online News Selling Platform	</p>
		</div>
	</div>
</body>
</html>