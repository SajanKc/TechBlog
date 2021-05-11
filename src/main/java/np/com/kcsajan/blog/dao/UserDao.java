package np.com.kcsajan.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "SELECT * FROM user WHERE EMAIL=? AND PASSWORD=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, password);

			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				user = new User();

				user.setUid(result.getInt("uid"));

				user.setUsername(result.getString("username"));
				user.setPassword(result.getString("password"));
				user.setEmail(result.getString("email"));
				user.setGender(result.getString("gender"));
				user.setAbout(result.getString("about"));
				user.setProfile(result.getString("profile"));
				user.setRegisteredDate(result.getTimestamp("registered_at"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public User getUserById(int uid) {
		User user = null;
		try {
			String query = "SELECT * FROM user WHERE uid=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, uid);

			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				user = new User();

				user.setUid(result.getInt("uid"));

				user.setUsername(result.getString("username"));
				user.setPassword(result.getString("password"));
				user.setEmail(result.getString("email"));
				user.setGender(result.getString("gender"));
				user.setAbout(result.getString("about"));
				user.setProfile(result.getString("profile"));
				user.setRegisteredDate(result.getTimestamp("registered_at"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {
		boolean status = false;
		try {
			String query = "UPDATE user SET username=?, email=?, password=?, about=?, gender=?, profile=? WHERE uid=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getAbout());
			stmt.setString(5, user.getGender());
			stmt.setString(6, user.getProfile());
			stmt.setInt(7, user.getUid());
			stmt.executeUpdate();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
