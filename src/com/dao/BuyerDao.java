package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.bean.BuyerReg;
import com.bean.UserReg;
import com.util.NewsSellUtil;

public class BuyerDao {

	 public static int save(BuyerReg reg) {
			 int status  = 0;
		     try {
		    	 Connection con = NewsSellUtil.Getconnection();
		    	 String sql = "insert into buyer_registration(medianame,description,logo,scope,"
		    	 		+ "address,email,contactno,landlinenumber,password,status)values(?,?,?,?,?,?"
		    	 		+ ",?,?,?,?)";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, reg.getMname());
				 ps.setString(2, reg.getDes());
				 ps.setString(3, reg.getLogo());
				 ps.setString(4,  reg.getScope());
				 ps.setString(5, reg.getAdd());
				 ps.setString(6, reg.getEmail());
				 ps.setString(7, reg.getCno());
				 ps.setString(8, reg.getLno());
				 ps.setString(9,  reg.getPass());
				 ps.setString(10,  "inactive");
			     status = ps.executeUpdate();
			     ps.close();
			     con.close();
		     } 
		     catch (SQLException e) { e.printStackTrace(); }
		     System.out.println(status);
			 return status;
		     }
		 
		 public static void  update(BuyerReg reg) {
			 
			 try {
				 System.out.println(reg);
				 Connection con = NewsSellUtil.Getconnection();
				 String sql = "update buyer_registration set medianame=?, description=?, scope=?, address=?, contactno=?, landlinenumber=?  where bid=? ";
				 PreparedStatement ps = con.prepareStatement(sql);
		        
				 ps.setString(1, reg.getMname());
				 ps.setString(2, reg.getDes());		 
				 ps.setString(3, reg.getScope());
				 ps.setString(4, reg.getAdd());
				 ps.setString(5, reg.getCno());
				 ps.setString(6, reg.getLno());
				 ps.setInt(7,  reg.getBid());
		         ps.executeUpdate();
		         ps.close();
		         con.close();
			     }
			     catch( Exception e ) { e.printStackTrace(); }
			     
		         }
		 public static BuyerReg buyerDetail(String email) {
			 BuyerReg reg=null; 
		     try {
			     Connection con = NewsSellUtil.Getconnection();
				 PreparedStatement ps = con.prepareStatement("select * from buyer_registration "
				 		+ "where email=?");
				 ps.setString(1,  email);
				 ResultSet rs = ps.executeQuery();
				 while(rs.next()) {
					 reg = new BuyerReg();
					 reg.setBid(rs.getInt(1));
					 reg.setMname(rs.getString(2));
				     reg.setDes(rs.getString(3));
				     reg.setLogo(rs.getString(4));
				     reg.setScope(rs.getString(5));
				     reg.setAdd(rs.getString(6));
				     reg.setEmail(rs.getString(7));
				     reg.setCno(rs.getString(8));
				     reg.setLno(rs.getString(9));
				     reg.setPass(rs.getString(10));
				 }
				 ps.close();
				 rs.close();
				 con.close();
		     }
		     catch( Exception e ) { 
		    	 e.printStackTrace();
		    	 }
			 return reg;		 
		 }
		 
		 public static BuyerReg getUserById(int id) {
			 BuyerReg reg = new BuyerReg();
		     try {
			     Connection con = NewsSellUtil.Getconnection();
			     String sql = "select * from buyer_registration where bid=?";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setInt(1,  id);
				 ResultSet rs = ps.executeQuery();
				 if(rs.next()) {
					 reg.setBid(id);
				     reg.setMname(rs.getString(2));
				     reg.setDes(rs.getString(3));
				     reg.setLogo(rs.getString(4));
				     reg.setScope(rs.getString(5));
				     reg.setAdd(rs.getString(6));
				     reg.setEmail(rs.getString(7));
				     reg.setCno(rs.getString(8));
				     reg.setLno(rs.getString(9));
				     reg.setPass(rs.getString(10));
				     reg.setStatus(rs.getString(11));
				 }
				 rs.close();
				 ps.close();
				 con.close();
			 }
			     catch( Exception e ) { e.printStackTrace(); }
			     return reg;
		     }
		 
		 public static List<BuyerReg> getAllUser(){
			 List <BuyerReg> li = new ArrayList<BuyerReg>();
			 try {
				 Connection con = NewsSellUtil.Getconnection();
				 String sql = "select * from buyer_registration ";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ResultSet rs = ps.executeQuery();
				 while(rs.next()) {
				     BuyerReg reg= new BuyerReg(); 
				     reg.setBid(rs.getInt(1));
				     reg.setMname(rs.getString(2));
				     reg.setDes(rs.getString(3));
				     reg.setLogo(rs.getString(4));
				     reg.setScope(rs.getString(5));
				     reg.setAdd(rs.getString(6));
				     reg.setEmail(rs.getString(7));
				     reg.setCno(rs.getString(8));
				     reg.setLno(rs.getString(9));
				     reg.setPass(rs.getString(10));
				     reg.setStatus(rs.getString(11));
				     li.add(reg);
			     }
				 rs.close();
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
			     String sql = "select * from buyer_registration where email=?";
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
		     catch( Exception e ) { e.printStackTrace(); }
			 return flag;		 
		 }
		 public static String getEmail(int id) {
			 String email=null;
		     try {
			     Connection con = NewsSellUtil.Getconnection();
			     String sql = "select email from buyer_registration where bid=?";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setInt(1,  id);
				 ResultSet rs = ps.executeQuery();
				 if(rs.next()) {
					 email = rs.getString(7);
				 }
				 rs.close();
				 ps.close();
		         con.close();
		     }
		     catch( Exception e ) { e.printStackTrace(); }
			 return email;		 
		 }
		 
		 public static BuyerReg checklogin(String email, String pass) {
			 BuyerReg reg = null;
			 try {
			     Connection con = NewsSellUtil.Getconnection();
			     String sql = "select * from buyer_registration where email=? and password=?";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1,  email);
				 ps.setString(2,  pass);
				 ResultSet rs = ps.executeQuery();
				 if(rs.next()) {
				     reg = new BuyerReg();
				     reg.setBid(rs.getInt(1));
				     reg.setMname(rs.getString(2));
				     reg.setDes(rs.getString(3));
				     reg.setLogo(rs.getString(4));
				     reg.setScope(rs.getString(5));
				     reg.setAdd(rs.getString(6));
				     reg.setEmail(rs.getString(7));
				     reg.setCno(rs.getString(8));
				     reg.setLno(rs.getString(9));
				     reg.setPass(rs.getString(10));
				     reg.setStatus(rs.getString(11));
				 }
				 rs.close();
				 ps.close();
		         con.close();
		     }
		     catch( Exception e )
			 { 
		    	 e.printStackTrace(); 
		     }
			 return reg;
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
		 
		 public static void changePassword(String email, String pass) {
			 try {
			     Connection con = NewsSellUtil.Getconnection();
			     String sql = "update buyer_registration set password=? where email=?";
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
		 public static List<BuyerReg> getAllBuyerName(){
			 List <BuyerReg> li = new ArrayList<BuyerReg>();
			 try {
				 Connection con = NewsSellUtil.Getconnection();
				 String sql = "select * from buyer_registration ";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ResultSet rs = ps.executeQuery();
				 while(rs.next()) {
				     BuyerReg reg= new BuyerReg(); 
				     reg.setMname(rs.getString(2));
				     li.add(reg);
			     }
				 rs.close();
		         ps.close();
				 con.close();
			     }
			    catch( Exception e ) { e.printStackTrace(); }
			    return li;	 
		  }
		 public static String getStatus(String email) {
			 String status = null;
			 try {
			     Connection con = NewsSellUtil.Getconnection();
			     String sql = "select status from buyer_registration  where email=?";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(2, email);
				 ResultSet rs = ps.executeQuery();
				 if(rs.next())
				 {
					 status = rs.getString(11);
				 }
				 rs.close();
				 ps.close();
		         con.close();
		    }
			catch( Exception e ) { e.printStackTrace(); }
			 return status;
	     }
		 

	}