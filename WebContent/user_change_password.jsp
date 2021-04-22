<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="user_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Change Password</title>
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
.d-center
{
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
<% if(request.getAttribute("msg")!=null)
	{   
%>
   <div class="right-w3l">
		<input type="button" name="action"class="form-control" 
				value="<%out.println(request.getAttribute("msg")); %>"
				style="color: #fff;background-color: #495057;">
	</div>
<% }

	UserReg ucp= null;
		if (session!= null)
		{
			if(session.getAttribute("u")!=null)
			{
			   ucp = (UserReg)session.getAttribute("u");
%>
 <div class="d-center">	
		<div class="modal-header">
			<h5 class="modal-title text-center my-3">Change Password</h5>
		</div>
		<div class="modal-body">
			<form action="UserController" method="post">  
			<input type="hidden" name="email" value="<%=ucp.getEmail()%>">
 				<div class="form-group">
					<label class="col-form-label">Enter Old Password</label>
					<input type="text" class="form-control" name="o_pass" required="required">
					<label class="col-form-label">Enter New Password</label>
					<input type="password" class="form-control"  name="n_pass" required="required">
					<label class="col-form-label">Confirm New Password</label>
					<input type="password" class="form-control" name="c_pass" required="required">
				</div>
				<div class="right-w3l">
					<input type="submit" name="action"class="form-control" value="Change Password">
				</div>
			</form>	
		</div>
		</div>
<%
   }
} 
%>
</body>
</html>