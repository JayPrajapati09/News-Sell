<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.AddNews"%>
<%@page import="com.bean.UserReg"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.AddNewsDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="buyer_header.jsp" %>
<%@ include file="buyer_navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<style>
.d-wish{
	width:100%;
	height:230px;
    margin-top:50px;
    margin-left:10px;
    background-color:white;
    border-radius:1%;
}
.btn{
    height:95%;
    width:100%;
    background-color:#F45C5D;
}
hr{
   border:3px solid #0879C9;
}
</style>
<meta charset="ISO-8859-1">
<title>Wishlist</title>
</head>
<body>
<%
BuyerReg bw = null;
if (session!= null)
	{
    if(session.getAttribute("b")!=null)
	{
	bw = (BuyerReg)session.getAttribute("b"); 
    List<Wishlist> list_wishlist = WishlistDao.getAllWishlist(bw.getBid());
    if(list_wishlist.size()==0)
    {
   	%><div id="d-row" style="text-align:center;"><h3>Nothing in Wishlist Find Some News</h3> </div>
   <%
    }
    else
    {
    	for(Wishlist w:list_wishlist)
    	{
    		
    		AddNews ns = AddNewsDao.getNewsByNewsId(w.getNid());	
    		UserReg u = UserDao.getUserNameById(ns.getUid());
    	
%>

		<div class="d-wish" >
		<table width=98% height=95%  cellpadding="3">
		<tr>		
			<td width=16%><b>Title</b></td>
			<td colspan="3" width=48%><%=ns.getNtitle()%></td>
			<td colspan="2"><b>Description</b>
			<%
			if(ns.getRestriction().charAt(0)=='A')
			{%>
				<input type="checkbox" checked disabled="disabled">
			<%}
			 else
			{
			%>
			<input type="checkbox" disabled="disabled">
			<%
			}
			%>
			</td>
		    <td rowspan="2">
					<form action="WishlistController" method="post" style="height:100%;">
					<input type="hidden" name="nid" value="<%=ns.getNid() %>">
					<button type="submit" class="btn" name="action" value="Remove">
					<b>Remove</b>
					</button>
		   			</form>
				</td>
		</tr>
		<tr>
			
				<td><b>Date</b></td>
				<td colspan="3"><%=ns.getDate() %></td>
				<td colspan="2"><b>Image</b>
			<%
			if(ns.getRestriction().charAt(1)=='A')
			{%>
				<input type="checkbox" checked disabled="disabled">
			<% }
			else
			{
			%>
			<input type="checkbox" disabled="disabled">
			<%
			}
			%>
			</td>	
		</tr>
		<tr>
			
				<td><b>HeadLine</b></td>
				<td colspan="3"><%=ns.getNhead() %></td>
				<td colspan="2"><b>video</b>
			<%
			if(ns.getRestriction().charAt(2)=='A')
			{%>
				<input type="checkbox" checked disabled="disabled">
			<%}
			 else
			{
			%>
			<input type="checkbox" disabled="disabled">
			<%
			}
			%>
			</td>
				<td rowspan="2">
		   <% boolean flag1 = NewsStackDao.findNews(bw.getBid(),ns.getNid());
				if(flag1==false){
				%>		
				<button  class="btn" >
				<b>In Stack</b>
				</button>		
				<%
				}
				else
			    {
				%>
					<form action="NewsStackController" method="post" style="height:100%;">
					<input type="hidden" name="nid" value="<%=ns.getNid()%>">
					<input type="hidden" name="bid" value="<%=bw.getBid()%>">
					<input type="hidden" name="uid" value="<%=ns.getUid()%>">
					<input type="hidden" name="page" value="wishlist">
					<button type="submit" class="btn" name="action" value="stack">
					<b>Add To Stack</b>
					</button>
					</form>
				<%
			    }
				%>
				</td>
		</tr>
		<tr>			
				<td><b>Venue</b></td>
				<td colspan="3"><%=ns.getVenue() %></td>
				<td colspan="2"><b>other</b>
			<%
			if(ns.getRestriction().charAt(3)=='A')
			{%>
				<input type="checkbox" checked readonly disabled="disabled">
			<%}
			 else
			{
			%>
			<input type="checkbox" readonly disabled="disabled">
			<%
			}
			%>
			</td>	
		</tr>
</table>
</div>
<br/>
<hr>
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