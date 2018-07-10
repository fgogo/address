package txlglxt;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import ListHelper.Context;
import SQLHelper.SQLCon;
public class trashAction extends ActionSupport{
	private String trashname;

	public String getTrashname() {
		return trashname;
	}

	public void setTrashname(String trashname) {
		this.trashname = trashname;
	}
	public String execute() throws Exception{
		return SUCCESS;
	}
}
