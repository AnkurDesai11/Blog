package com.blog.helper;

import java.sql.*;

public class ConnectionProvider {
	
	private static Connection con;
	public static Connection getConnection() {
		
		try {
			
			//driver class loading
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//create connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/db_blog","root","#learningjourney");
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}
	
}
