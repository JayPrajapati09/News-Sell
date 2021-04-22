<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.AddNews"%>
<%@page import="com.bean.UserReg"%>
<%@page import="com.dao.AddNewsDao"%>
<%@page import="com.dao.UserDao"%>

<%@ include file="buyer_header.jsp" %>
<%@ include file="buyer_navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>

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
<meta charset="ISO-8859-1">
<title>News</title>
<style>
.h_div{
	width:45%;
	height:50px;
	border-left-style: groove;
	border-right-style: groove;
		border-width:10px;
		border-color:cyan;
		margin-top:10px;
		border-radius:15%;
	padding-left:10px;
	text-align:center;
}

</style>
</head>
<body>
<%
BuyerReg br1 = null;
if (session!= null)
	{
    if(session.getAttribute("b")!=null)
	{
	br1 = (BuyerReg)session.getAttribute("b");  
    String action = request.getParameter("Contact");    
	int nid = Integer.parseInt(request.getParameter("nid"));
	AddNews ns = (AddNews)request.getAttribute("ns");
	UserReg u = UserDao.getUserNameByIdForBuyer(ns.getUid());
	%>

	<div style="width:100%;height:75px;text-align:center;">
	<h3><%=ns.getNtitle() %></h3>
	</div>
	<div class="h_div" style="float:left;">
	<%=u.getFirstname() %><%=u.getLastname() %>
	</div>
	<div class="h_div"style="float:right;">
	Rating
	</div>
	<div class="h_div"style="float:left;">
	<%=u.getMobileno()%>
	</div>
	<div class="h_div"style="float:right;">
	<%=u.getEmail() %>
	</div>
	<div class="h_div"style="float:left;">
	<%=ns.getNtype() %>
	</div>
	<div class="h_div"style="float:right;">
	<%=ns.getNhead() %>
	</div>
	<div class="h_div"style="float:left;height:200px;">
	<%
              int len =  ns.getNdesc().length();
              for(int i=0;i<len/2;i++)
              {
            	  out.print(ns.getNdesc().charAt(i));
              }
					%>...
	</div>
	<div class="h_div"style="float:right;height:200px;">
	<img style="width:50%;" src="news_image/<%=ns.getNimg()%>" alt="News Image">
	</div>
	<div class="h_div"style="float:left;">
	<a href="<%=ns.getNvideo()%>"><%=ns.getNvideo()%></a>
	</div>
	<div class="h_div"style="float:right;">
		Date:<%=ns.getDate() %><br>
		Time:<%=ns.getTime() %>
	</div>
	
<div class="h_div"style="float:left;height:400px;margin-left: 360px;">
	<h2 style="margin-top: 50px;">News Review</h2>
		<form action="NewsStackController" method="post">
		<input type="hidden" name="nid" value="<%=ns.getNid() %>">
		<input type="hidden" name="bid" value="<%=br1.getBid() %>">
        <div class="small-ratings " style="margin-top: 50px;"> 
			<label for="customRange2" class="form-label">News Relevant To Topic</label>
			<input type="range"  name="nr" class="form-range" min="0" max="5" id="customRange2">
        </div>
        <div class="small-ratings " style="margin-top: 20px;">
			<label for="customRange2" class="form-label">Content Quality</label>
			<input type="range" name="cq" class="form-range" min="0" max="5" id="customRange2">
        </div> 
        <div class="small-ratings " style="margin-top: 20px;"> 
			<label for="customRange2" class="form-label">Media Quality</label>
			<input type="range" name="mq" class="form-range" min="0" max="5" id="customRange2">
        </div>
	<input type="submit" name="action" class="btn btn-primary" value="Submit" style="margin-top: 20px;">
	</form>
</div>



<%
   }
}
%>

</body>
</html>
