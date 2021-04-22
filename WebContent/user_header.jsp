<%@page import="com.bean.UserReg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
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
.button-top {
  border: none;
  color: white;
  height:40px;
  width:150px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px;
  cursor: pointer;
  border-radius: 20px;
  background-color:#212529;
}
</style>

</head>

<body>
<%
	UserReg u = null;
		if (session!= null)
		{
			if(session.getAttribute("u")!=null)
			{
			   u = (UserReg)session.getAttribute("u");
%> 
	<div class="agile-main-top" >
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-4 header-most-top" >
				 	<h3>
				 		<span class="badge rounded-pill "
				 			style="color:#F45C5D;background-color:#0879c9;">
				 			<b>Hello <%=u.getFirstname() %></b>
				 		</span>
					</h3>
				</div>
				<div class="col-lg-8 header-right mt-lg-0 mt-2">
					<!-- header lists -->
					<ul  style="text-align: right">
	       <li class="text-center border-right text-white">
							<form action="logout.jsp" class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i>
								<input type="hidden" name="page" value="user">
								<input type="submit" name="action" value="Logout"
								style="background-color:#0879c9;border:0px solid #0879c9;" 
								class="text-white">
								  
								
							</form>
						</li>
						<li class="text-center text-white">
							<a href="user_change_password.jsp"  class="text-white">
								<i class="fas fa-sign-out-alt mr-2"></i>Change Password </a>
						</li>	  
			  <%  }
					    else   
					    {   %>
					    <li class="text-center border-right text-white">
							<a href="login_as.jsp" data-toggle="modal" data-target="#exampleModal" class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
						</li>
						<li class="text-center text-white">
							<a href="registration_as.jsp" data-toggle="modal" data-target="#exampleModal2" class="text-white">
								<i class="fas fa-sign-out-alt mr-2"></i>Register </a>
						</li>
		      <%  }
					    }  
		      else   
		      {
		      %>
						<li class="text-center border-right text-white">
							<a href="login_as.jsp" data-toggle="modal" data-target="#exampleModal" class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i> Log In </a>
						</li>
						<li class="text-center text-white">
							<a href="registration_as.jsp" data-toggle="modal" data-target="#exampleModal2" class="text-white">
								<i class="fas fa-sign-out-alt mr-2"></i>Register </a>
						</li>
			  <% 
			  }
			  %>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
