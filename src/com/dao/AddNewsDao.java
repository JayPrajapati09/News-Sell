package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.bean.AddNews;
import com.bean.UserReg;
import com.util.NewsSellUtil;

public class AddNewsDao {
	
	public static void save(AddNews ns)
	{
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "insert into addnews(uid,visibility,newstype,newstitle,newsheading,newsdescription,"
					+ "newsimg,newsvideo,venue,price,date,time,restriction,status)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ns.getUid());
			ps.setString(2, ns.getVisibility());
			ps.setString(3, ns.getNtype());
			ps.setString(4, ns.getNtitle());
			ps.setString(5, ns.getNhead());
			ps.setString(6, ns.getNdesc());
			ps.setString(7, ns.getNimg());
			ps.setString(8, ns.getNvideo());
			ps.setString(9, ns.getVenue());
			ps.setInt(10, ns.getAmount());
			ps.setString(11, ns.getDate());
			ps.setString(12,ns.getTime());
			ps.setString(13, ns.getRestriction());
			ps.setString(14, "Unsold");
			ps.executeUpdate();
			ps.close();
	        con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static List<AddNews> viewnews(int id) 
	{
		List<AddNews> list = new ArrayList<AddNews>();
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from addnews where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,  id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				AddNews ns = new AddNews();
				ns.setNid(rs.getInt(1));
				ns.setVisibility(rs.getString(3));
				ns.setNtype(rs.getString(4));
				ns.setNtitle(rs.getString(5));
				ns.setNhead(rs.getString(6));
				ns.setNdesc(rs.getString(7));
				ns.setNimg(rs.getString(8));
				ns.setNvideo(rs.getString(9));
				ns.setVenue(rs.getString(10));
				ns.setAmount(rs.getInt(11));
				ns.setDate(rs.getString(12));
				ns.setTime(rs.getString(13));
				list.add(ns);
			}
			rs.close();
			ps.close();
	        con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static List<AddNews> getAllNews() 
	{
		List<AddNews> list = new ArrayList<AddNews>();
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "Select * from addnews where status=? and visibility=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Unsold");
			ps.setString(2, "Public");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				AddNews ns = new AddNews();
				ns.setNid(rs.getInt(1));
				ns.setUid(rs.getInt(2));
				ns.setVisibility(rs.getString(3));
				ns.setNtype(rs.getString(4));
				ns.setNtitle(rs.getString(5));
				ns.setNhead(rs.getString(6));
				ns.setNdesc(rs.getString(7));
				ns.setNimg(rs.getString(8));
				ns.setNvideo(rs.getString(9));
				ns.setVenue(rs.getString(10));
				ns.setAmount(rs.getInt(11));
				ns.setDate(rs.getString(12));
				ns.setTime(rs.getString(13));
				ns.setRestriction(rs.getString(14));
				ns.setStatus(rs.getString(15));
				list.add(ns);
			}
			rs.close();
			ps.close();
	         con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public static UserReg getUserByIdForBuyer(int id) {
		 UserReg reg = new UserReg();
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration where uid=?");
			 ps.setInt(1,  id);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
			     reg.setFirstname(rs.getString(2));
			     reg.setLastname(rs.getString(3));
			     reg.setAddress(rs.getString(4));
			     reg.setEmail(rs.getString(5));
			     reg.setMobileno(rs.getString(6));
			 }
			 rs.close();
	         ps.close();
			 con.close();
		 }
		     catch( Exception e ) { e.printStackTrace(); }
		     return reg;
	     }
	public static AddNews getNewsById(int id) 
	{
		AddNews ns=null;
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from addnews where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				ns = new AddNews();
				ns.setNid(rs.getInt(1));
				ns.setUid(rs.getInt(2));
				ns.setVisibility(rs.getString(3));
				ns.setNtype(rs.getString(4));
				ns.setNtitle(rs.getString(5));
				ns.setNhead(rs.getString(6));
				ns.setNdesc(rs.getString(7));
				ns.setNimg(rs.getString(8));
				ns.setNvideo(rs.getString(9));
				ns.setVenue(rs.getString(10));
				ns.setAmount(rs.getInt(11));
				ns.setDate(rs.getString(12));
				ns.setTime(rs.getString(13));
				ns.setRestriction(rs.getString(14));
			}
			rs.close();
			ps.close();
	         con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ns;
	}
	public static AddNews getNewsByNewsId(int id) 
	{
		AddNews ns=null;
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from addnews where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				ns = new AddNews();
				ns.setNid(rs.getInt(1));
				ns.setUid(rs.getInt(2));
				ns.setVisibility(rs.getString(3));
				ns.setNtype(rs.getString(4));
				ns.setNtitle(rs.getString(5));
				ns.setNhead(rs.getString(6));
				ns.setNdesc(rs.getString(7));
				ns.setNimg(rs.getString(8));
				ns.setNvideo(rs.getString(9));
				ns.setVenue(rs.getString(10));
				ns.setAmount(rs.getInt(11));
				ns.setDate(rs.getString(12));
				ns.setTime(rs.getString(13));
				ns.setRestriction(rs.getString(14));
		
			}
			rs.close();
			ps.close();
	         con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ns;
	}
	public static void updateNews(AddNews ns)
	{
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "update addnews set visibility=?,newstype=?,newstitle=?,"
					+ "newsheading=?,newsdescription=?,newsvideo=?,"
					+ "venue=?,price=?,date=?,time=?,restriction=? where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ns.getVisibility());
			ps.setString(2, ns.getNtype());
			ps.setString(3, ns.getNtitle());
			ps.setString(4, ns.getNhead());
			ps.setString(5, ns.getNdesc());
			ps.setString(6, ns.getNvideo());
			ps.setString(7, ns.getVenue());
			ps.setInt(8, ns.getAmount());
			ps.setString(9, ns.getDate());
			ps.setString(10,ns.getTime());
			ps.setString(11, ns.getRestriction());
			ps.setInt(12, ns.getNid());
		    ps.executeUpdate();
		    ps.close();
	         con.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void updateNewsImage(AddNews ns)
	{
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "update addnews set newsimg=? where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ns.getNimg());
			ps.setInt(2, ns.getNid());
		    ps.executeUpdate();
		    ps.close();
	         con.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void deleteNews(int id)
	{
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "delete from addnews where nid=?";
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
	public static AddNews newsById(int nid) 
	{
		AddNews ns=null;
		try 
		{
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select * from addnews where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, nid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				ns = new AddNews();
				ns.setNid(rs.getInt(1));
				ns.setUid(rs.getInt(2));
				ns.setNtype(rs.getString(4));
				ns.setNtitle(rs.getString(5));
				ns.setNhead(rs.getString(6));
				ns.setNdesc(rs.getString(7));
				ns.setNimg(rs.getString(8));
				ns.setNvideo(rs.getString(9));
				ns.setAmount(rs.getInt(11));
				ns.setDate(rs.getString(12));
				ns.setTime(rs.getString(13));
				ns.setRestriction(rs.getString(14));
		
			}
			rs.close();
			ps.close();
	         con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ns;
	}
	public static void changeStatus(int nid)
	{
		try {
			Connection con = NewsSellUtil.Getconnection();
			String sql = "update addnews set status=? where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Sold");
			ps.setInt(2, nid);
			ps.executeUpdate();
			ps.close();
	         con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static AddNews findStatus(int nid)
	{
		AddNews ns=null;
		try {
			Connection con = NewsSellUtil.Getconnection();
			String sql = "select status from addnews where nid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, nid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				ns  = new AddNews();
				ns.setStatus(rs.getString(15));
			}
			rs.close();
			ps.close();
	         con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ns;
	}
	

}
