<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>The FileUplaodDemo In Struts2</title>
</head>
<% String astrictname=request.getParameter("name");
   session.setAttribute("astrictname", astrictname);
 %>
<body>
<s:form action="fileUpload" method="post" enctype="multipart/form-data" namespace="/">
<s:file name="myFile" label="选择图片" ></s:file>
<s:textfield type="hidden" name="astrictname" value="%{#session.astrictname}"></s:textfield>
<s:submit value="上传"></s:submit>
</s:form>
<input type="button" onclick="location='welcome.jsp'" value="返回">
</body>
</html>