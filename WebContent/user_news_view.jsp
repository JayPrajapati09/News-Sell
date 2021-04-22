<%@page import="java.util.List"%>
<%@page import="com.bean.AddNews"%>
<%@page import="com.bean.UserReg"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.AddNewsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="user_header.jsp" %>
<%@ include file="user_navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All News</title>
</head>
<style>
#d-row{
	width:100%;
	height:250px;
	display: flex;
	background-color:white;
	border-color: #336699;
	border-radius:15%;
    border-style: solid;
    border-width: 10px;
}

.d-block{
   overflow:hidden;
   height:250px;
}
.iconbtn{
  border-width:0px !important;
}
#nimgs{
  width: 250px;
}
</style>
<body>
<%
  UserReg reg = null;
	if (session!= null)
	{
		if(session.getAttribute("u")!=null)
		{
			reg = (UserReg)session.getAttribute("u");    
	    List<AddNews> li = new ArrayList<AddNews>();
        li = AddNewsDao.viewnews(reg.getUid());
        for(AddNews ns :li)
        {
%>

<div id="d-row" style="text-align:center;">
		<div class="d-block" style="float:left;width:6%;">
			<div style="height:70px;">
				<form action="user_news_edit.jsp" method="post">
				<input type="hidden" name="id" value="<%=ns.getNid() %>">
			   	<button type="submit" class="iconbtn" name="action" value="EDIT" 
			   		style="margin-top:50px;">
			   	<i class="fas fa-edit"></i>
			   	</button>
			    </form>
			</div>
			<div style="height:70px;">
				<form action="user_news_img_edit.jsp" method="post">
				<input type="hidden" name="img" value="<%=ns.getNimg() %>">
				<input type="hidden" name="id" value="<%=ns.getNid() %>">
				<button type="submit" class=" iconbtn" 
				data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-top:50px;">
			   	<i class="far fa-image" aria-hidden="true"></i>
			   	</button>
			    </form>
			</div>
			<div style="height:70px;">
				<form action="AddNewsController" method="post">
				<input type="hidden" name="nid" value="<%=ns.getNid() %>">
				<button type="submit" class="iconbtn" name="action" value="DELETE" 
					style="margin-top:50px;">
			   	<i class="fa fa-trash" aria-hidden="true"></i>
			   	
			   	</button>
			    </form>
			</div>
		</div>
		<div class="d-block" style="float: left;width:28%;">
			<h5 align="center">News Type </h5>
			<%=ns.getNtype() %>
			<hr >
			<h5 align="center">News Title  </h5>
				<%=ns.getNtitle() %>
			<hr>
			<h5 align="center">Video Link  </h5>
			<%=ns.getNvideo() %>
			<hr>
		</div>
		<div class="d-block" style="display: inline;width:33%;">
			<h5 align="center">News Description   </h5>
			<hr>
			<%=ns.getNdesc() %>
		</div>
		<div class="d-block" style="display: inline;width:33%;">
    		<h5 align="center">News Image </h5>
    		<hr>
    		<img id="nimgs" src="news_image/<%=ns.getNimg()%>" alt="News Image"  
    		   style="overflow:hidden;">
        </div>
</div>
<%
  }
   %>

		<!-- footer third section -->
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
								<a href="user_uploadnews.jsp">Upload News</a>
							</li>
							<li class="mb-3">
								<a href="user_news_view.jsp">View News</a>
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