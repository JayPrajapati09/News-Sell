<%
		
  String pages = request.getParameter("page");
if(pages.equals("user"))
{ 
	session.removeAttribute("u");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	session.invalidate();
	response.sendRedirect("index.jsp");
}
else if(pages.equals("buyer")) 
{ 
	session.removeAttribute("b");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	session.invalidate();
	response.sendRedirect("index.jsp");
}
 else if(pages.equals("admin")) 
{ 
	session.removeAttribute("a");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	session.invalidate();
	response.sendRedirect("index.jsp");
}
 else{
%>
<h1>Logout Successfull <a href="index.html">Go To HomePage</a></h1>
 <%
 }
%>