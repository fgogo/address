<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加联系人</title>
    
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
  <s:form action="newcontext" method="post">      
       <s:textfield name="name"  label="姓名"/>    
       <s:textfield type="hidden" name="picture" value="1499222944787.png"/>
       <s:textfield name="tellphone" label="电话"/>
       <s:textfield name="email" label="邮箱"/>
       <s:textfield name="remark" label="备注"/>
       <s:textfield type="hidden" name="tablename" value="%{#session.tablename}"/>
       <label>分组:</label><s:radio name="fenzu" list="%{#{'家人':'家人','同事':'同事','同学':'同学'}}" value="1" theme="simple"></s:radio>
       <s:submit value="新增" /> 
       </s:form>
       <a href="tongxunlu/welcome.jsp">返回</a>
  </body>
</html>
