<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="user_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
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
.b-bottom{
	color:white;
	width:210px;
	height:50px;
	display: inline-block;
	margin-left:10px;
	background-color:#007bff;
	border:none;
	border-radius:5px;
}
	</style>
</head>
<body>

<div class="d-center">
			  <%
			  UserReg up = null;
			  if (session!= null)
			  {
					    if(session.getAttribute("u")!=null)
					    {
						up = (UserReg)session.getAttribute("u");
			  %>
				<div class="modal-header">
					<h5 class="modal-title"><%out.println(up.getFirstname()); %>'s Profile</h5>
				</div>
				<div class="modal-body">
					<form action="UserController" method="post">
					
						<div class="form-group">
							<label class="col-form-label">Firstname</label>
							<input type="text" class="form-control" name="fname" required="required" 
							value="<%out.println(up.getFirstname());%>" maxlength="20">
						</div>
						<div class="form-group">
							<label class="col-form-label">Lastname</label>
							<input type="text" class="form-control"  name="lname" required="required"
							value="<%out.println(up.getLastname());%>" maxlength="20">
						</div>
						<div class="form-group">
							<label class="col-form-label">Address</label>
							<input type="text" class="form-control" name="add" required="required"
							value="<%out.println(up.getAddress());%> " maxlength="40">
						</div>
						<div class="form-group">
							<label class="col-form-label">Mobile No</label>
							<input type="text" class="form-control"  name="mob" required="required"
							value="<%out.println(up.getMobileno());%>" maxlength="13">
						</div>				
						<div class="right-w3l">
							<input type="submit" class="b-bottom" name="action" 
							value="Update Profile" style="background-color:#007bff;">
							<a href="user_index.jsp">
							<input type="button" class="b-bottom" name="action" value="Back" >
							</a>
						</div>
					</form>
				</div>
	<%
		    }
	    }
	%>
</div>
</body>
</html>