<%@page import="com.bean.Admin"%>
<%@page import="com.bean.UserReg"%>
<%@page import="com.bean.BuyerReg"%>
<%@page import="com.bean.AddNews"%>
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
	Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, 
	SonyEricsson, Motorola web design"
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
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,
	400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,
	400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,
	greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->
<style>
.c-w{
	background-color:#0879c9;
	border-style:none;
	float:right;
	width:60px;
	height:60px;
	border-radius:50%;
	display:inline-block;
}
.list-style-nav{
	display:inline-block;
	margin-top:3%;
	margin-left:4%;
}
.btn{
    width:20%;
    display:inline-block;
}
</style>
</head>
<body>
<%
					if(request.getAttribute("msg")!=null)
					{   %>
                	<div class="right-w3l">
					<input type="button" name="action"class="form-control" 
					value="<%out.println(request.getAttribute("msg")); %>"style="color: #fff;background-color: #495057;">
					</div>
					<% }
			   		%>
	<div class="agile-main-top">
		<div class="container-fluid">
			<div class="row main-top-w3l py-2">
				<div class="col-lg-4 header-most-top">
				</div>
				<div class="col-lg-8 header-right mt-lg-0 mt-2">
					<!-- header lists -->
					<ul  style="text-align: right">
					<li  class="text-center border-right text-white">
		           		<form action="logout.jsp" class="text-white">
		           		<input type="hidden" name="page" value="admin">
								<button type="submit" name="action" value="admin"
								style="background-color:#0879c9;border:0px solid #0879c9;" 
								class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i> Log Out 
								</button>
						</form>	  
					</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<div style="width:100%;display:inline-block;height:150px;">
				<div style="width:50%;display:inline-block;float:left;height:100px;">
					<h1 class="text-center">
						<a href="index.jsp" class="font-weight-bold font-italic" 
						style="float:left;">
							<img src="images/logo2.png" alt=" " class="img-fluid" >News Sell
						</a>
					</h1>
				</div>
				<!-- //logo -->
				<!-- header-bot -->
		
		<div style="width:100%;display:inline-block;float:right;height:50px;">
			<div style="width:7%;display:inline-block;float:right;
			height:50px;text-align:center;">
				<h6><a href="user_index.jsp">Home
							</a></h6>
			</div>
		</div>
</div>
<div class="container" >
		<div class="modal-header">
			<h3 class="modal-title">User</h3>
		</div>
		<form action="AdminController" method="post">
		  <div class="form-row align-items-center">
		    <div class="col-auto">
		      	<label class="sr-only" for="inlineFormInput">email</label>
		      	<input type="email" name="email" 
		      	class="form-control mb-2" id="inlineFormInput" required>
		    </div>
		    <div class="col-auto" style="width:40%;">
		      	<button type="submit" class="btn btn-primary mb-2" 
		      		name="action" value="user" >
		      		Get User
		      	</button>
		    </div>
		  </div>
		</form>
	  <%
	  UserReg u = (UserReg)request.getAttribute("u");
	  if(u!=null)
	  {
	  %>			
			<div class="modal-body">
	  			<form action="AdminController" method="post">
	  						<div class="form-group">
	  							<input type="text" class="form-control" name="uid" 
								value="<%=u.getUid()%>" readonly>
							</div>
							<div class="form-group">
								<label class="col-form-label">Firstname</label>
								<input type="text" class="form-control" name="fname" 
								value="<%=u.getFirstname()%>">
							</div>
							<div class="form-group">
								<label class="col-form-label">Lastname</label>
								<input type="text" class="form-control"  name="lname" 
								value="<%=u.getLastname()%>" >
							</div>
							<div class="form-group">
								<label class="col-form-label">Address</label>
								<input type="text" class="form-control" name="add" 
								value="<%=u.getAddress()%> ">
							</div>
							<div class="form-group">
								<label class="col-form-label">Email</label>
								<input type="email" class="form-control" name="email"
								 value="<%=u.getEmail()%>">
							</div>
							<div class="form-group">
								<label class="col-form-label">Mobile No</label>
								<input type="text" class="form-control"  name="mob" 
								value="<%=u.getMobileno() %>" >
							</div>
				<div class="form-row align-items-center">
    				<div class="col-auto">
      					<label class="sr-only" for="inlineFormInput">Update User</label>
      					<input type="submit" name="action" class="form-control mb-2" 
      					id="inlineFormInput" value="Update User" 
      					style="background-color:#0879c9;color:white;">
    				</div>
    				<div class="col-auto">
      					<label class="sr-only" for="inlineFormInput">Delete User</label>
      					<input type="submit" name="action" class="form-control mb-2" 
      					id="inlineFormInput" value="Delete User" 
      					style="background-color:#0879c9;color:white;">
    				</div>
  				</div>
      		</form>
    	</div>			 
	  <%
	  }
	  %>
