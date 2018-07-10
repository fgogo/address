package excel;

public class AuxiliaryBean {

	
	private String name;
	private String picture;
	private String tellphone;
	private String Email;
	private String remark;
	private String fenzu;
	String []columnName;
	String [][]tableRecord=null;
	public AuxiliaryBean(){
		tableRecord=new String[1][1];
		columnName=new String[1];
	}
	
	
	public void setTableRecord(String[][]s){
		tableRecord=s;
	}
	public String [][]getTableRecord(){
		return tableRecord;
	}
	public void setColumnName(String []s){
		columnName=s;
	}
	public String []getColumnName(){
		return columnName;
	
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
	
}
