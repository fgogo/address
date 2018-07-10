package txlglxt;

import java.sql.ResultSet;
import java.sql.SQLException;

import SQLHelper.SQLCon;

import com.opensymphony.xwork2.ActionSupport;

public class zhuce extends ActionSupport{
	private String username;
	private String password;
	private String password1;
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
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
		boolean flag=Login(username);
		if(flag){
			insert(username,password,tablename);
			Createtable(tablename);
			characterset(tablename);
			Createtable(trashname);
			characterset(trashname);
			return SUCCESS;
		}
		return ERROR;
	}
	public boolean Login(String username) throws SQLException {
		boolean flag=true;
		try{
			new SQLCon();
			String sql="select * from administrator where user='"+username+"'";
			ResultSet rs=null;
			rs=SQLCon.getConnection().createStatement().executeQuery(sql);
			if(rs.next()){
					if(username.equals(rs.getString("user"))){
						flag=false;
					}
				}
			SQLCon.CloseCon();
		}catch(Exception e){
			System.out.print("新建连接失败");
			e.printStackTrace();
		}
		return flag;
	}
	public void Createtable(String tablename)throws SQLException{
		try{
			new SQLCon();
			String sql="create table "+tablename+"("
					+ "name char(15) NOT NULL,"
					+ "picture varchar(50),"
					+ "tellphone char(11) unique not null,"
					+ "email varchar(15),"
					+ "remark varchar(20),"
					+ "fenzu char(10) not null"
					+ ")";
			SQLCon.getConnection().createStatement().executeUpdate(sql);
			SQLCon.CloseCon();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void characterset(String tablename){
		try{
			new SQLCon();
			String sql="alter table "+tablename+" change name name char(15) character set utf8";
			String sql1="alter table "+tablename+" change picture picture varchar(50) character set utf8";
			String sql2="alter table "+tablename+" change tellphone tellphone char(11) character set utf8";
			String sql3="alter table "+tablename+" change email email varchar(15) character set utf8";
			String sql4="alter table "+tablename+" change remark remark varchar(20) character set utf8";
			String sql5="alter table "+tablename+" change fenzu fenzu char(10) character set utf8";
			SQLCon.getConnection().createStatement().executeUpdate(sql);
			SQLCon.getConnection().createStatement().executeUpdate(sql1);
			SQLCon.getConnection().createStatement().executeUpdate(sql2);
			SQLCon.getConnection().createStatement().executeUpdate(sql3);
			SQLCon.getConnection().createStatement().executeUpdate(sql4);
			SQLCon.getConnection().createStatement().executeUpdate(sql5);
			SQLCon.CloseCon();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void insert(String user,String password,String tablename){
		try{
			new SQLCon();
			String sql="insert into administrator values('"+user+"','"+password+"','"+tablename+"')";
			SQLCon.getConnection().createStatement().executeUpdate(sql);
			SQLCon.CloseCon();
		}catch(Exception e){
			e.printStackTrace();
			}
	}
}
