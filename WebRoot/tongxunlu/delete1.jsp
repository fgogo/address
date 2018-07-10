<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>彻底删除联系人</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <% String name=request.getParameter("name");
     session.setAttribute("name", name);
   %>
  <body>
    <s:form action="delete1" method="post">
    <s:textfield type="hidden" name="name" value="%{#session.name}"></s:textfield>
    <s:textfield type="hidden" name="trashname" value="%{#session.trashname}"></s:textfield>
    </s:form>
    <script>
document.delete1.submit();
</script>
  </body>
</html>
