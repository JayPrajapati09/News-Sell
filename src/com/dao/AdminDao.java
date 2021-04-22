package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.bean.Admin;
import com.bean.BuyerReg;
import com.util.NewsSellUtil;

public class AdminDao {
	
	public static void save(Admin a) {
	
	     try {
	    	 Connection con = NewsSellUtil.Getconnection();
	    	 String sql = "insert into admin(name,email,pass,status)values(?,?,?,?)";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, a.getName());
			 ps.setString(2, a.getEmail());
			 ps.setString(3, a.getPass());
			 ps.setString(4, "inactive");
			 ps.executeUpdate();
			 ps.close();
		     con.close();
	     } 
	     catch (SQLException e) {
	    	 e.printStackTrace(); 
	    	 }
	     }
	 
	 public static void update(Admin a) {

		 try {
			 Connection con = NewsSellUtil.Getconnection();
			 String sql = "update admin set name=?,email=?,pass=? where id=?";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, a.getName());
			 ps.setString(2, a.getEmail());
			 ps.setString(3, a.getPass());
			 ps.executeUpdate();
			 ps.close();
		     con.close();
		     }
		     catch( Exception e ) { 
		    	 e.printStackTrace(); 
		    	 }
	         }
	 public static boolean checkemail(String email) {
		 boolean flag = true;
	     try {
		     Connection con = NewsSellUtil.Getconnection();
		     String sql = "select * from admin where email=?";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1,  email);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 flag = false;
			 }
			 rs.close();
			 ps.close();
		     con.close();
	     }
	     catch( Exception e ) { 
	    	 e.printStackTrace(); 
	    	 }
		 return flag;		 
	 }
	 
	 public static Admin checklogin(String email, String pass) {
		 Admin a = null;
		 try {
		     Connection con = NewsSellUtil.Getconnection();
		     String sql = "select * from admin where email=? and pass=?";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1,  email);
			 ps.setString(2,  pass);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
			     a = new Admin();
			     a.setName(rs.getString(1));
			     a.setEmail(rs.getString(2));
			     a.setPass(rs.getString(3));
			 }
			 rs.close();
			 ps.close();
		     con.close();
	     }
	     catch( Exception e ) { 
	    	 e.printStackTrace(); 
	    	 }
		 return a;
	 }
	 
	 public static void changestatus(String email) {
		 String status = "activate";
		 try {
		     Connection con = NewsSellUtil.Getconnection();
		     String sql = "update buyer_registration set status=? where email=?";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, status);
			 ps.setString(2, email);
			 ps.executeUpdate();
			 ps.close();
		     con.close();
	    }
		catch( Exception e ) { e.printStackTrace(); }
     }
	 public static void deleteUser(int uid)
		{
			try 
			{
				Connection con = NewsSellUtil.Getconnection();
				String sql = "delete from registration where uid=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, uid);
				ps.executeUpdate();
				ps.close();
			    con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
	 public static void deleteBuyer(int bid)
		{
			try 
			{
				Connection con = NewsSellUtil.Getconnection();
				String sql = "delete from buyer_registration where bid=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, bid);
				ps.executeUpdate();
				ps.close();
			    con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
	   public static void deleteNews(int nid)
		{
			try 
			{
				Connection con = NewsSellUtil.Getconnection();
				String sql = "delete from addnews where nid=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, nid);
				ps.executeUpdate();
				ps.close();
			    con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}

}
