<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.BuyerDao"%>
<%@ include file="buyer_header.jsp" %>

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
<%
BuyerReg buyer = null;
if (session!= null)
	{
    if(session.getAttribute("b")!=null)
	{
    BuyerReg brg = (BuyerReg)session.getAttribute("b");
	buyer = BuyerDao.getUserById(brg.getBid());
    %>
<div class="container">
<div class="d-center">

				<div class="modal-header">
					<h5 class="modal-title"><%=buyer.getMname() %>'s Profile</h5>
				</div>
				<div class="modal-body">
					<form action="BuyerController" method="post"  enctype="multipart/form-data">
					<input type="hidden" class="form-control" name="bid" 
							value="<%=buyer.getBid()%>">
						<div class="form-group">
							<label class="col-form-label"><b>Media House Name</b></label>
							<input type="text" class="form-control" name="mname" 
							value="<%=buyer.getMname()%>" required="required" maxlength="30">
						</div>
						<div class="form-group">
							<label class="col-form-label"><b>Description</b></label>
							<textarea class="form-control" name="des" rows="4" cols="50"  
							required="required" style="text-align:left;margin-left:0px;" maxlength="100">
							<%=buyer.getDes()%>
							</textarea>
						</div>
					<%-- 	<div class="form-group">
						    <label class="col-form-label"><b>Logo</b></label>
						    <img src="media_logo/<%=buyer.getLogo()%>" width="100" height="100">
							<input type="file" class="form-control"  name="logo"  
							value="<%=buyer.getLogo()%>"  maxlength="15">
						</div>  --%>
						<div class="form-group">
						    <label class="col-form-label"><b>Your Scope</b></label>
							<select name="scope" required  >
							 <%if(buyer.getScope()==null)
							   {
							   }
							   else
							   {%>
							   <option value="<%=buyer.getScope()%>" selected><%=buyer.getScope()%></option>
							 <%}
							   %>
							     <option>All India</option>
							     <option>Andhra Pradesh </option>
								 <option>Arunachal Pradesh </option>
								 <option>Assam </option>
								 <option>Bihar </option>
								 <option>Chhattisgarh </option>
								 <option>Goa </option>
								 <option>Gujarat </option>
								 <option>Haryana </option>
								 <option>Himachal Pradesh </option>
							 	 <option>Jharkhand </option>
								 <option>Karnataka </option>
								 <option>Kerala </option>
								 <option>Madhya Pradesh</option>
								 <option>Maharashtra </option>
								 <option>Manipur </option>
								 <option>Meghalaya </option>
								 <option>Mizoram </option>
								 <option>Nagaland </option>
								 <option>Odisha </option>
								 <option>Punjab </option>
								 <option>Rajasthan </option>
								 <option>Sikkim </option>
								 <option>Tamil Nadu </option>
								 <option>Telangana </option>
								 <option>Tripura </option>
								 <option>Uttar Pradesh </option>
								 <option>Uttarakhand </option>
								 <option>West Bengal </option>
								 <option>Andaman and Nicobar Islands</option>
								 <option>Chandigarh</option>
								 <option>Dadra and Nagar Haveli and Daman and Diu</option>
								 <option>Delhi</option>
								 <option>Jammu and Kashmir</option>
								 <option>Ladakh</option>
								 <option>Lakshadweep</option>
								 <option>Puducherry</option>
								 <option>Out Of India</option>
							</select>
						</div> 
				    	<div class="form-group">
							<label class="col-form-label"><b>Address</b></label>
							<input type="text" class="form-control"  name="add" 
							value="<%=buyer.getAdd()%>" required="required" maxlength="40">
					  	</div>  
					<%-- 	<div class="form-group">
							<label class="col-form-label"><b>Email</b></label>
							<input type="email" class="form-control"  name="email" 
							value="<%=buyer.getEmail()%>" required="required" maxlength="30">
						</div> --%>
						<div class="form-group">
							<label class="col-form-label"><b>Contact No</b></label>
							<input type="text" class="form-control"  name="cno" 
							value="<%=buyer.getCno()%>" required="required" maxlength="13">
						</div>
						<div class="form-group">
							<label class="col-form-label"><b>Landline No</b></label>
							<input type="text" class="form-control"  name="lno" 
							value="<%=buyer.getLno()%>" required="required" maxlength="13">
						</div>				
						<div class="right-w3l">
							<input type="submit" class="b-bottom" name="action" value="Update Profile" >
							<a href="buyer_index.jsp">
							<input type="button" class="b-bottom" name="action" value="Back" >
							</a>
						</div>
	</form>
	</div>

</div>
</div>
<%
    }
} 
%>
</body>
</html>