package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.NewsReview;
import com.bean.NewsStack;
import com.bean.SoldNews;
import com.util.NewsSellUtil;

public class NewsStackDao {
	
	public static void saveNewsStack(NewsStack s)
	{
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "insert into NewsStack (bid,nid,uid)values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, s.getBid());
			ps.setInt(2, s.getNid());
			ps.setInt(3,  s.getUid());
			ps.executeUpdate();
			ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<NewsStack> getAllNewsStack(int bid)
	{
		List<NewsStack> list = new ArrayList<NewsStack>();
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from NewsStack where bid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,bid);
		    ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	NewsStack s = new NewsStack();
		    	s.setId(rs.getInt(1));
		    	s.setBid(rs.getInt(2));
		    	s.setNid(rs.getInt(3));
		    	s.setUid(rs.getInt(4));
		    	list.add(s);
		    }
		    rs.close();
		    ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static void removeFromNewsStack(int id)
	{
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "delete from NewsStack where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
	        con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	public static boolean findNews(int id, int nid)
	{
        boolean flag=true;
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from NewsStack where bid=? and nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, nid);
			ResultSet rs = ps.executeQuery();
		    if(rs.next())
		    {
		        flag=false;
		    }
		    rs.close();
		    ps.close();
	        con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
		
	}

	/*
	 * public static void saveFeedback(Feedback f) { try {
	 * 
	 * Connection con = NewsSellUtil.Getconnection(); String sql =
	 * "insert into feedback (about_news,rating,nid,bid,uid)values(?,?,?,?,?)";
	 * PreparedStatement ps = con.prepareStatement(sql); ps.setString(1,
	 * f.getAboutNews()); ps.setString(2, f.getRating()); ps.setInt(3, f.getNid());
	 * ps.setInt(4, f.getBid()); ps.setInt(5, f.getUid()); ps.executeUpdate();
	 * ps.close(); con.close(); } catch(Exception e) { e.printStackTrace(); } }
	 */
	public static int getAllNewsStackCount(int bid)
	{
		int stk = 0;
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from NewsStack where bid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,bid);
		    ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	stk++;
		    }
		    rs.close();
		    ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return stk;
	}
	public static boolean getNid(int nid)
	{
		boolean flag = true;
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from NewsStack where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,nid);
		    ResultSet rs = ps.executeQuery();
		    if(rs.next())
		    {
		    	flag=false;
		    }
		    rs.close();
		    ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static void soldNews(SoldNews s)
	{
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "insert into soldnews (nid,bid,uid,date)values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, s.getNid());
			ps.setInt(2, s.getBid());
			ps.setInt(3,  s.getUid());
			ps.setDate(4, s.getDate());
			ps.executeUpdate();
			ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void saveReview(NewsReview nr)
	{
		
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "insert into newsreview (nid, bid, news_relevant, content_quality, media_quality)"
					+ "values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, nr.getNid());
			ps.setInt(2, nr.getBid());
			ps.setInt(3, nr.getNews_relevant());
			ps.setInt(4, nr.getContent_quality());
			ps.setInt(5, nr.getMedia_quality());
		
			ps.executeUpdate();
			ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static List<NewsReview> getReview(int bid, int nid)
	{
		List<NewsReview> li = new ArrayList<NewsReview>();
		
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from newsreview where bid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, nid);
			ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	NewsReview nr = new NewsReview();
		    	nr.setNid(rs.getInt(2));
		    	nr.setNews_relevant(rs.getInt(4));
		    	nr.setContent_quality(rs.getInt(5));
		    	nr.setMedia_quality(rs.getInt(6));
		    	li.add(nr);
		    }
		    rs.close();
		    ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return li;

	}
	public static List<SoldNews> getSold(int bid)
	{
		List<SoldNews> li = new ArrayList<SoldNews>();
		
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from soldnews where bid=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bid);
			ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	SoldNews nr = new SoldNews();
		    	nr.setDate(rs.getDate(5));
		    	li.add(nr);
		    	
		    }
		    rs.close();
		    ps.close();
	        con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return li;

	}
	


}

