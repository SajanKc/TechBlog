package np.com.kcsajan.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

	private Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean status = false;
		try {
			String query = "INSERT INTO likes(pid,uid) VALUES(?,?)";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;
		try {
			String query = "SELECT COUNT(*) as count FROM likes WHERE pid=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				count = result.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean status = false;
		try {
			String query = "SELECT * FROM likes WHERE pid=? AND uid=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public boolean removeLike(int pid, int uid) {
		boolean status = false;
		try {
			String query = "DELETE FROM likes WHERE pid=? AND uid=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
