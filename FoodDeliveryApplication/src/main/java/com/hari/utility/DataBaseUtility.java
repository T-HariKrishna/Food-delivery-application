package com.hari.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseUtility {
	
	static Connection connection;
	private static final String URL="jdbc:mysql://localhost:3306/food_delivery_project";
	private static final String USERNAME="root";
	private static final String PASSWORD="root@123";
	
	
	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			System.out.println("Driver found");
			connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} catch (ClassNotFoundException  |SQLException e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	

}