package com.controller;
import com.bean.*;
import com.dao.*;
import com.service.Services;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

     @WebServlet("/UserController")
     public class UserController extends HttpServlet {
    	 private static final long serialVersionUID = 1L;

      
    	 public UserController() {
    	     super();      
    	 }
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	 response.setContentType("text/html");
    	 String action = request.getParameter("action");
     // Register
    
     if(action.equalsIgnoreCase("Register"))
     {	
    	 UserReg reg  = new UserReg(); 
		 String fname = request.getParameter("fname");
		 String lname = request.getParameter("lname");
		 String add   = request.getParameter("add");
		 String email = request.getParameter("email");
		 String mob   = request.getParameter("mob");
		 String pass  = request.getParameter("pass");
       	 boolean flag = HomeDao.checkemail(email);
    	 if (flag == false)
    	 {
   
    		 request.setAttribute("e", "This Email is Already Registered");
			 request.setAttribute("fname", fname);
			 request.setAttribute("lname", lname);
			 request.setAttribute("add", add);
			 request.setAttribute("mob", mob);
    		 request.getRequestDispatcher("registration_user.jsp").include(request, response);
			 
         }
    	 else if(!request.getParameter("pass").equals(request.getParameter("cpass")))
    	 {
    		 request.setAttribute("e", "Password And Confirm Paswword Does Not Match");
    		 request.setAttribute("fname", fname);
			 request.setAttribute("lname", lname);
			 request.setAttribute("email", email);
			 request.setAttribute("add", add);
			 request.setAttribute("mob", mob);
    		 request.getRequestDispatcher("registration_user.jsp").include(request, response);
    	 }
         else 
         {
			 
    		 reg.setFirstname(fname);
    		 reg.setLastname(lname);
    		 reg.setAddress(add);
    		 reg.setEmail(email);
    		 reg.setMobileno(mob);
    		 reg.setPassword(pass);
    		
    		 int status = UserDao.save(reg);
    		 if(status > 0) {
    			request.setAttribute("msg", "Record Saved Successfully");
    			Random t = new Random();
    			request.setAttribute("type", "User");
 			    int minRange = 10000, maxRange= 99999;
 		        int s_otp = t.nextInt(maxRange - minRange) + minRange;
 		        Services.sendMail(request.getParameter("email"), s_otp);
 				request.setAttribute("msg", "Please Enter OTP Recieved In Mail");
 				request.setAttribute("value", s_otp);
 				request.setAttribute("email", request.getParameter("email"));
 				request.setAttribute("fpass", "");
 				request.getRequestDispatcher("otp_user.jsp").include(request, response);				
    		 }
    		 else {
    			request.setAttribute("msg", "Record Not Saved");
    			request.getRequestDispatcher("login_user.jsp").include(request, response);
    		 }
    	 }
     }
     //Log in
     else if(action.equals("Log in"))
     {
    		 UserReg u = UserDao.checklogin(request.getParameter("email"),request.getParameter("pass"));
    	     if(u == null) 
    	     {
    	    	 request.setAttribute("msg", "Email or Password Incorrect");
    			 request.getRequestDispatcher("login_user.jsp").include(request, response);
    	     }
    	     else 
    	     {
    	    	HttpSession session =request.getSession();
 				 session.setAttribute("u", u);
 				request.setAttribute("msg", "Successfully Logged In");
 				 request.getRequestDispatcher("user_index.jsp").forward(request, response);
    	     }
     }
     // Main OTP
     else if(action.equalsIgnoreCase("Verify Otp"))
     {
    	 int s_otp = Integer.parseInt(request.getParameter("s_otp"));
    	 int u_otp = Integer.parseInt(request.getParameter("u_otp"));
    	 String email=request.getParameter("email");
    	 String fpass = "fpass";
    	 if(s_otp == u_otp && fpass.equals(request.getParameter("fpass")))
    	 {
    		 System.out.println("In fpass");
    		request.setAttribute("email", email);
		    request.getRequestDispatcher("user_new_password.jsp").forward(request, response);
    	 }	 
    	 else if(s_otp == u_otp )
    	 {
    		 System.out.println("In Reg Otp");
    		UserDao.changestatus(email,"activate");
    		request.getRequestDispatcher("login_user.jsp").forward(request, response);
		 }
		 else
	     {
			request.setAttribute("msg", "Entered OTP Is Wrong");
			request.setAttribute("value", s_otp);
			request.setAttribute("email", request.getParameter("email"));
			request.getRequestDispatcher("otp_user.jsp").include(request, response);
		 }	 
    	 
     }
     // Login-->Change password
     else if(action.equalsIgnoreCase("Change Password"))
     {	
    	 String email =request.getParameter("email");
    	 String o_pass = request.getParameter("o_pass");
    	 UserReg user = UserDao.checklogin(email, o_pass);
    	 if(user==null)
    	 {
    		request.setAttribute("msg", "Enter Correct Old password");
    		request.getRequestDispatcher("user_change_password.jsp").include(request, response);
    	 }
    	 else
    	 {
    	 	if(request.getParameter("n_pass").equals(request.getParameter("c_pass"))) 
    	 	{
    	 		UserDao.changePassword(email, request.getParameter("n_pass"));
    	 		request.setAttribute("msg", "Password Successfully Changed");
    	 		request.getRequestDispatcher("user_index.jsp").forward(request, response);
    	    }
    	 	else
    	 	{
    	 		request.setAttribute("msg", "Password and Confirm Password Does Not Match");
    	 		request.getRequestDispatcher("user_change_password.jsp").include(request, response);
    	 		
    	 	}
    	 }
     }
     // Email Verify
     else if(action.equalsIgnoreCase("Verify Email"))
     {
    	 boolean flag = UserDao.checkemail(request.getParameter("email"));
    	 if(flag == false)
    	 {
    	  Random t = new Random();
		  int minRange = 10000, maxRange= 99999;
		  request.setAttribute("type", "User");
	      int s_otp = t.nextInt(maxRange - minRange) + minRange;
	      Services.sendMail(request.getParameter("email"), s_otp);
		  request.setAttribute("msg", "Please Enter OTP Recieved In Mail");
		  request.setAttribute("type", "buyer");
	      request.setAttribute("value", s_otp);
	      request.setAttribute("email", request.getParameter("email"));
	      request.setAttribute("fpass", "fpass");
	      request.getRequestDispatcher("otp_user.jsp").include(request, response);
    	 }
    	 else
    	 {
    	  request.setAttribute("msg", "Enter Correct Email ID");
    	  request.getRequestDispatcher("user_forgot_password.jsp").include(request, response);
    	 }
     }
     // Forget Password
     else if(action.equalsIgnoreCase("Update Password")) 
     {
    	 if(request.getParameter("pass").equals(request.getParameter("c_pass")))
    	 {
    		UserDao.changePassword(request.getParameter("email"),request.getParameter("pass"));
    		request.getRequestDispatcher("login_user.jsp").include(request, response);
    	 }
    	 else 
    	 {
    	   request.setAttribute("msg", "Password And Confirm Password Doesnot Match");
       	   request.getRequestDispatcher("user_new_password.jsp").include(request, response);
    	 }
     }
     else if(action.equalsIgnoreCase("Update Profile")) 
     {
    	 HttpSession s = request.getSession();
    	 UserReg u = (UserReg)s.getAttribute("u");
    	 u.setUid(u.getUid());
    	 u.setFirstname(request.getParameter("fname"));
    	 u.setLastname(request.getParameter("lname"));
    	 u.setAddress(request.getParameter("add"));
    	 u.setMobileno(request.getParameter("mob"));
    	
    	 UserDao.update(u);
    	 request.getRequestDispatcher("user_profile.jsp").include(request, response);
    	 System.out.println(u.getUid());
     }
  }
}
