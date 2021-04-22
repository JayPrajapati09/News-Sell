package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bean.AddNews;
import com.bean.UserReg;
import com.dao.AddNewsDao;

@WebServlet("/AddNewsController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024 * 512)
public class AddNewsController extends HttpServlet {
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
		String action = request.getParameter("action");
		if (action.equals("Submit News"))
		{
			String savePath = "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\news_image";   
 			File fileSaveDir=new File(savePath);
 	        if(!fileSaveDir.exists()){
 	            fileSaveDir.mkdir();
 	        }
 	        Part file1 = request.getPart("nimg");
 		 	String fileName=extractfilename(file1);
 		    file1.write(savePath + File.separator + fileName);
 		    String filePath= savePath + File.separator + fileName ;
 		    
 		    String savePath2 = "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\news_image";
 	        File imgSaveDir=new File(savePath2);
 	        if(!imgSaveDir.exists()){
 	            imgSaveDir.mkdir();
 	        }
 	        long millis=System.currentTimeMillis();  
 	        Date date=new Date(millis);
 	        
	        long now = System.currentTimeMillis();
 	        Time time = new Time(now);
 	        
 	        AddNews news = new AddNews();
 	        news.setUid(Integer.parseInt((request.getParameter("uid"))));
 	        news.setVisibility(request.getParameter("visibility"));
 	        news.setNtype(request.getParameter("ntype"));
 	        news.setNtitle(request.getParameter("ntitle"));
 	        news.setNhead(request.getParameter("nhead"));
 	        news.setNdesc(request.getParameter("ndesc"));
 	        news.setNimg(fileName);
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
 	        System.out.println(request.getParameter("uid"));
 	        AddNewsDao.save(news);
 	        request.getRequestDispatcher("user_uploadnews.jsp").forward(request, response);
		}
	
		else if(action.equalsIgnoreCase("View News"))
		{
			List<AddNews> li = new ArrayList<AddNews>();
		    li = AddNewsDao.getAllNews();
		    request.setAttribute("list", li);
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
 	        news.setNhead(request.getParameter("nhead"));
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
 	        request.getRequestDispatcher("user_news_view.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			AddNewsDao.deleteNews(Integer.parseInt(request.getParameter("nid")));
			request.getRequestDispatcher("user_news_view.jsp").forward(request, response);
		}
		else if(action.equals("Update Image"))
		{
			String savePath = "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\news_image";   
 			File fileSaveDir=new File(savePath);
 	        if(!fileSaveDir.exists()){
 	            fileSaveDir.mkdir();
 	        }
 	        Part file1 = request.getPart("nimg");
 		 	String fileName=extractfilename(file1);
 		    file1.write(savePath + File.separator + fileName);
 		    String filePath= savePath + File.separator + fileName ;
 		    
 		    String savePath2 = "C:\\Users\\JAY PRAJAPATI\\eclipse-workspace\\UserSide\\WebContent\\news_image";
 	        File imgSaveDir=new File(savePath2);
 	        if(!imgSaveDir.exists()){
 	            imgSaveDir.mkdir();
 	        }
 	        AddNews ns= new AddNews();
 	        ns.setNid(Integer.parseInt(request.getParameter("id")));
 	        ns.setNimg(fileName);
 	        AddNewsDao.updateNewsImage(ns);
 	        request.setAttribute("msg", "Image Updated Successfully");
 	        request.getRequestDispatcher("user_news_view.jsp").forward(request, response);
		}
	}
}
