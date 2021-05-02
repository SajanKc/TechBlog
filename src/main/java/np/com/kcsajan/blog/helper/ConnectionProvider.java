package np.com.kcsajan.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getCon() {
		try {
			if (con == null) {
				String url = "jdbc:mysql://localhost:3306/techblog?serverTimezone=UTC";
				String username = "root";
				String pwd = "MySql@123";
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(url, username, pwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
