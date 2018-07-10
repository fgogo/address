package txlglxt;

import java.io.*;
import java.util.Date;
import org.apache.struts2.ServletActionContext;

import SQLHelper.SQLCon;
import com.opensymphony.xwork2.ActionSupport;

public class newcontext extends ActionSupport{
	private String name;
	private String picture;
	private String tellphone;
	private String Email;
	private String remark;
	private String fenzu;
	private String tablename;
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
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
	public String execute() throws Exception{ 
		new SQLCon();
		String sql="insert into "+tablename+" values("
				+ "'"+name+"','"+picture+"','"+tellphone+"',"
				+ "'"+Email+"','"+remark+"','"+fenzu+"')";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
        return SUCCESS;  
        
		}

}
