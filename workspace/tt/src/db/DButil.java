package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DButil {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost/itwen?characterEncoding=utf-8";
		String user = "root";
		String pd = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, pd);
		return conn;
	}
	
}
