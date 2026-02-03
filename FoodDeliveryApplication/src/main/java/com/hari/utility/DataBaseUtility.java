package com.hari.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseUtility {
	
	static Connection connection;
	
	
	public static Connection getConnection() {

		 try {
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Read from Environment Variables
	            String url = System.getenv("DB_URL");
	            String username = System.getenv("DB_USER");
	            String password = System.getenv("DB_PASSWORD");

	            if (url == null || username == null || password == null) {
	                throw new RuntimeException("Database environment variables not set");
	            }

	            connection = DriverManager.getConnection(url, username, password);
	            System.out.println("Database Connected Successfully");

	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
		
		return connection;
	}
	
	

}