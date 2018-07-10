package txlglxt;

import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import ListHelper.Context;
import SQLHelper.SQLCon;
import ListHelper.user;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class LoginAction extends ActionSupport{
	private String username;
	private String password;                                                                          
	public LoginAction(){
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String execute() throws Exception{
		String a="list";
		String b="trash";
		String tablename=a+username;
		String trashname=b+username;
	    ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("tablename",tablename); //会话
        session.put("trashname",trashname);
		boolean flag=Login( username , password );
		if( flag ){
			return SUCCESS;
			}
		else
			return ERROR;
	}
	public boolean Login(String username,String password) throws SQLException {
		boolean flag=false;
		try{
			new SQLCon();
			String sql="select * from administrator where user='"+username+"'and password='"+password+"'";
			ResultSet rs=null;
			rs=SQLCon.getConnection().createStatement().executeQuery(sql);
			if(rs.next()){
					if(username.equals(rs.getString("user")) && password.equals(rs.getString("password"))){
						flag=true;
					}
				}
			SQLCon.CloseCon();
		}catch(Exception e){
			System.out.print("新建连接失败");
			e.printStackTrace();
		}
		return flag;
		
	}
	public void Serch(String tablename){
		try{
			List<Context> ContextList=new ArrayList<Context>();
			new SQLCon();
			String sql="select *from "+tablename+"";
			ResultSet rs=null;
			rs=SQLCon.getConnection().createStatement().executeQuery(sql);
			while(rs.next()){
			 String name=rs.getString("name");
			 String picture=rs.getString("picture");
			 String tellphone=rs.getString("tellphone");
			 String Email=rs.getString("Email");
			 String remark=rs.getString("remark");
			 String fenzu=rs.getString("fenzu");
			 Context temp=new Context(name,picture,tellphone,Email,remark,fenzu);
			 ContextList.add(temp);
			}
			HttpServletRequest request = ServletActionContext.getRequest();  
	        request.setAttribute("contextlist", ContextList); 
	        SQLCon.CloseCon();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
