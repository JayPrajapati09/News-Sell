<%@page import="com.dao.BuyerDao"%>
<%@page import="com.bean.BuyerReg"%>
<%@page import="com.bean.AddNews"%>
<%@page import="com.dao.AddNewsDao" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="user_header.jsp" %>
<%@ include file="user_navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Update News</title>
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
	width: 1000px;
	position: absolute;
	top:0;
	bottom: 0;
	left: 0;
	right: 0;
  	margin:200px;
  	margin-right:100px;
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
   UserReg une = null;
	 if (session!= null)
	 {
		 if(session.getAttribute("u")!=null)	 
			{
			   une = (UserReg)session.getAttribute("u");
%>   
<div class="d-center">
	<div class="modal-header">
	   <h5 class="modal-title"><b>Edit News</b></h5>
	</div>
<form action="AddNewsController" method="post" enctype="multipart/form-data">
<%
   UserReg reg = (UserReg)session.getAttribute("u");
	int id = Integer.parseInt(request.getParameter("id"));
   AddNews ns = AddNewsDao.getNewsByNewsId(id);
%>
<input type="hidden" name="nid" value="<%=ns.getNid() %>">
  <div style="width:50%;float:left;">
	<div class="modal-body">    
	<div class="form-group">
			<label class="col-form-label">Venue</label>
			<input type="text" class="form-control" name="venue" 
			maxlength = "30" value="<%=ns.getVenue()%>">
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
			<textarea  class="form-control" rows=10 cols=72 name="ndesc" maxlength="2500">
				<%=ns.getNdesc() %>
			</textarea>
	</div>
	<div class="form-group">
			<label class="col-form-label">Expected Amount </label>
			<input type="number" class="form-control" name="nprice" 
			min="1" value="<%=ns.getAmount()%>">
	</div>
  </div>
</div>
<div style="width:40%;float:right;">
  <div class="modal-body">
	<div class="form-group">
			<label class="col-form-label">News Heading</label>
			<input type="text" class="form-control" name="nhead" 
			maxlength = "50" value="<%=ns.getNhead()%>" maxlength="50">
	</div>

	<div class="form-group">
			<label class="col-form-label">News Video link</label>
			<input type="text" class="form-control"  name="nvideo" 
			value="<%=ns.getNvideo()%>" maxlength="50">
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

	<!--<a href="preview.jsp"><input type="button" style="width:200px;margin-top:20px;" value="Preview"></a> -->
	<div class="right-w3l">
	<button class="b-bottom" name="action" value="Update News" type="submit" 
	style="margin-left:50px;">
	Update News
	</button>
	<input type="reset" class="b-bottom" value="Reset All">
    </div>
</form>
</div>

<%
    }
}
%>
</body>
</html>