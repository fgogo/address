package txlglxt;

import com.opensymphony.xwork2.ActionSupport;
import SQLHelper.SQLCon;
public class delete1Action extends ActionSupport{
	private String name;
	private String trashname;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTrashname() {
		return trashname;
	}
	public void setTrashname(String trashname) {
		this.trashname = trashname;
	}
	public String execute() throws Exception{
		new SQLCon();
		String sql="delete from "+trashname+" where name='"+name+"'";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
		SQLCon.CloseCon();
		return SUCCESS;
	}
}
