package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class NewsSellUtil {
	public static Connection Getconnection() {
		 Connection con = null;
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost/newssell","root","");
		 }
		 catch(Exception e) {  e.printStackTrace(); }
		 return con;
	     }
}
