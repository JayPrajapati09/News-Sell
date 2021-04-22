package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.bean.BuyerReg;
import com.dao.BuyerDao;
import com.service.Services;

@WebServlet("/BuyerController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512)
public class BuyerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private String extractfilename(Part file) {
	    String cd = file.getHeader("content-disposition");
	    System.out.println(cd);
	    String[] items = cd.split(";");
	    for (String string : items) {
	        if (string.trim().startsWith("filename")) {
	            return string.substring(string.indexOf("=") + 2, string.length()-1);
	        }
	    }
	    return "";
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	 response.setContentType("text/html");
   	 String action = request.getParameter("action");
   	 
   	 // Register
     if(action.equalsIgnoreCase("Register"))
     {	
      	 boolean flag = BuyerDao.checkemail(request.getParameter("email"));
   	     if (flag == false)
   	     {
   		  
   		     request.setAttribute("snap", "Email is Already Registered");
			 request.getRequestDispatcher("registration_buyer.jsp").include(request, response);
         }
   	     else if(!request.getParameter("pass").equals(request.getParameter("cpass")))
   	     {
   		     request.setAttribute("snap", "Password And Confirm Password Does Not Match");
			 request.getRequestDispatcher("registration_buyer.jsp").include(request, response);
   	     }
         else 
         {
        	String savePath = "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\media_logo";   
 			File fileSaveDir=new File(savePath);
 	        if(!fileSaveDir.exists()){
 	            fileSaveDir.mkdir();
 	        }
 	        Part file1 = request.getPart("logo");
 		 	String fileName=extractfilename(file1);
 		    file1.write(savePath + File.separator + fileName);
 		    String filePath= savePath + File.separator + fileName ;
 		    
 		    String savePath2 = "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\media_logo";
 	        File imgSaveDir=new File(savePath2);
 	        if(!imgSaveDir.exists()){
 	            imgSaveDir.mkdir();
 	        }
			 BuyerReg reg = new BuyerReg(); 
   		     reg.setMname(request.getParameter("mname"));
   		     reg.setDes(request.getParameter("des"));
   		     reg.setLogo(fileName);
   		     reg.setScope(request.getParameter("scope"));
   		     reg.setAdd(request.getParameter("add"));
   		     reg.setEmail(request.getParameter("email"));
   		     reg.setCno(request.getParameter("cno"));
   		     reg.setLno(request.getParameter("lno"));
   		     reg.setPass(request.getParameter("pass"));
   		
   		 int status = BuyerDao.save(reg);
   		 if(status > 0)
   		 {
   			Random t = new Random();
   		    int minRange = 10000, maxRange= 99999;
   		    int s_otp = t.nextInt(maxRange - minRange) + minRange;
   		    Services.sendMail(request.getParameter("email"), s_otp);
   		    request.setAttribute("msg", "Please Enter OTP Recieved In Mail");
   		    request.setAttribute("value", s_otp);
   		    request.setAttribute("email", request.getParameter("email"));
   		    request.setAttribute("fpass", "");
   		    request.getRequestDispatcher("otp_buyer.jsp").include(request, response);			
   		 }
   		 else 
   		 {
   			request.setAttribute("msg", "Record Not Saved");
   			request.getRequestDispatcher("registration_buyer.jsp").include(request, response);
   		 }
       }
    }
    
     //Log in
    else if(action.equals("Log in"))
    {
   		 BuyerReg reg = BuyerDao.checklogin(request.getParameter("email"),request.getParameter("pass"));
   	     if(reg == null) 
   	     {
   	    	 request.setAttribute("msg", "Email or Password Incorrect");
   			 request.getRequestDispatcher("login_buyer.jsp").include(request, response);
   	     }
   	     else 
   	     {
   	    	 	 HttpSession buyer_session=request.getSession();
				 buyer_session.setAttribute("b", reg);
				 buyer_session.setMaxInactiveInterval(15*60);
				 request.getRequestDispatcher("buyer_index.jsp").include(request, response);
   	     }
     }
    // Main OTP
     else if(action.equalsIgnoreCase("Verify Otp"))
     {
    	 	int s_otp = Integer.parseInt(request.getParameter("s_otp"));
    	 	int u_otp = Integer.parseInt(request.getParameter("u_otp"));
    	 	String email=request.getParameter("email");
    	 	String fpass = request.getParameter("fpass");
    	 	if(s_otp == u_otp && fpass.equals("fpass"))
    	 	{
   		 	 	 request.setAttribute("email", email);
   		 	 	 request.getRequestDispatcher("buyer_new_password.jsp").include(request, response);
    	 	}	 
   	 	 	else if(s_otp == u_otp )
   	 	 	{
   	 	 		 BuyerDao.changestatus(email);
	 	 		 request.getRequestDispatcher("login_buyer.jsp").include(request, response);
   	 	 	}
   	 	 	else
   	 	 	{
   	 	 		 request.setAttribute("msg", "Entered OTP Is Wrong");
   	 	 		 request.setAttribute("value", s_otp);
   	 	 		 request.setAttribute("email", request.getParameter("email"));
   	 	 		 request.getRequestDispatcher("otp_buyer.jsp").include(request, response);
   	 	 	}	 
    }
    // Login-->Change password
    else if(action.equalsIgnoreCase("Change Password"))
    {
		 HttpSession session=request.getSession();
		 BuyerReg u=(BuyerReg) session.getAttribute("b");
		 String email = u.getEmail();
		 String o_pass = request.getParameter("o_pass");
		 BuyerReg seller = BuyerDao.checklogin(email, o_pass);
		 if(seller==null)
		 {
			     request.setAttribute("msg", "Enter Correct Old password");
			     request.getRequestDispatcher("buyer_change_password.jsp").include(request, response);
		 }
		 else
		 {
   	 	 if(request.getParameter("n_pass").equals(request.getParameter("c_pass"))) 
   	 	 {
   	 		 	 BuyerDao.changePassword(email, request.getParameter("n_pass"));
   	 		 	 request.setAttribute("msg", "Password Successfully Changed");
   	 		 	 response.sendRedirect("buyer_index.jsp");
   	     }
   	 	 else
   	 	 {
   	 		 request.setAttribute("msg", "Password and Confirm Password Does Not Match");
   	 		 request.getRequestDispatcher("buyer_change_password.jsp").include(request, response);
   	 		
   	 	 }
   	 }
    }
    // Email Verify
    else if(action.equalsIgnoreCase("Verify Email"))
    {
   	 	 boolean flag = BuyerDao.checkemail(request.getParameter("email"));
   	 	 if(flag == false)
   	 	 {
   		 	 Random t = new Random();
   		 	 int minRange = 10000, maxRange= 99999;
   		 	 int s_otp = t.nextInt(maxRange - minRange) + minRange;
   		 	 Services.sendMail(request.getParameter("email"), s_otp);
   		 	 request.setAttribute("msg", "Please Enter OTP Recieved In Mail");
   		 	 request.setAttribute("type", "buyer");
   		 	 request.setAttribute("value", s_otp);
   		 	 request.setAttribute("email", request.getParameter("email"));
   		 	 request.setAttribute("fpass", "fpass");
   		 	 request.getRequestDispatcher("otp_buyer.jsp").include(request, response);
   	 	 }
   	 	 else
   	 	 {
   	 		 request.setAttribute("msg", "Enter Correct Email ID");
   	 		 request.getRequestDispatcher("buyer_forgot_password.jsp").include(request, response);
   	 	 }
    }
    // Forget Password
    else if(action.equalsIgnoreCase("Update Password")) 
    {
   	 	 if(request.getParameter("pass").equals(request.getParameter("c_pass")))
   	 	 {
   	 		 BuyerDao.changePassword(request.getParameter("email"),request.getParameter("pass"));
   	 		 request.getRequestDispatcher("buyer_index.jsp").include(request, response);
   	 	 }
   	 	 else 
   	 	 {
   	 		 request.setAttribute("msg", "Password And Confirm Password Doesnot Match");
   	 		 request.getRequestDispatcher("buyer_new_password.jsp").include(request, response);
   	 	 }
    }
    else if(action.equalsIgnoreCase("Update Profile")) 
    {
			/*
			 * String savePath =
			 * "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\media_logo"
			 * ; File fileSaveDir=new File(savePath); if(!fileSaveDir.exists()){
			 * fileSaveDir.mkdir(); } Part file1 = request.getPart("logo"); String
			 * fileName=extractfilename(file1); file1.write(savePath + File.separator +
			 * fileName); String filePath= savePath + File.separator + fileName ;
			 * 
			 * String savePath2 =
			 * "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\media_logo"
			 * ; File imgSaveDir=new File(savePath2); if(!imgSaveDir.exists()){
			 * imgSaveDir.mkdir(); }
			 */
   	  BuyerReg reg = new BuyerReg(); 
   	  reg.setBid(Integer.parseInt(request.getParameter("bid")));
	  reg.setMname(request.getParameter("mname"));
	  reg.setDes(request.getParameter("des"));
			/* reg.setLogo(fileName); */
	  reg.setScope(request.getParameter("scope"));
	  reg.setAdd(request.getParameter("add"));
			/* reg.setEmail(request.getParameter("email")); */
	  reg.setCno(request.getParameter("cno"));
	  reg.setLno(request.getParameter("lno"));
	  System.out.println(reg.getBid()+ reg.getLno());
   	  BuyerDao.update(reg);
   	  request.getRequestDispatcher("buyer_profile.jsp").include(request, response);
    }
    else if(action.equals("Verify_email"))
    {
    	Random t = new Random();
	    int minRange = 10000, maxRange= 99999;
	    int s_otp = t.nextInt(maxRange - minRange) + minRange;
	    Services.sendMail(request.getParameter("email"), s_otp);
	    request.setAttribute("msg", "Please Enter OTP Recieved In Mail");
	    request.setAttribute("value", s_otp);
	    request.setAttribute("email", request.getParameter("email"));
	    request.setAttribute("fpass", "");
	    request.getRequestDispatcher("otp_buyer.jsp").include(request, response);
	    
	    
    }
  }
}