</div>

<div class="container" >
  	    <div class="modal-header">
			<h3 class="modal-title">Buyer</h3>
		</div>
		<form action="AdminController" method="post">
		  <div class="form-row align-items-center">
		    <div class="col-auto">
		      	<label class="sr-only" for="inlineFormInput">email</label>
		      	<input type="email" name="email" class="form-control mb-2" 
		      	id="inlineFormInput" required>
		    </div>
		    <div class="col-auto" style="width:40%;">
		      	<button type="submit" class="btn btn-primary mb-2" 
		      		name="action" value="buyer" >
		      		Get Buyer
		      	</button>
		    </div>
		  </div>
		</form>
	 <%
	  BuyerReg b = (BuyerReg)request.getAttribute("b");
	  if(b!=null)
	  {
	  %>			
			<div class="modal-body">
	  			<form action="AdminController" method="post">
	  					<div class="form-group">
							<label class="col-form-label"><b>Media House Name</b></label>
							<input type="text" class="form-control"  name="bid" 
							value="<%=b.getBid() %>" required="required" readonly>
						</div>
	  					<div class="form-group">
							<label class="col-form-label"><b>Media House Name</b></label>
							<input type="text" class="form-control"  name="mname" 
							value="<%=b.getMname() %>" required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label"><b>Description</b></label>
							<textarea class="form-control" name="des" rows="4" cols="50" 
							required="required">
							<%=b.getDes() %>
							</textarea>
						</div> 
						<div class="form-group">
							<label class="col-form-label"><b>Logo Image Name</b></label>
							<input type="text" class="form-control"  name="logo" 
							value="<%=b.getLogo() %>" required="required" readonly>
						</div> 
						<div class="form-group">
						    <label class="col-form-label"><b>Your Scope</b></label>
							<select name="scope" required>
								<option selected><%=b.getScope() %></option>
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
							value="<%=b.getAdd()%>"required="required">
					  	</div>  
						<div class="form-group">
							<label class="col-form-label"><b>Email</b></label>
							<input type="email" class="form-control"  name="email" 
							value="<%=b.getEmail() %>" required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label"><b>Contact No</b></label>
							<input type="text" class="form-control"  name="cno" 
							value="<%=b.getCno()%>" required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label"><b>Landline No</b></label>
							<input type="text" class="form-control"  name="lno" 
						    value="<%=b.getLno()%>"	required="required">
						</div>
						<div class="form-group">
							<label class="col-form-label"><b>Password</b></label>
							<input type="text" class="form-control"  
							value="<%=b.getPass()%>"name="pass" id="password1" 
							required="required">
						</div>
				<div class="form-row align-items-center">
    				<div class="col-auto">
      					<label class="sr-only" for="inlineFormInput">Update Buyer</label>
      					<input type="submit" name="action" class="form-control mb-2" 
      					id="inlineFormInput" value="Update Buyer" 
      					style="background-color:#0879c9;color:white;">
    				</div>
    				<div class="col-auto">
      					<label class="sr-only" for="inlineFormInput">Delete Buyer</label>
      					<input type="submit" name="action" class="form-control mb-2" 
      					id="inlineFormInput" value="Delete Buyer" 
      					style="background-color:#0879c9;color:white;">
    				</div>
  				</div>
      		
      		</form>
    	</div>			 
	  <%
	  }
	  %>
