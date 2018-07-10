package txlglxt;

import java.util.Map;

import SQLHelper.SQLCon;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class deleteAction extends ActionSupport{
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
	private String tablename;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String execute()throws Exception{
		new SQLCon();
		String sql="delete from "+tablename+" where name='"+name+"'";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        String trashname=(String)session.get("trashname");
        String sql1="insert into "+trashname+" values('"+name+"','"+picture+"',"
        		+ "'"+tellphone+"','"+email+"','"+remark+"','"+fenzu+"')";
        SQLCon.getConnection().createStatement().executeUpdate(sql1);
		SQLCon.CloseCon();
		return SUCCESS;
	}
}
