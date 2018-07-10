<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@ page import="java.util.List,java.util.ArrayList,
                SQLHelper.SQLCon,ListHelper.Context,
                java.sql.ResultSet,org.apache.struts2.ServletActionContext" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>回收站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
  try{
            String trashname=(String)session.getAttribute("trashname");
			List<Context> ContextList=new ArrayList<Context>();
			new SQLCon();
			String sql="select * from "+trashname+"";
			ResultSet rs=SQLCon.getConnection().createStatement().executeQuery(sql);
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
	        Request.setAttribute("trashbinlist", ContextList); 
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
       <s:iterator value="#request.trashbinlist" var="mytrash" status="status">  
       <tr>
       <td>
        <s:property value="#mytrash.name"/><br>
        </td>
        <td>
        <img src="tongxunlu/UploadImages/<s:property value ="#mytrash.picture"/>" /><br>
        </td>
        <td>
        <s:property value="#mytrash.tellphone"/><br>
        </td>
        <td>
        <s:property value="#mytrash.email"/><br>
        </td>
        <td>
        <s:property value="#mytrash.remark"/><br>
        </td>
        <td>
        <s:property value="#mytrash.fenzu"/><br>
        </td>
        <td>
        <a href="tongxunlu/delete1.jsp?trashname=${session.trashname }&name=${mytrash.name }">彻底删除</a>
        <a href="tongxunlu/reuse.jsp?trashname=${session.trashname }&name=${mytrash.name }">恢复</a>
        </td>
        </tr>
        </s:iterator>
        </table>
        <input type="button" onclick="location='tongxunlu/welcome.jsp'" value="返回">
  </body>
</html>
