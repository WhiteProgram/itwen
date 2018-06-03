package doman;

public class User {
	private int id;
	private String accountName;
	private String accountPasswd;
	private String tel;
	private String trueName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountPasswd() {
		return accountPasswd;
	}
	public void setAccountPasswd(String accountPasswd) {
		this.accountPasswd = accountPasswd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
}
