<%@page import="com.bean.UserReg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
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
.c-w{
	background-color:#0879c9;
	
	float:right;
	width:60px;
	height:60px;
	border:0px solid #0879c9;
	border-radius:100%;
	display:inline-block;
}
</style>
</head>
<body>
 <%
   UserReg unv = null;
	 if (session!= null)
		{
			if(session.getAttribute("u")!=null)
		    {
			   unv = (UserReg)session.getAttribute("u");
  %>
			<div style="width:100%;display:inline-block;height:150px;">
				<div style="width:50%;display:inline-block;float:left;height:100px;">
					<h1 class="text-center">
						<a href="index.jsp" class="font-weight-bold font-italic" style="float:left;">
							<img src="images/logo2.png" alt=" " class="img-fluid" >News Sell
						</a>
					</h1>
				</div>
				<!-- //logo -->
				<!-- header-bot -->
				<div  style="width:50%;display:inline-block;float:right;height:100px;">
					<a href="user_profile.jsp">
					<button class="c-w" style="margin:10px 10px 0px 0px;">
						<i class="fa fa-user" style="font-size:20px;color:white;"></i>
					</button>
					</a>
				</div>
				<div style="width:100%;display:inline-block;float:right;height:50px;">
					<div style="width:9%;display:inline-block;float:right;height:50px;text-align:center;">
						<h6><a href="user_news_view.jsp">View All News
									</a></h6>
					</div>
					<div style="width:7%;display:inline-block;float:right;height:50px;text-align:center;">
						<h6><a href="user_uploadnews.jsp">Upload News
									</a></h6>
					</div>
					<div style="width:7%;display:inline-block;float:right;height:50px;text-align:center;">
						<h6><a href="user_index.jsp">Home
									</a></h6>
					</div>
				</div>
</div>
<%
  }
} 
%>
</body>
</html>