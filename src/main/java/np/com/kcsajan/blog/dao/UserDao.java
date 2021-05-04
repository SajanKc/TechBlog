package np.com.kcsajan.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import np.com.kcsajan.blog.entities.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean addUser(User user) {
		boolean status = false;
		try {
			String query = "INSERT INTO user(username,email,password,gender,about,registered_at) VALUES(?,?,?,?,?,now())";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getGender());
			stmt.setString(5, user.getAbout());

			stmt.executeUpdate();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
