package excel;

import java.io.*;
import java.sql.*;
import java.util.*;

import org.apache.poi.hssf.usermodel.*;
import com.opensymphony.xwork2.ActionContext;

public class GetExcelText {
	String filePath="/UploadExcel";
	//@SuppressWarnings("deprecation")
	private List<String[]> getExcel(String filePath) {
		List<String[]> list = new ArrayList<String[]>();
		String[] arr = null;
		try {
		    //解析excel，把数据封装成List<AuxiliaryBean>
			HSSFWorkbook wb  = new HSSFWorkbook(new FileInputStream(new File(filePath)));
		    for(int sheets = 0;sheets<wb.getNumberOfSheets();sheets++){
		    	HSSFSheet sheet = wb.getSheetAt(sheets);
		        for (int j = 1; j <= sheet.getLastRowNum(); j++) {///Gets the number last row on the sheet
		            HSSFRow row = sheet.getRow(j);
		            int l = row.getLastCellNum();
		            arr = new String[l + 1];
		            for (int i = 0; i < l; i++) {
		            	HSSFCell cell = row.getCell(i);
		            	if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
		                    arr [i] = String.valueOf((long)cell.getNumericCellValue());
		                }else {
		                    arr[i] = cell.getRichStringCellValue().toString();
		                }
		            }
		            list.add(arr);
		         }
		    }
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<AuxiliaryBean> initStuInfo(String filePath) {
		boolean sign = false;
		String[] arr = null;
		AuxiliaryBean sb = null;
		List<String[]> list = new ArrayList<String[]>();
		List<AuxiliaryBean> insertList = new ArrayList<AuxiliaryBean>();
		list = this.getExcel(filePath);
		ActionContext actionContext = ActionContext.getContext();
	    Map session = actionContext.getSession();
		String tablename=(String)session.get("tablename");
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){
			System.out.println(e);
		}
		Connection con;
		PreparedStatement sql; 
		try{
			String url="jdbc:mysql://localhost:3306/adress?useUnicode=true&characterEncoding=UTF-8";
			String user="root";
		    String pass="123456";
		    con = DriverManager.getConnection(url, user, pass);
			for (int i = 0; i < list.size(); i++) {
				arr = list.get(i);
			    sb = new AuxiliaryBean();
			    sb.setName(arr[0]);
			    sb.setPicture(arr[1]);
			    sb.setTellphone(arr[2]);
			    sb.setEmail(arr[3]);
			    sb.setRemark(arr[4]);
			    sb.setFenzu(arr[5]);
 
			    sql=con.prepareStatement("insert into "+tablename+" values(?,?,?,?,?,?)");
			        
			    sql.setString(1, sb.getName());
			    sql.setString(2, sb.getPicture());
			    sql.setString(3, sb.getTellphone());
			    sql.setString(4, sb.getEmail());
			    sql.setString(5, sb.getRemark());
			    sql.setString(6, sb.getFenzu());
			        
			    sql.executeUpdate();
			    sql.close();
			    insertList.add(sb);
			}
		}catch(SQLException e){
			System.out.println(e);
		}
		return insertList;
	}	
		
}


