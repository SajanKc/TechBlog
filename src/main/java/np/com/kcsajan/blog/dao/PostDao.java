package np.com.kcsajan.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import np.com.kcsajan.blog.entities.Category;
import np.com.kcsajan.blog.entities.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> catList = new ArrayList<>();
		try {
			String query = "SELECT * FROM category";
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(query);
			while (result.next()) {
				int cat_id = result.getInt("cat_id");
				String cat_name = result.getString("cat_name");
				String cat_description = result.getString("cat_description");
				Category cat = new Category(cat_id, cat_name, cat_description);
				catList.add(cat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return catList;
	}

	public boolean addPost(Post post) {
		boolean status = false;
		try {
			String post_title = post.getpTitle();
			String post_content = post.getpContent();
			String post_code = post.getpCode();
			String post_image = post.getpImage();
			int cat_id = post.getCatId();
			int user_id = post.getUserId();

			String query = "INSERT INTO post(post_title,post_content,post_code,post_image,cat_id,user_id) VALUES(?,?,?,?,?,?)";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, post_title);
			stmt.setString(2, post_content);
			stmt.setString(3, post_code);
			stmt.setString(4, post_image);
			stmt.setInt(5, cat_id);
			stmt.setInt(6, user_id);

			stmt.executeUpdate();
			status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<Post> getPost() {
		List<Post> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM post ORDER BY post_id DESC";
			PreparedStatement stmt = this.con.prepareStatement(query);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				int postId = result.getInt("post_id");
				String postTitle = result.getString("post_title");
				String postContent = result.getString("post_content");
				String postCode = result.getString("post_code");
				String postImage = result.getString("post_image");
				Timestamp postDate = result.getTimestamp("post_date");
				int catId = result.getInt("cat_id");
				int userId = result.getInt("user_id");
				Post post = new Post(postId, postTitle, postContent, postCode, postImage, postDate, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Post> getPostByCategory(int catId) {
		List<Post> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM post WHERE cat_id=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, catId);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				int postId = result.getInt("post_id");
				String postTitle = result.getString("post_title");
				String postContent = result.getString("post_content");
				String postCode = result.getString("post_code");
				String postImage = result.getString("post_image");
				Timestamp postDate = result.getTimestamp("post_date");
				int userId = result.getInt("user_id");
				Post post = new Post(postId, postTitle, postContent, postCode, postImage, postDate, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
