<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.AddNews"%>
<%@page import="com.bean.UserReg"%>
<%@page import="com.bean.NewsStack"%>
<%@page import="com.dao.AddNewsDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.NewsStackDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="buyer_header.jsp" %>
<%@ include file="buyer_navigation.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<style>

.btn{ 
    width:100%;
    background-color:#0879C9;
    font-weight: bold;
}
</style>
<meta charset="ISO-8859-1">
<title>Stack</title>
</head>
<body>

<%
BuyerReg br = null;
if (session!= null)
	{
    if(session.getAttribute("b")!=null)
	{
	br = (BuyerReg)session.getAttribute("b"); 

    %>


<div style="width:100%;display:block; ">
<%
    List<NewsStack> list_NewsStack = NewsStackDao.getAllNewsStack(br.getBid());
    if(list_NewsStack.size()==0)
    {
   	%><div  style="text-align:center;width:100%;"><h3>
   	   <a href="buyer_view_news.jsp">Find Some News</a></h3> </div>
   <%
    }
    else
    {
    	for(NewsStack w:list_NewsStack)
    	{
    		
    		AddNews ns = AddNewsDao.getNewsByNewsId(w.getNid());	
    		UserReg u = UserDao.getUserNameById(ns.getUid());
    	
%>
<div class="container-fluid">
<div class="card text-white bg-primary mb-3" style="width: 100%;">
<h3 class="card-title"><%=ns.getNtitle() %></h3>
  <div class="card-body" >
    <div class="card-header"><%=ns.getNhead() %></div>
    
	    <div class="card-text">
	   		<h3 class="card-title">Description </h3><br>
	   		    <textarea  style="width: 40%;height:100px;
	   		    	background-color:#007bff;border:none;color:white">
	    		<%
              	int len =  ns.getNdesc().length();
              		for(int i=0;i<len/2;i++)
              		{
            	  		out.print(ns.getNdesc().charAt(i));
              		}
				%>.....
				</textarea>
	    	
	    </div>
	    
    	<div class="card-text">
    	<h3 class="card-title">Type </h3><br>
    	     <%=ns.getNtype() %>
    	</div>
    	<div class="card-text">
    	<h3 class="card-title">Date </h3><br>
    	     <%=ns.getDate() %>
    	</div>
    	<div class="card-text">
    	<h3 class="card-title">Time </h3><br>
    	     <%=ns.getTime() %>
    	</div>
    	<div class="card-text">
    	<h3 class="card-title">Proof </h3><br>
    	      <% if(ns.getRestriction().charAt(1)=='A')
              { %>
 			  <input type="checkbox"  value="A"  checked disabled="disabled">Image
 			  <%
              }
              else
              {
 			  %>
 			  <input type="checkbox" disabled="disabled">Image
 			  <%
              }
 			  %>
 			  <% if(ns.getRestriction().charAt(2)=='A')
              { %>
 			  <input type="checkbox"  value="A" checked disabled="disabled">Video
 			  <%
              }
              else
              {
 			  %>
 			  <h3>Video</h3><input type="checkbox" disabled="disabled">
 			  <%
              }
 			  %>
 			  <% if(ns.getRestriction().charAt(0)=='A')
              { %>
 			  <input type="checkbox"  value="A"  checked disabled="disabled">Description
 			  <%
              }
              else
              {
 			  %>
 			  <input type="checkbox" disabled="disabled">Other
 			  <%
              }
 			  %>
    	</div>
    	<div class="card-text">
    		<form action="NewsStackController" method="post">
	            <input type="hidden" name="nid" value="<%=ns.getNid() %>">
	            <input type="hidden" name="bid" value="<%=br.getBid() %>">
	            <input type="hidden" name="uid" value="<%=ns.getUid() %>">
	    		<button type="submit" name="action" value="Contact" class="btn btn-dark" 
	    			style="width:200px;background-color: black;">
	    			Contact
	    		</button>
	    	</form>
	    	<form action="NewsStackController" method="post">
	            <input type="hidden" name="nid" value="<%=ns.getNid() %>">
	    		<button type="submit" name="action" value="Delete" class="btn btn-dark" 
	    			style="width:200px;background-color: black;">
	    			Delete
	    		</button>
	    	</form>
    	</div>
  </div>
</div>
</div>

<hr style="border:5px solid  #0879C9">
<%
    	}
    }
%>
</div>
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