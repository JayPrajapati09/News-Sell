package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Wishlist;
import com.dao.WishlistDao;


@WebServlet("/WishlistController")
public class WishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("wishlist"))
		{

			int bid = Integer.parseInt(request.getParameter("bid"));
			int nid = Integer.parseInt(request.getParameter("nid"));
			Wishlist w = new Wishlist();
			w.setBid(bid);
			w.setNid(nid);
			WishlistDao.saveWishlist(w);
	        request.getRequestDispatcher("buyer_view_news.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Remove"))
		{
			int nid = Integer.parseInt(request.getParameter("nid"));
			WishlistDao.removeFromWishlist(nid);
			 request.getRequestDispatcher("buyer_wishlist.jsp").forward(request, response);
		}
		   
	}

}
