package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.*;
import com.util.NewsSellUtil;

public class UserDao 
{
	 public static int save(UserReg reg) {
		 int status  = 0;
	     try {
	    	 Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("insert into registration(firstname,lastname,address,email,mobileno,password,status)values(?,?,?,?,?,?,?)");
			 ps.setString(1, reg.getFirstname());
			 ps.setString(2, reg.getLastname());
			 ps.setString(3, reg.getAddress());
			 ps.setString(4, reg.getEmail());
			 ps.setString(5, reg.getMobileno());
			 ps.setString(6, reg.getPassword());
			 ps.setString(7,  "inactive");
		     status = ps.executeUpdate();
			 ps.close();
		     con.close();
	     } 
	     catch (SQLException e) { e.printStackTrace(); }
	     System.out.println(status);
		 return status;
	     }
	 
	 public static int update(UserReg reg) {
		 int status = 0;
		 try {
			 Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("update registration set firstname=?,lastname=?,address=?,mobileno=? where uid=?");  
			 ps.setString(1, reg.getFirstname());
			 ps.setString(2, reg.getLastname());
			 ps.setString(3, reg.getAddress());
			 ps.setString(4, reg.getMobileno());
			 ps.setInt(5,  reg.getUid());
	         status = ps.executeUpdate();
	         ps.close();
	         con.close();
		     }
		     catch( Exception e ) { e.printStackTrace(); }
		     return status;
	         }
	 
	 public static int delete(int id) {
		 int status = 0;
		 try {
			 Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("delete from registration where uid=?");
			 ps.setInt(1, id);
			 status = ps.executeUpdate();
			 ps.close();
	         con.close();
		     }
		     catch( Exception e ) { e.printStackTrace(); }
		     return status;
	         }
	 
	 public static UserReg getUserById(int id) {
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
			     reg.setPassword(rs.getString(7));
			     reg.setStatus(rs.getString(8));
			 }
			 ps.close();
			 con.close();
		 }
		     catch( Exception e ) { e.printStackTrace(); }
		     return reg;
	     }
	 
	 public static List<UserReg> getAllUser(){
		 List <UserReg> li = new ArrayList<UserReg>();
		 try {
			 Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration ");
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
			     UserReg reg= new UserReg(); 
			     reg.setUid(rs.getInt(1));
			     reg.setFirstname(rs.getString(2));
		         reg.setLastname(rs.getString(3));
			     reg.setAddress(rs.getString(4));
			     reg.setEmail(rs.getString(5));
			     reg.setMobileno(rs.getString(6));
			     reg.setPassword(rs.getString(7));
			     reg.setStatus(rs.getString(8));
			     li.add(reg);
		     }
			 ps.close();
			 con.close();
		     }
		    catch( Exception e ) { e.printStackTrace(); }
		    return li;	 
	     }

	 public static boolean checkemail(String email) {
		 boolean flag = true;
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration where email=?");
			 ps.setString(1,  email);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 flag = false;
			 }
			 rs.close();
			 ps.close();
	         con.close();
	     }
	     catch( Exception e ) { e.printStackTrace(); }
		 return flag;		 
	 }
	 public static UserReg userDetail(String email) {
		 UserReg u=null; 
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration where email=?");
			 ps.setString(1,  email);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 u = new UserReg();
				 u.setUid(rs.getInt(1));
			     u.setFirstname(rs.getString(2));
		         u.setLastname(rs.getString(3));
			     u.setAddress(rs.getString(4));
			     u.setEmail(rs.getString(5));
			     u.setMobileno(rs.getString(6));
			     u.setPassword(rs.getString(7));
			     u.setStatus(rs.getString(8));
			 }
			 rs.close();
			 ps.close();
			 con.close();
	     }
	     catch( Exception e ) { 
	    	 e.printStackTrace();
	    	 }
		 return u;		 
	 }
	 
	 public static UserReg checklogin(String email, String pass) {
		 UserReg reg = null;
		 try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration where email=? and password=?");
			 ps.setString(1,  email);
			 ps.setString(2,  pass);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
			     reg = new UserReg();
			     reg.setUid(rs.getInt(1));
			     reg.setFirstname(rs.getString(2));
		         reg.setLastname(rs.getString(3));
			     reg.setAddress(rs.getString(4));
			     reg.setEmail(rs.getString(5));
			     reg.setMobileno(rs.getString(6));
			     reg.setPassword(rs.getString(7));
			     reg.setStatus(rs.getString(8));
			 }
			 rs.close();
			 ps.close();
	         con.close();
	     }
	     catch( Exception e ) { e.printStackTrace(); }
		 return reg;
	 }
	 
	 public static void changestatus(String email,String status) {
		 String s = status;
		 try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("update registration set status=? where email=?");
			 ps.setString(1, status);
			 ps.setString(2, email);
			 ps.executeUpdate();
			 ps.close();
	         con.close();
	    }
		catch( Exception e ) { e.printStackTrace(); }
     }
	 public static String getEmail(int id) {
		 String s1 = null;
		 try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select email from registration where uid=?");
			 ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next())
			 {
				 s1 = rs.getString(5);
			 }
			 rs.close();
			 ps.close();
	         con.close();
	    }
		catch( Exception e ) { e.printStackTrace(); }
		 return s1;
     }
	 
	 public static void changePassword(String email, String pass) {
		 try {
		     Connection con = NewsSellUtil.Getconnection();
		     String sql = "update registration set password=? where email=?";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ps.setString(1, pass);
			 ps.setString(2, email);
			 ps.executeUpdate();
			 ps.close();
	         con.close();
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 } 
	 }
	 public static UserReg getUserNameById(int id) {
		 UserReg reg = new UserReg();
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration where uid=?");
			 ps.setInt(1,  id);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
			     reg.setFirstname(rs.getString(2));
			     reg.setLastname(rs.getString(3));
			   
			 }
			 rs.close();
			 ps.close();
	         con.close();
		 }
		     catch( Exception e ) { e.printStackTrace(); }
		     return reg;
	     }
	 public static String getUserStatus(int uid) {
		 String s = null;
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select status from registration where uid=?");
			 ps.setInt(1,  uid);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
			     s = rs.getString(8);
			 }
			 rs.close();
			 ps.close();
	         con.close();
		 }
		     catch( Exception e ) { e.printStackTrace(); }
		     return s;
	     }
	 public static UserReg getUserNameByIdForBuyer(int id) {
		 UserReg reg =null;
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration where uid=?");
			 ps.setInt(1,  id);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 reg = new UserReg();
				 reg.setUid(rs.getInt(1));
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
	 public static int[] user_news_info(int id) {
		 int newscounter[] = new int[2];
		 newscounter[0] = 0;
		 newscounter[1] = 0;
		 try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select status from addnews where uid=?");
			 ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next())
			 {
				 if (rs.getString("status").equals("Sold"))
				 {
					 newscounter[1] += 1 ;
				 }
				 newscounter[0] += 1; 
			 }
			 rs.close();
			 ps.close();
	         con.close();
	    }
		catch( Exception e ) { e.printStackTrace(); }
		 return newscounter;
     }
		
}