<%@ include file="user_header.jsp" %>
<%@ include file="user_navigation.jsp" %>
<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template,
	 Bootstrap Web Templates, 
	Flat Web Templates, Android Compatible web template, Smartphone 
	Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson,
	 Motorola web design"
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
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,
	700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,
	400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,
	latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->

</head>
<body>
<%

UserReg unp = null;
	if (session!= null)
	{
		if(session.getAttribute("u")!=null)
		{
		unp = (UserReg)session.getAttribute("u");

		if(request.getAttribute("msg")!=null)
		{   %>
         <div class="right-w3l">
			<input type="button" name="action"class="form-control" 
				value="<%out.println(request.getAttribute("msg")); %>"
				style="color: #fff;background-color: #495057;">
		  </div>
 	 <% }

%>
<div class="card text-center">
  <div class="card-body">
    <h5 class="card-title"><b>Total News Submitted</b></h5>
    <button type="button" class="btn btn-primary"><%=UserDao.user_news_info(unp.getUid())[0] %></button>
  </div>
</div>
<div class="card text-center">
  <div class="card-body">
    <h5 class="card-title"><b>Total Sold News</b></h5>
    <button type="button" class="btn btn-primary"><%=UserDao.user_news_info(unp.getUid())[1] %></button>
  </div>
</div>
<div class="card text-center">
  <div class="card-body">
    <h5 class="card-title"><b>Total Unsold News</b></h5>
    <button type="button" class="btn btn-primary">
    		<%=UserDao.user_news_info(unp.getUid())[0]-UserDao.user_news_info(unp.getUid())[1] %></button>
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
								<a href="user_uploadnews.jsp">Upload News</a>
							</li>
							<li class="mb-3">
								<a href="user_news_view.jsp">View News</a>
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
<%
   }
}
%>
</body>
</html>