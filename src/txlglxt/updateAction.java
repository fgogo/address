package txlglxt;

import SQLHelper.SQLCon;

import com.opensymphony.xwork2.ActionSupport;

public class updateAction extends ActionSupport{
	private String tablename;
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	private String name;
	private String picture;
	private String tellphone;
	private String email;
	private String remark;
	private String fenzu;
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
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String execute() throws Exception{
		new SQLCon();
		String sql="update "+tablename+" set picture='"+picture+"',tellphone='"+tellphone+"',"
				+ "email='"+email+"',remark='"+remark+"',fenzu='"+fenzu+"' where name='"+name+"'";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
		SQLCon.CloseCon();
		return SUCCESS;
	}
}
