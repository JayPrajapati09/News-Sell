<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Login</title>
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
	.d-center {
	width: 500px;
	position: absolute;
	top:0;
	bottom: 0;
	left: 0;
	right: 0;
  	margin-top:50px;
  	margin-left:400px;
}
	</style>
</head>
<body>
<div class="agile-main-top">
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

	<div class="d-center">
		<div class="modal-header">
			<h5 class="modal-title text-center">Log in</h5>
		</div>
			<div class="modal-body">
			<form action="UserController" method="post">
	     			<%
					if(request.getAttribute("msg")!=null)
					{   %>
                	<div class="right-w3l">
					<input type="button" name="action"class="form-control" 
					value="<%out.println(request.getAttribute("msg")); %>"style="color: #fff;background-color: #495057;">
					</div>
					<% }
			   		%>
						<div class="form-group">
							<label class="col-form-label">Email</label>
							<input type="email" class="form-control" name="email" required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label">Password</label>
							<input type="password" class="form-control"  name="pass" required="required">
						</div>
						<div class="right-w3l">
							<input type="submit" name="action"class="form-control" value="Log in">
					    <a href="user_forgot_password.jsp"><input type="button" name="action"class="form-control" value="Forgot Password"></a>
						</div>
			    </form>
				</div>
			</div>
</body>
</html>