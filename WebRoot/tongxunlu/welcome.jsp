<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@taglib prefix="s" uri="/struts-tags"%>  
<%@ page import="java.util.List,java.util.ArrayList,
                SQLHelper.SQLCon,ListHelper.Context,
                java.sql.ResultSet,org.apache.struts2.ServletActionContext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>联系人列表</title>  
</head>  
<% try{
            String tablename=(String)session.getAttribute("tablename");
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
			HttpServletRequest Request = ServletActionContext.getRequest();  
	        Request.setAttribute("contextlist", ContextList); 
	        SQLCon.CloseCon();
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
<body>   
 <table border="2">
       <tr>
       <th><%out.print("姓名");%></th>
       <th><% out.print("图片");%></th>
       <th><% out.print("电话"); %></th>
       <th><% out.print("电子邮箱"); %></th>
        <th><% out.print("备注"); %></th>
         <th><% out.print("分组"); %></th>
         <th><% out.print("操作"); %></th>
       </tr>
       <s:iterator value="#request.contextlist" var="mycontent" status="status">  
       <tr>
       <td>
        <s:property value="#mycontent.name"/><br>
        </td>
        <td>
        <img src="UploadImages/<s:property value ="#mycontent.picture"/>" width="80px" height="100px" /><br>
        </td>
        <td>
        <s:property value="#mycontent.tellphone"/><br>
        </td>
        <td>
        <s:property value="#mycontent.email"/><br>
        </td>
        <td>
        <s:property value="#mycontent.remark"/><br>
        </td>
        <td>
        <s:property value="#mycontent.fenzu"/><br>
        </td>	
        <td><a href="gai.jsp?name=${mycontent.name}&tablename=${session.tablename}">修改</a>
        <a href="del.jsp?name=${mycontent.name}&tablename=${session.tablename}">删除</a>
        <a href="FileUpload.jsp?name=${mycontent.name}&tablename=${session.tablename}">上传或修改图片</a>
        </td>
        </tr>    
    </s:iterator></table>  
    <input type="button" onclick="location='new.jsp'" value="添加联系人">
    <input type="button" onclick="location='group.jsp'" value="分组查询">
    <input type="button" onclick="location='trashbin.jsp'" value="回收站">
    <input type="button" onclick="location='import.jsp'" value="导入联系人">
    <input type="button" onclick="location='export.jsp'" value="导出联系人">
    <s:a href="exportexcel">导出</s:a>
    <input type="button" onclick="location='login.html'" value="注销">
</body>  
</html>  