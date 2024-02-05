package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn() {
		try {
			// Load Driver class
			Class.forName("com.mysql.jdbc.Driver");
			// Establish Connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","721135");
			
			System.out.println(conn);
		}catch(Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		return conn;
	}
}
