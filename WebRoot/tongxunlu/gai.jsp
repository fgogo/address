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
    
    <title>修改</title>
    
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
<% try{
            String tablename=(String)session.getAttribute("tablename");
            String Aname=request.getParameter("name");
			List<Context> ContextList=new ArrayList<Context>();
			new SQLCon();
			String sql="select *from "+tablename+" where name='"+Aname+"'";
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
		<strong><font size="6" >欢迎进入修改页面</font></strong>
		
  <s:form action="update" method="post">
  <s:iterator value="#request.contextlist" var="mycontent" status="status"> 
  <s:textfield  label="姓名" name="name" value="%{#mycontent.name}" readonly="true"></s:textfield>
  <s:textfield  type="hidden" name="picture" value="%{#mycontent.picture}"></s:textfield>
  <s:textfield  label="电话" name="tellphone" value="%{#mycontent.tellphone}"></s:textfield>
  <s:textfield  label="电子邮箱" name="email" value="%{#mycontent.email}"></s:textfield>
  <s:textfield  label="备注" name="remark" value="%{#mycontent.remark}"></s:textfield>
  <s:textfield  label="分组" name="fenzu" value="%{#mycontent.fenzu}" readonly="true"></s:textfield>
  <s:textfield type="hidden" name="tablename" value="%{#session.tablename}"></s:textfield>
  <s:submit value="修改"/>
  </s:iterator></s:form>
  <input type="button" onclick="location='tongxunlu/welcome.jsp'" value="返回">

  </body>
</html>
