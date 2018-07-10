package txlglxt;

import com.opensymphony.xwork2.ActionSupport;
import SQLHelper.SQLCon;
public class updatepicture extends ActionSupport{
	private String tablename;
	private String astrictname;
	private String imageFileName;
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getAstrictname() {
		return astrictname;
	}
	public void setAstrictname(String astrictname) {
		this.astrictname = astrictname;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String execute() throws Exception{
		new SQLCon();
		String sql="update "+tablename+" set picture='"+imageFileName+"' where name='"+astrictname+"'";
		SQLCon.getConnection().createStatement().executeUpdate(sql);
		SQLCon.CloseCon();
		return SUCCESS;
	}
}
