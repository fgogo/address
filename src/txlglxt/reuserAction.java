package txlglxt;

import com.opensymphony.xwork2.ActionSupport;
import SQLHelper.SQLCon;

public class reuserAction extends ActionSupport{
	private String name;
	private String picture;
	private String tellphone;
	private String email;
	private String remark;
	private String fenzu;
	private String trashname;
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
	public String getTrashname() {
		return trashname;
	}
	public void setTrashname(String trashname) {
		this.trashname = trashname;
	}
	public void reuse(String trashname,String name,String picture,String tellphone,String email,
			String remark,String fenzu) throws Exception{
		new SQLCon();
		String sql="insert into "+trashname+" values('"+name+"','"+picture+"','"+tellphone+"',"
				+ "'"+email+"','"+remark+"','"+fenzu+"')";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
		SQLCon.CloseCon();
	}
	public void delete(String trashname,String name) throws Exception{
		new SQLCon();
		String sql="delete from "+trashname+" where name='"+name+"'";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
		SQLCon.CloseCon();
	}
	public String execute() throws Exception{
		reuse(tablename,name,picture,tellphone,email,remark,fenzu);
		delete(trashname,name);
		return SUCCESS;
	}
}
