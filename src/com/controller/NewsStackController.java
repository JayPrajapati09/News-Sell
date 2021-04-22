package com.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.AddNews;

import com.bean.NewsReview;
import com.bean.NewsStack;
import com.bean.SoldNews;
import com.dao.AddNewsDao;
import com.dao.NewsStackDao;
import com.dao.WishlistDao;
@WebServlet("/NewsStackController")

public class NewsStackController extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		       
			String action = request.getParameter("action");
			if(action.equalsIgnoreCase("stack"))
			{
				int bid = Integer.parseInt(request.getParameter("bid"));
				int nid = Integer.parseInt(request.getParameter("nid"));
				int uid = Integer.parseInt(request.getParameter("uid"));
				String page = request.getParameter("page");
				
				
				if (NewsStackDao.getAllNewsStackCount(bid) <= 10 && NewsStackDao.getNid(nid) == true)
				{
					NewsStack s = new NewsStack();
					s.setBid(bid);
					s.setNid(nid);
					s.setUid(uid);
					NewsStackDao.saveNewsStack(s);
					if(page.equals("view news"))
					{
					request.getRequestDispatcher("buyer_view_news.jsp").forward(request, response);
					}
					else
					{
					request.getRequestDispatcher("buyer_wishlist.jsp").forward(request, response);
					}
				}
				else
				{
					request.setAttribute("msg", "Stack Count is Full Plz Remove Or Checkout News");
					if(page.equals("view news"))
					{
					request.getRequestDispatcher("buyer_view_news.jsp").forward(request, response);
					}
					else
					{
					request.getRequestDispatcher("buyer_wishlist.jsp").forward(request, response);
					}
				}

			}
			else if(action.equalsIgnoreCase("Delete"))
			{
				int nid = Integer.parseInt(request.getParameter("nid"));
				NewsStackDao.removeFromNewsStack(nid);
				request.getRequestDispatcher("buyer_stack.jsp").forward(request, response);
			}
			else if(action.equalsIgnoreCase("Submit"))
			{
				int nr =  Integer.parseInt(request.getParameter("nr"));
				int cq =Integer.parseInt(request.getParameter("cq"));
				int mq=Integer.parseInt(request.getParameter("mq"));
				int nid = Integer.parseInt(request.getParameter("nid"));
				int bid = Integer.parseInt(request.getParameter("bid"));
				
	 	        
				NewsReview nrv = new NewsReview();
				nrv.setNid(nid);
				nrv.setBid(bid);
				nrv.setNews_relevant(nr);
				nrv.setContent_quality(cq);
				nrv.setMedia_quality(mq);
			
				NewsStackDao.saveReview(nrv);
				
				request.getRequestDispatcher("buyer_index.jsp").forward(request, response);
			}
			else if(action.equalsIgnoreCase("Contact"))
			{
				int nid = Integer.parseInt(request.getParameter("nid"));
				int bid = Integer.parseInt(request.getParameter("bid"));
				int uid = Integer.parseInt(request.getParameter("uid"));
				SoldNews s = new SoldNews();
				s.setBid(bid);
				s.setNid(nid);
				s.setUid(uid);
				long millis=System.currentTimeMillis();  
		 	    Date date=new Date(millis);
		 	    s.setDate(date);
				NewsStackDao.soldNews(s);
				AddNews ns =AddNewsDao.newsById(nid);
				AddNewsDao.changeStatus(nid);
				WishlistDao.removeFromWishlist(nid);
				NewsStackDao.removeFromNewsStack(nid);
				request.setAttribute("ns", ns);
				request.getRequestDispatcher("buyer_confirm_news.jsp").forward(request, response);
				
			}
		}

	}


