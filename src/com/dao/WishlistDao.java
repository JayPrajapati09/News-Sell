package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Wishlist;
import com.util.NewsSellUtil;

public class WishlistDao {
	
	public static void saveWishlist(Wishlist w)
	{
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "insert into wishlist (bid,nid)values(?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, w.getBid());
			ps.setInt(2, w.getNid());
			ps.executeUpdate();
			ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Wishlist> getAllWishlist(int bid)
	{
		List<Wishlist> list = new ArrayList<Wishlist>();
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from wishlist where bid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,bid);
		    ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	Wishlist ws = new Wishlist();
		    	ws.setId(rs.getInt(1));
		    	ws.setBid(rs.getInt(2));
		    	ws.setNid(rs.getInt(3));
		    	list.add(ws);
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
	public static void removeFromWishlist(int id)
	{
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "delete from wishlist where nid=?";
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
			String sql = "select * from wishlist where bid=? and nid=?";
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
	public static int getAllWishlistCount(int bid)
	{
		int wis = 0;
		try
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from wishlist where bid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,bid);
		    ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	wis++;
		    }
		    rs.close();
		    ps.close();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return wis;
	}


}
