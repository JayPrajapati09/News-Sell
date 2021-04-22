<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="user_header.jsp" %>
<%@ include file="user_navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   UserReg uie = null;
	 if (session!= null)
	 {
		 if(session.getAttribute("u")!=null)	 
			{
			   uie = (UserReg)session.getAttribute("u");
			   
	  String imgname = request.getParameter("img");
	  String id = request.getParameter("id");
%>  
<div class="card" style="width: 18rem;">
<img id="nimgs" class="card-img-top" src="news_image/<%=imgname%>">
  <div class="card-body">
  	<form action="AddNewsController" method="post" enctype="multipart/form-data">
    <h5 class="card-title">Update News Image</h5>
    <input type="hidden" name="id" value="<%=id %>">
    <input type="file" name="nimg" accept="image/*" 
			required maxlength="20">
    <button type="submit" name="action" class="btn btn-primary" value="Update Image">Update Image</button>
  	</form>
  </div>
</div>
<%  
    }
} 
%>
</body>
</html>