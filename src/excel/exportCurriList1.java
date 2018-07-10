package excel;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

public class exportCurriList1 {
	
//	private List<String[]> yuangongList;
//	
//	
//
//
//	
//
//	public List<String[]> getYuangong() {
//		return yuangongList;
//	}
//
//	public void setYuangongList(List<String[]> yuangongList) {
//		this.yuangongList= yuangongList;  // ，
//	}

	
	public String export()throws Exception{
		
//		System.out.print(this.yuangongList);
		StoreToList stl=new StoreToList();
//		stl.getAllYuangong();
//		setYuangongList(stl.getAllYuangong());
		
		SetExcelText setExcel=new SetExcelText();
		setExcel.write(stl.getAllYuangong());
		
        
		
		return "success";
	}
    
}
