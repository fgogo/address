package ListHelper;

public class Context {
	private String name;
	private String picture;
	private String tellphone;
	private String Email;
	private String remark;
	private String fenzu;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getTellphone() {
		return tellphone;
	}
	public void setTellphone(String tellphone) {
		this.tellphone = tellphone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	public String getFenzu() {
		return fenzu;
	}
	public void setFenzu(String fenzu) {
		this.fenzu = fenzu;
	}
	public Context(String name,String picture,String tellphone,String Email,String remark,String fenzu){
		super();
		this.name=name;
		this.picture=picture;
		this.tellphone=tellphone;
		this.Email=Email;
		this.remark=remark;
		this.fenzu=fenzu;
	}
}
