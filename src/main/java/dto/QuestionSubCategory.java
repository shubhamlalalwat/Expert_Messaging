//    Author     : Prateek Haryani
package dto;

public class QuestionSubCategory {
	
	private int id;
	private String subCategoryName;
	private int categoryID;
	
	// Getter And Setter Automatic  --------------------------------------------------------

	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
}
