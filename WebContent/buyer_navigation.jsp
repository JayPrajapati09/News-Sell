<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.BuyerDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.bean.BuyerReg"%>
<%@page import="com.bean.NewsStack"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.dao.NewsStackDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
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
</style>
</head>
<body>
<%
BuyerReg bn = null;
if (session!= null)
	{
    if(session.getAttribute("b")!=null)
	{
	bn = (BuyerReg)session.getAttribute("b"); 
          
    String wish = String.valueOf(WishlistDao.getAllWishlistCount(bn.getBid()));
    String stack = String.valueOf(NewsStackDao.getAllNewsStackCount(bn.getBid()));
    %>   
<div style="width:100%;display:inline-block;height:150px;">
				<div style="width:50%;display:inline-block;float:left;height:100px;">
					<h1 class="text-center">
						<a href="index.jsp" class="font-weight-bold font-italic" style="float:left;">
							<img src="images/logo2.png" alt=" " class="img-fluid" >News Sell
						</a>
					</h1>
				</div>
		<div  style="width:50%;display:inline-block;float:right;height:100px;">
		<a href="buyer_stack.jsp">
			<button type="button" class="c-w" style="margin:10px 10px 0px 0px;">
 				 <i class="fas fa-box" style="width:;font-size:20px;color:white;"></i>
				<span class="badge bg-primary" style="color:white;"><%=stack %></span>
			</button>
		</a>

			<a href="buyer_wishlist.jsp">	
			<button class="c-w" style="margin:10px 10px 0px 0px;">
				<i class="fa fa-heart" style="width:;font-size:20px;color:white;"></i>
				<span class="badge bg-primary" style="color:white;"><%=wish %></span>	
			</button>
			</a>
			<a href="buyer_profile.jsp">
			<!-- 	<i class="fa fa-user" style="font-size:20px;color:white;"></i> -->
				<img src="media_logo/<%=bn.getLogo()%>" class="c-w" style="margin:10px 10px 0px 0px;">
			
			</a>
		</div>
		<div style="width:100%;display:inline-block;float:right;height:50px;">
			<div style="width:7%;display:inline-block;float:right;height:50px;text-align:center;">
				<h6><a href="buyer_view_news.jsp">View News
							</a></h6>
			</div>
			<div style="width:7%;display:inline-block;float:right;height:50px;text-align:center;">
				<h6><a href="buyer_index.jsp">Home
							</a></h6>
			</div>
		</div>
</div>
<hr>
<%
   }
}
%>
</body>
</html>