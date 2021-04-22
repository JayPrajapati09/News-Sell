<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
<title>User Registration</title>	
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
					<h5 class="modal-title">Register</h5>
				</div>
				<div class="modal-body">
				<%if(request.getAttribute("e")!=null)
					{%>
				<div class="right-w3l">
					<input type="button"  class="form-control" 
					value="<%out.println(request.getAttribute("e")); %>"style="color: #fff;background-color: #495057;">
				</div>
				<%}
				%>
					<form action="UserController" method="post" >
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
							<label class="col-form-label">Firstname</label>
							<%if (request.getAttribute("fname")!=null) 
							{	%>
							<input type="text" class="form-control"  name="fname" 
							value="<% out.println(request.getAttribute("fname"));%>" 
							required="required" maxlength="20">
						    <%
							}
						    else
						    {
						       %>
						       <input type="text" class="form-control" name="fname" 
						       required="required" maxlength="20">
						 <%	}  %>
						</div> 
						<div class="form-group">
							<label class="col-form-label">Lastname</label>
							<%if (request.getAttribute("lname")!=null) 
							{	%>
							<input type="text" class="form-control"  name="lname" 
							value="<% out.println(request.getAttribute("lname"));%>" 
							required="required" maxlength="20">
						    <%
							}
						    else
						    {
						       %>
						       <input type="text" class="form-control" name="lname" 
						       required="required" maxlength="20">
						 <%	}  %>
						</div>
						<div class="form-group">
							<label class="col-form-label">Address</label>
							<%if (request.getAttribute("add")!=null) 
							{	%>
							<input type="text" class="form-control"  name="add" 
							value="<% out.println(request.getAttribute("add"));%>" 
							required="required" maxlength="40">
						    <%
							}
						    else
						    {
						       %>
						       <input type="text" class="form-control" name="add" 
						       required="required" maxlength="40">
						 <%	}  %>
						</div>
						<div class="form-group">
							<label class="col-form-label">Email</label>
							<%if (request.getAttribute("email")!=null) 
							{	%>
							<input type="text" class="form-control" 
							style="border: 2px solid #0879c9;"  name="email" 
							value="<% out.println(request.getAttribute("email"));%>" 
							required="required" maxlength="30">
						    <%
							}
						    else
						    {
						       %>
						       <input type="email" class="form-control" name="email" 
						       required="required" maxlength="30">
						 <%	}  %>
						</div>
						<div class="form-group">
							<label class="col-form-label">Mobile No</label>
							<%if (request.getAttribute("mob")!=null) 
							{	%>
							<input type="text" class="form-control"  
							name="mob" value="<% out.println(request.getAttribute("mob"));%>" 
							required="required" pattern="[0-9]{10}" 
							title="Enter Ten Digit Mobile No " maxlength="13">
						    <%
							}
						    else
						    {
						       %>
						       <input type="text" class="form-control" name="mob" 
						       required="required" maxlength="13">
						 <%	}  %>
						</div>
						<div class="form-group">
							<label class="col-form-label">Password</label>
							<input type="password" class="form-control"  
							name="pass" id="password1" required="required" maxlength="10">
							
						</div>
						<div class="form-group">
							<label class="col-form-label">Confirm Password</label>
							<input type="password" class="form-control"  name="cpass" 
							id="password1" required="required" maxlength="10">
						</div>
						<div class="right-w3l">
							<input type="submit" class="form-control" name="action" value="Register">
						</div>
						
					</form>
				</div>
			</div>
</body>
</html>