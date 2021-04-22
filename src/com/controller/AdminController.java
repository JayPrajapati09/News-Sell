package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bean.AddNews;
import com.bean.Admin;
import com.bean.BuyerReg;
import com.bean.UserReg;
import com.dao.AddNewsDao;
import com.dao.AdminDao;
import com.dao.BuyerDao;
import com.dao.UserDao;
import com.service.Services;


@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action  = request.getParameter("action");
		System.out.println(action);
		
			if(action.equals("Register")) {
					String name  = request.getParameter("name");
					String email = request.getParameter("email");
					String pass  = request.getParameter("pass");
					String cpass  = request.getParameter("cpass");
					boolean flag = AdminDao.checkemail(email);
					if(flag==false) {
	
		   		     request.setAttribute("snap", "Email is Already Registered");
					 request.getRequestDispatcher("registration_admin.jsp").include(request, response);
				     }
			        else if(pass.equals(cpass)) {
			    	
			    	 request.setAttribute("snap", "Password And Confirm Password Does Not Match");
					 request.getRequestDispatcher("registration_admin.jsp").include(request, response);
			         }
			         else {
						Random t = new Random();
			   		    int minRange = 10000, maxRange= 99999;
			   		    int s_otp = t.nextInt(maxRange - minRange) + minRange;
			   		    Services.sendMail(request.getParameter("email"), s_otp);
			   		    request.setAttribute("msg", "Please Enter OTP Recieved In Mail");
			   		    request.setAttribute("value", s_otp);
			   		    request.setAttribute("email", request.getParameter("email"));
			   		    request.getRequestDispatcher("otp_admin.jsp").forward(request, response);
						Admin a = new Admin();
						a.setName(name);
						a.setPass(pass);
						a.setEmail(email);
						AdminDao.save(a);
				  }
		    }
		    else if(action.equalsIgnoreCase("Verify Otp"))
	        {
	    	 	int s_otp = Integer.parseInt(request.getParameter("s_otp"));
	    	 	int u_otp = Integer.parseInt(request.getParameter("u_otp"));
	    	 	
	    	 	String email=request.getParameter("email");	 
	   	 	 	if(s_otp == u_otp )
	   	 	 	{
	   	 	 		 AdminDao.changestatus(email);
	   	 	 		 
		 	 		 request.getRequestDispatcher("login_admin.jsp").forward(request, response);
	   	 	 	}
	   	 	 	else
	   	 	 	{
	   	 	 		 request.setAttribute("msg", "Entered OTP Is Wrong");
	   	 	 		 request.setAttribute("value", s_otp);
	   	 	 		 request.setAttribute("email", request.getParameter("email"));
	   	 	 		 request.getRequestDispatcher("otp_admin.jsp").forward(request, response);
	   	 	 	}	 
	        }
		    else if(action.equals("Log in"))
		    {
		   		 Admin a = AdminDao.checklogin(request.getParameter("email"),request.getParameter("pass"));
		   	     if(a  == null) 
		   	     {
		   	    	 request.setAttribute("msg", "Email or Password Incorrect");
		   			 request.getRequestDispatcher("login_admin.jsp").forward(request, response);
		   	     }
		   	     else 
		   	     {
		   	    	 	 HttpSession session1=request.getSession();
						 session1.setAttribute("a", a);
						 request.setAttribute("u", null);
						 request.setAttribute("b", null);
						 session1.setMaxInactiveInterval(15*60);
						 request.getRequestDispatcher("admin.jsp").forward(request, response);
		   	     }
		    }
		    else if(action.equals("user"))
		    {
			        String email = request.getParameter("email");
			        UserReg u = UserDao.userDetail(email);
			        request.setAttribute("u", u);
			        request.getRequestDispatcher("admin.jsp").forward(request, response);
		    }
		    else if(action.equalsIgnoreCase("Update User")) 
		    { 
			     UserReg u = new UserReg();
		    	 u.setUid(Integer.parseInt(request.getParameter("uid")));
		    	 u.setFirstname(request.getParameter("fname"));
		    	 u.setLastname(request.getParameter("lname"));
		    	 u.setAddress(request.getParameter("add"));
		    	 u.setEmail(request.getParameter("email"));
		    	 u.setMobileno(request.getParameter("mob"));
		    	
		    	 UserDao.update(u);
		    	 request.setAttribute("u", null);
		    	 request.setAttribute("msg", "User Successfully Updated");
		    	 request.getRequestDispatcher("admin.jsp").forward(request, response);
		    	
		    }
		    else if(action.equalsIgnoreCase("Delete User"))
		    {
		    	AdminDao.deleteUser(Integer.parseInt(request.getParameter("uid")));
		    	request.setAttribute("u", null);
		    	request.setAttribute("msg", "User Successfully Deleted");
		    	request.getRequestDispatcher("admin.jsp").forward(request, response);

		    }
		    else if(action.equals("buyer"))
		    {
			        String email = request.getParameter("email");
			        BuyerReg b = BuyerDao.buyerDetail(email);
			        request.setAttribute("b", b);
			        request.getRequestDispatcher("admin.jsp").forward(request, response);
		    }
		    else if(action.equalsIgnoreCase("Update Buyer")) 
		    { 
			   	  BuyerReg reg = new BuyerReg(); 
			      reg.setBid(Integer.parseInt(request.getParameter("bid")));
			   	  reg.setMname(request.getParameter("mname"));
				  reg.setDes(request.getParameter("des"));
				  reg.setLogo(request.getParameter("logo"));
				  reg.setScope(request.getParameter("scope"));
				  reg.setAdd(request.getParameter("add"));
				  reg.setEmail(request.getParameter("email"));
				  reg.setCno(request.getParameter("cno"));
				  reg.setLno(request.getParameter("lno"));
				  reg.setPass(request.getParameter("pass"));
				  System.out.println(request.getParameter("lno"));
			   	  BuyerDao.update(reg);
			   	 request.setAttribute("b", null);
		    	 request.setAttribute("msg", "Buyer Successfully Updated");
		    	 request.getRequestDispatcher("admin.jsp").forward(request, response);
		    	
		    }
		    else if(action.equalsIgnoreCase("Delete Buyer"))
		    {
		    	AdminDao.deleteBuyer(Integer.parseInt(request.getParameter("bid")));
		    	request.setAttribute("b", null);
		    	request.setAttribute("msg", "Buyer Successfully Deleted");
		    	request.getRequestDispatcher("admin.jsp").forward(request, response);

		    }
		    else if(action.equals("news"))
		    {
			        int nid = Integer.parseInt(request.getParameter("nid"));
			        AddNews ns = AddNewsDao.getNewsByNewsId(nid);
			        request.setAttribute("ns", ns);
			        request.getRequestDispatcher("admin.jsp").forward(request, response);
		    }
		    else if(action.equalsIgnoreCase("Update News")) 
		    { 
		    	
		        long millis=System.currentTimeMillis();  
	 	        Date date=new Date(millis);
	 	        
	 	        long now = System.currentTimeMillis();
	 	        Time time = new Time(now);
	 	        
	 	        AddNews news = new AddNews();
	 	        news.setNid(Integer.parseInt((request.getParameter("nid"))));
	 	        news.setVisibility(request.getParameter("visibility"));
	 	        news.setNtype(request.getParameter("ntype"));
	 	        news.setNtitle(request.getParameter("ntitle"));
	 	        news.setNdesc(request.getParameter("ndesc"));
	 	        news.setNimg(request.getParameter("nimg"));
	 	        news.setNvideo(request.getParameter("nvideo"));
	 	        news.setVenue(request.getParameter("venue"));
	 	        news.setAmount(Integer.parseInt(request.getParameter("nprice")));
	 	        news.setDate(date.toString());
		        news.setTime(time.toString());
		        String desc= request.getParameter("d_visibility");
		        String img= request.getParameter("i_visibility");
		        String vid= request.getParameter("v_visibility");
		        String accs= request.getParameter("a_visibility");
		        news.setRestriction(desc+img+vid+accs);
	 	        AddNewsDao.updateNews(news);
		    	request.setAttribute("ns", null);
		    	request.setAttribute("msg", "News Successfully Updated");
		    	request.getRequestDispatcher("admin.jsp").forward(request, response);
		    	
		    }
		    else if(action.equalsIgnoreCase("Delete News"))
		    {
		    	AdminDao.deleteNews(Integer.parseInt(request.getParameter("nid")));
		    	request.setAttribute("ns", null);
		    	request.setAttribute("msg", "News Successfully Deleted");
		    	request.getRequestDispatcher("admin.jsp").forward(request, response);

		    }
				
	}

}
