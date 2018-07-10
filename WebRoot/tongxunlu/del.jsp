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
    <title>删除联系人</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <% try{
            String tablename=(String)session.getAttribute("tablename");
            String contextname=request.getParameter("name");
			List<Context> ContextList=new ArrayList<Context>();
			new SQLCon();
			String sql="select *from "+tablename+" where name='"+contextname+"'";
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
       </tr>
       <s:iterator value="#request.contextlist" var="mycontent" status="status">  
       <tr>
       <td>
        <s:property value="#mycontent.name"/><br>
        </td>
        <td>
        <s:property value="#mycontent.picture"/><br>
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
        </tr>
        </s:iterator>
        <s:form action="delete">
        <s:textfield type="hidden" name="name" value="%{#mycontent.name}"></s:textfield>
        <s:textfield type="hidden" name="picture" value="%{#mycontent.picture}"/>
        <s:textfield type="hidden" name="tellphone" value="%{#mycontent.tellphone}"/>
        <s:textfield type="hidden" name="email" value="%{#mycontent.email}"/>
        <s:textfield type="hidden" name="remark" value="%{#mycontent.remark}"/>
        <s:textfield type="hidden" name="fenzu" value="%{#mycontent.fenzu}"/>
        <s:textfield type="hidden" name="tablename" value="%{#session.tablename}"/>
        <s:submit value="确认删除"/>
        </s:form>
        </table>
  <input type="button" onclick="location='tongxunlu/welcome.jsp'" value="返回">
  </body>
</html>
