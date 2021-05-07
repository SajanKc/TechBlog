package np.com.kcsajan.blog.entities;

public class Category {
	private int catId;
	private String catName;
	private String catDescription;

	public Category() {
	}

	public Category(int catId, String catName, String catDescription) {
		this.catId = catId;
		this.catName = catName;
		this.catDescription = catDescription;
	}

	public Category(String catName, String catDescription) {
		this.catName = catName;
		this.catDescription = catDescription;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getCatDescription() {
		return catDescription;
	}

	public void setCatDescription(String catDescription) {
		this.catDescription = catDescription;
	}

}
