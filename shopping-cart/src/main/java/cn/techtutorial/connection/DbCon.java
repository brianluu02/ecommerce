package cn.techtutorial.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//connection = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/EWRRX7sJQL", "EWRRX7sJQL", "r23irMGwNn");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "123456");
			System.out.print("connected");
		}
		return connection;
	}
}
// Database info on remotemysql.com
//User name: EWRRX7sJQL
//Database name: EWRRX7sJQL
//Password: r23irMGwNn
//Server: remotemysql.com
//Port: 3306