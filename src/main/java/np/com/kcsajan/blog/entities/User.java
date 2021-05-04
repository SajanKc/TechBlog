package np.com.kcsajan.blog.entities;

public class User {

	private int uid;
	private String username;
	private String email;
	private String password;
	private String gender;
	private String about;

	public User() {
	}

	public User(int uid, String username, String email, String password, String gender, String about) {
		this.uid = uid;
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

	public User(String username, String email, String password, String gender, String about) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}
}
