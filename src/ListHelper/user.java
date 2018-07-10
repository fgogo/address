package ListHelper;

public class user {
	private String user;
	private String password;
	private String tablename;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public user(String user,String password,String tablename){
		super();
		this.user=user;
		this.password=password;
		this.tablename=tablename;
	}
}
