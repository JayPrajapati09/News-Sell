package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.AddNews;
import com.bean.UserReg;
import com.util.NewsSellUtil;

public class HomeDao {
	
	public static int mediaCount() {
		 int media = 0;
	     try {
		     Connection con = NewsSellUtil.Getconnection();
		     String sql = "select * from buyer_registration ";
			 PreparedStatement ps = con.prepareStatement(sql);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 media++;
			 }
			 rs.close();
	         ps.close();
			 con.close();
		 }
		     catch( Exception e ) { e.printStackTrace(); }
		     return media;
	     }
	 public static int users() {
		 int user = 0;
	     try {
		     Connection con = NewsSellUtil.Getconnection();
			 PreparedStatement ps = con.prepareStatement("select * from registration ");
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
			     user++;
			 }
			 rs.close();
	         ps.close();
			 con.close();
		 }
		     catch( Exception e ) { e.printStackTrace(); }
		     return user;
	     }
	 public static int news() 
		{
			int news = 0;
			try 
			{
				Connection con = NewsSellUtil.Getconnection();
				String sql = "select * from addnews ";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					news++;
				}
				rs.close();
				ps.close();
		        con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return news;
		}
	 public static boolean checkemail(String email) {
		 boolean flag = true;
		 if( UserDao.checkemail(email) == false) {
			 flag = false;
		 }
		 else if(BuyerDao.checkemail(email) == false) {
			 flag = false;
		 }
		 else if(AdminDao.checkemail(email) == false) {
			 flag = false;
		 }
		 return flag;		 
	 }
	 

}
