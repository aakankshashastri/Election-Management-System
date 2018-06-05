package com.amazon.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;

class ConnectionFactory {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");//("jdbc:mysql://localhost:3306/Cabriolet1","root","rajula");
			//

		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}

		return connection;
	}
}





