package SQLHelper;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.SQLException;

public class SQLCon {
	
	private static Connection conn=null;
	String url="jdbc:mysql://localhost:3306/adress?useUnicode=true&characterEncoding=UTF-8";
	String user="root";
	String password="123456";
	
	public SQLCon() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url, user, password);
	}
	
	public static Connection getConnection(){
		return conn;
	}
	
	public static void CloseCon() throws SQLException{
		conn.close();
	}

}
