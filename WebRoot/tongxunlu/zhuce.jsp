<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>  
<html>
<head>
</head>
<body>
<s:form action="zhuce" method="post">
      <s:textfield name="username" placeholder="请输入用户名" label="账号" />
      <s:password name="password"  placeholder="请输入密码" label="密码" />
      <s:password name="password1" placeholder="请再次输入密码"  label="确认密码"/>
      <s:submit id="log_submit" value="注册"/>
      <s:a href="login.html">返回</s:a>
</s:form>
</body>
</html>