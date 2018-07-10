package excel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class StoreToList {
	
	public List<String[]> getAllYuangong() throws Exception{
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){
			System.out.println(e);
		}
		
		Connection con;
		PreparedStatement sql;
		ResultSet rs = null;
		
		List<String[]> contextList = new ArrayList<String[]>();
		
		
		
		try{
	    	String url="jdbc:mysql://localhost:3306/adress?useUnicode=true&characterEncoding=UTF-8";
			String user="root";
			String password="123456";
			con=DriverManager.getConnection(url,user,password);
			
			
			ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
		    String tablename=(String)session.get("tablename");
		    
			sql=con.prepareStatement("select * from "+tablename+" ");
			rs=sql.executeQuery();
	
	
			while (rs.next()) {
				String[] row = new String[6];
				row[0] = rs.getString("name");
				row[1] = rs.getString("picture");
				row[2] = rs.getString("tellphone");
				row[3]=rs.getString("email");
				row[4]= rs.getString("remark");
				row[5]= rs.getString("fenzu");
				
				contextList.add(row);
				

			}	
	}catch(Exception e){
		System.out.println(e);
	    }
		
	return contextList;
		
	}

}
