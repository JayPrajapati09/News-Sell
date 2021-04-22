<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.AddNews"%>
<%@page import="com.bean.UserReg"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="com.dao.NewsStackDao"%>
<%@page import="com.dao.AddNewsDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@ include file="buyer_header.jsp" %>
<%@ include file="buyer_navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>View News</title>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<style>
#d-row{
	width:100%;
	height:270px;
	display: flex;	
	
}
.d-block{
   overflow:auto;
   height:260px;
   background-color:#e6e6ff;
}
.button{
	width:100%;
	border:0px;
	height:100px;
	background-color:#e6e6ff;
}
</style>

</head>
<body>
<%
BuyerReg b11 = null;
if (session!= null)
{
    if(session.getAttribute("b")!=null)
	{
	b11 = (BuyerReg)session.getAttribute("b"); 	
	List<AddNews> li = new ArrayList<AddNews>();
	li = AddNewsDao.getAllNews();	
	 if(li.size()==0)
	 {
		%><div id="d-row" style="text-align:center;"><h3>No News Right Now, Check later</h3> </div>
	<%
	 }
 else
 {
   boolean newsflag = false;
   for(AddNews ns :li)
   {
			
%>
<div id="d-row" style="text-align:center;margin-top:30px;">
<div class="d-block" style="float:left;width:10%;display:block;background-color:#e6e6ff;">		
		<% boolean flag = WishlistDao.findNews(b11.getBid(), ns.getNid());
		System.out.println(flag);
		if (flag==false)
		{ %>	
		    <button class="button">
			<i class="fa fa-heart" style="font-size:20px;color:grey;"></i>
		    </button >
	  <%}
		else
		{	
		%>      
				<form action="WishlistController" method="post">
				<input type="hidden" name="bid" value="<%=b11.getBid()%>">
			    <input type="hidden" name="nid" value="<%=ns.getNid()%>">	
			    <button type="submit" class="button" name="action" value="wishlist">
				<i class="fa fa-heart" style="font-size:20px;color:orange;"></i>
			    </button >
			    </form>
		<%
		}
		boolean flag1 = NewsStackDao.findNews(b11.getBid(), ns.getNid());
		if(flag1==false)
		{
		%>		
			    <button class="button">
				<i class="fas fa-box" style="font-size:20px;color:grey;"></i>
				</button>		
		<%
		}
		else
		{
		%>
		        <form action="NewsStackController" method="post">
		        <input type="hidden" name="bid" value="<%=b11.getBid()%>">
		        <input type="hidden" name="nid" value="<%=ns.getNid()%>">
		        <input type="hidden" name="uid" value="<%=ns.getUid()%>">
		        <input type="hidden" name="page" value="view news">
			    <button type="submit" class="button" name="action" value="stack">
				<i class="fas fa-box" style="font-size:20px;color:orange;"></i>
				</button>
				</form>
		<%
		}
		%>
		</div>
		<div class="d-block" style="float: left;width:30%;">
		    <h6 align="center">Title  </h6>
			<%=ns.getNtitle() %>
			<hr>
			<h6 align="center">Type </h6>
			<%=ns.getNtype() %>
			<hr>
		    <h6 align="center">Date</h6>  
			<%=ns.getDate() %>	
			<hr>
		</div>
		<div class="d-block" style="float: right;width:30%;">
			<h6 align="center">Heading  </h6>
			<%=ns.getNhead() %>
			<hr>
		    <h6 align="center">Time</h6>
			<%=ns.getTime() %>
			<hr>
			<h6 align="center">Location  </h6>
			<%=ns.getVenue() %>
			<hr>
			
		</div>
		<div class="d-block" style="float: right;width:30%;overflow:hidden;">
			<h6 align="center"> Descriptive </h6>
			<%
			if(ns.getRestriction().charAt(0)=='A')
			{
			%>
			<input type="checkbox" checked disabled="disabled">	
		    <% 
			}
			else
			{
			%>
			<input type="checkbox"disabled="disabled">
			<%
			}
			%>
			<hr>
			<h6 align="center">Images  </h6>
			<%
			if(ns.getRestriction().charAt(1)=='A')
			{
			%>
			<input type="checkbox" checked disabled="disabled">	
		    <% 
			}
			else
			{
			%>
			<input type="checkbox"disabled="disabled">
			<%
			}
			%>
			<hr>
			<h6 align="center">Video  </h6>
			<%
			if(ns.getRestriction().charAt(2)=='A')
			{
			%>
			<input type="checkbox" checked disabled="disabled">	
		    <% 
			}
			else
			{
			%>
			<input type="checkbox"disabled="disabled" >
			<%
			}
			%>
			<hr>
		</div>
	
</div>
<%     
   }
 }	
%>
<div class="w3l-middlefooter-sec">
			<div class="container py-md-5 py-sm-4 py-3">
				<div class="row footer-info w3-agileits-info">
					<!-- footer categories -->
					<!-- //footer categories -->
					<!-- quick links -->
					<div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
						<ul>
							<li class="mb-3">
								<a href="buyer_wishlist.jsp">WishList</a>
							</li>
							<li class="mb-3">
								<a href="buyer_stack.jsp">Stack</a>
							</li>
							
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
						<ul>
							<li class="mb-3">
								<i class="fas fa-map-marker"></i>Sal College</li>
							
							<li class="mb-3">
								<i class="fas fa-phone"></i> +814 030 9546</li>
							<li class="mb-3">
								<i class="fas fa-envelope-open"></i>
								 NewsSell78@gmail.com
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids w3l-agileits mt-md-0 mt-4">
			
						
					</div>
				</div>
			</div>
		</div>
	<!-- copyright -->
	<div class="copy-right py-3">
		<div class="container">
			<p class="text-center text-white">News Sell || The Online News Selling Platform	</p>
		</div>
	</div>
<%
    }
} 
%>
</body>
</html>