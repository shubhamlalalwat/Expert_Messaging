//    Author     : Prateek Haryani

package dto;


public class Customer {

	private String id;
	private String password;
	private String firstName;
	private String lastName;
	private String mobileNumber;
	private boolean verified;
	private boolean blocked;
	
	// Getter And Setter Automatic  --------------------------------------------------------
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public boolean isVerified() {
		return verified;
	}
	public void setVerified(boolean verified) {
		this.verified = verified;
	}
	public boolean isBlocked() {
		return blocked;
	}
	public void setBlocked(boolean blocked) {
		this.blocked = blocked;
	}
	
	
	// For registerCustomer------------------------------------------------------------------------------------------------------------------
	
	public Customer(String id, String password, String firstName, String lastName, String mobileNumber , boolean verified , boolean blocked)
	{
		this.id = id;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNumber = mobileNumber;
		this.verified = verified;
		this.blocked = blocked;
	}
	
	// For checkCustomerCredentials ------------------------------------------------------------------------
	public Customer(String id, String password)
	{
		this.id = id;
		this.password = password;
	}
	// For jsp usebean used in db_register.jsp
	public Customer() {}
	
}