</div>

<div  class="container" style="position:relative;width:100%">
  	    <div class="modal-header">
			<h3 class="modal-title">News</h3>
		</div>
		<form action="AdminController" method="post">
		  <div class="form-row align-items-center">
		    <div class="col-auto">
		      	<label class="sr-only" for="inlineFormInput">nid</label>
		      	<input type="number" name="nid" 
		      	class="form-control mb-2" id="inlineFormInput" required>
		    </div>
		    <div class="col-auto" style="width:40%;">
		      	<button type="submit" class="btn btn-primary mb-2" 
		      		name="action" value="news" >
		      		Get News
		      	</button>
		    </div>
		  </div>
		 
		</form>
		 </div>
	 <%
	  AddNews ns = (AddNews)request.getAttribute("ns");
	  if(ns!= null)
	  {
	  %>			
			<div class="modal-body">
				<form action="AdminController" method="post" >
				<input type="hidden" name="nid" value="<%=ns.getNid() %>">
				  <div style="width:50%;float:left;">
					<div class="modal-body">    
					<div class="form-group">
							<label class="col-form-label">Venue</label>
							<input type="text" class="form-control" name="venue" 
							maxlength = "20" 
							value="<%=ns.getVenue()%>">
					</div>
					<div class="form-group">
							<label class="col-form-label">News Title</label>
							<input type="text" class="form-control" name="ntitle" 
							maxlength = "20" value="<%=ns.getNtitle()%>">
					</div>
					<div class="form-group">
							<label class="col-form-label">News Type</label><br>
					       <select name="ntype">
					        <option selected="selected"><%=ns.getNtype() %></option>
					       <option>Social</option>
					       <option>Political</option>
					       <option>Sports</option>
					       <option>Entertainment</option>
					       <option>Agricultural</option>
					       <option>Educational</option>
					       <option>Finance</option>
					       <option>Religious</option>
					       <option>Health</option>
					       <option>Medical</option>
					       <option>Science</option>
					       <option>Technology</option>
					       </select>
					</div>
					<div class="form-group">
							<label class="col-form-label">News Description</label>
							<textarea  class="form-control" rows=10 cols=72 
							name="ndesc"><%=ns.getNdesc() %></textarea>
					</div>
					<div class="form-group">
							<label class="col-form-label">Expected Amount </label>
							<input type="number" class="form-control" 
							name="nprice" min="1" value="<%=ns.getAmount()%>">
					</div>
				  </div>
				</div>
				<div style="width:40%;float:right;">
				  <div class="modal-body">
					<div class="form-group">
							<label class="col-form-label">News Heading</label>
							<input type="text" class="form-control" 
							name="nhead" maxlength = "50" value="<%=ns.getNhead()%>">
					</div>
				  	 <div class="form-group">
							<label class="col-form-label">News Image</label>
							<input type="text" class="form-control" name="nimg" 
							 value="<%=ns.getNimg()%>">
							
					</div>
					<div class="form-group">
							<label class="col-form-label">News Video link</label>
							<input type="text" class="form-control"  name="nvideo" 
							value="<%=ns.getNvideo()%>">
					</div>
					 
				 	<div class="form-group">
							<label class="col-form-label">News Visibility</label>
					    <% String visibility = ns.getVisibility();
				       if (visibility.equals("Public"))
				       {
				       %>
				            <input type="radio"  name="visibility" value="Public" checked>
				       		<label for="Public">Public</label>
				       		<input type="radio"  name="visibility" value="Private">
				       		<label for="Private">Private</label>	
				       <%
				       }
				       else
				       {
				       %>
				            <input type="radio"  name="visibility" value="Private" checked>
				       		<label for="Private">Private</label>
				       		<input type="radio"  name="visibility" value="Public">
				       		<label for="Public">Public</label>
				       <%
				       }
				       %>
					 </div>
					 <h4>Proof</h4>
					 <%String res = ns.getRestriction();
				       				%>
					  	<div class="form-group">
					  <%
				       if (res.charAt(0)=='A')
				       {
				       %>
					    <label class="col-form-label">Descriptive</label>
					    <input type="radio"  name="d_visibility" value="A" checked>
				        <label for="A">Yes</label>
				        <input type="radio"  name="d_visibility" value="N" >
				        <label for="N">No</label>
				       <%
				       }
				 
				       else
				       {
				       %>
				       	<label class="col-form-label">Descriptive</label>
					    <input type="radio"  name="d_visibility" value="A" >
				        <label for="A">Yes</label>
				        <input type="radio"  name="d_visibility" value="N" checked>
				        <label for="N">No</label>
				       <%
				       }
				       %>  
					 </div>
					  	<div class="form-group">
					  	<%
					  	if(res.charAt(1)=='A')
					  	{
					  	%>
					  	<label class="col-form-label">Images</label>
					    <input type="radio"  name="i_visibility" value="A" checked>    
				        <label for="A">Yes</label>
				        <input type="radio"  name="i_visibility" value="N" >
				        <label for="N">No</label>
					  	<%
					  	}
					  	else
					  	{
					    %>
					    <label class="col-form-label">Images</label>
					    <input type="radio"  name="i_visibility" value="A" >    
				        <label for="A">Yes</label>
				        <input type="radio"  name="i_visibility" value="N" checked>
				        <label for="N">No</label>
					    <%
					  	}
					    %>
						
					 </div>
					  	<div class="form-group">
					  	<%
					  	if(res.charAt(2)=='A')
					  	{
					  	%>
					  	 <label class="col-form-label">Video</label>
					     <input type="radio"  name="v_visibility" value="A" checked>
				         <label for="A">Yes</label>
				         <input type="radio"  name="v_visibility" value="N" >
				         <label for="N">No</label>
					  	<%
					  	}
					  	else
					  	{
					    %>
					     <label class="col-form-label">Video</label>
					     <input type="radio"  name="v_visibility" value="A" >
				         <label for="A">Yes</label>
				         <input type="radio"  name="v_visibility" value="N" checked>
				         <label for="N">No</label>
					    <%
					  	}
					    %>
						
					 </div>
					  	<div class="form-group">
					    <%
					  	if(res.charAt(3)=='A')
					  	{
					  	%>
					  		<label class="col-form-label">Other</label>
					    	<input type="radio"  name="a_visibility" value="A" checked>
				        	<label for="A">Yes</label>
				        	<input type="radio"  name="a_visibility" value="N" >
				        	<label for="N">No</label>
					  	<%
					  	}
					  	else
					  	{
					    %>
					    	<label class="col-form-label">Other</label>
					    	<input type="radio"  name="a_visibility" value="A" >
				        	<label for="A">Yes</label>
				        	<input type="radio"  name="a_visibility" value="N" checked>
				        	<label for="N">No</label>
					    <%
					  	}
					    %>
					
					 </div>
				   </div>
				 </div>	
				<div class="form-group">
    				<div class="col-auto">
      					<label class="sr-only" for="inlineFormInput">Update News</label>
      					<input type="submit" name="action" class="form-control mb-2" 
      					id="inlineFormInput" value="Update News" 
      					style="background-color:#0879c9;color:white;">
    				</div>
    				<div class="col-auto">
      					<label class="sr-only" for="inlineFormInput">Delete News</label>
      					<input type="submit" name="action" class="form-control mb-2" 
      					id="inlineFormInput" value="Delete News" 
      					style="background-color:#0879c9;color:white;">
    				</div>
  				</div>
      		</form>
    	</div>			 
	  <%
	  }
	  %>
</div>

</body>
</html>