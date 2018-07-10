<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@ page import="java.util.List,java.util.ArrayList,
                SQLHelper.SQLCon,ListHelper.Context,
                java.sql.ResultSet,org.apache.struts2.ServletActionContext" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% try{
            String tablename=(String)session.getAttribute("tablename");
            String group=(String)session.getAttribute("fenzu");
			List<Context> ContextList=new ArrayList<Context>();
			new SQLCon();
			String sql="select *from "+tablename+" where fenzu='"+group+"'";
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
	        Request.setAttribute("serchlist", ContextList); 
	        SQLCon.CloseCon();
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
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
          <s:iterator value="#request.serchlist" var="mycontent" status="status">  
       <tr>
       <td>
        <s:property value="#mycontent.name"/><br>
        </td>
        <td>
        <img src="tongxunlu/UploadImages/<s:property value ="#mycontent.picture"/>" width="80px" height="100px" /><br>
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
        <td><a href="tongxunlu/gai.jsp?name=${mycontent.name}&tablename=${session.tablename}">修改</a>
        <a href="tongxunlu/del.jsp?name=${mycontent.name}&tablename=${session.tablename}">删除</a>
        <a href="tongxunlu/FileUpload.jsp?name=${mycontent.name}&tablename=${session.tablename}">上传或修改图片</a>
        </td>	
        </tr>
        </s:iterator>
         </table>
         <input type="button" value="返回" onclick="location='tongxunlu/welcome.jsp'">
  </body>
</html>
