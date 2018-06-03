package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DButil {
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		String url = "jdbc:mysql://localhost/itwen?characterEncoding=utf-8";
		String user = "root";
		String pd = "";
		Connection conn = null;

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pd);
		return conn;
	}
	
}
