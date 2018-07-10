package txlglxt;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import ListHelper.Context;
import SQLHelper.SQLCon;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class groupserchAction extends ActionSupport {
	private String fenzu;

	public String getFenzu() {
		return fenzu;
	}

	public void setFenzu(String fenzu) {
		this.fenzu = fenzu;
	}
	public String execute() throws Exception{
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("fenzu", fenzu);
		return SUCCESS;

	}
}
