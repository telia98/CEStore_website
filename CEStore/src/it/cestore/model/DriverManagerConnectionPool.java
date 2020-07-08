package it.cestore.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverManagerConnectionPool {
	
	public static Connection createDBConnection() throws SQLException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) {
			System.out.println("DB driver not found!" + e);
		}
		
		Connection newConnection = null;
		String ip = "localhost";
		String port = "3306";
		String db = "e_commerce_abbigliamento";
		String username = "root";
		String password = "grazie2017";

		String url="jdbc:mysql://" + ip + ":" + port + "/" + db + "?serverTimezone=UTC";
		newConnection = DriverManager.getConnection(url, username, password);
		
		System.out.println("Connessione stabilita");
		
		return newConnection;
	}

	public static synchronized void releaseConnection(Connection connection) throws SQLException {
		
		if (connection != null) {
			connection.close();
			connection = null;
		}
	}
}