<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@ page import="java.util.List,java.util.ArrayList,
                SQLHelper.SQLCon,ListHelper.Context,
                java.sql.ResultSet,org.apache.struts2.ServletActionContext" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  try{
            String reusename=request.getParameter("name");
            String trashname=(String)session.getAttribute("trashname");
			List<Context> ContextList=new ArrayList<Context>();
			new SQLCon();
			String sql="select * from "+trashname+" where name='"+reusename+"'";
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>恢复</title>
    
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
    <s:iterator value="#request.trashbinlist" var="mytrash" status="status">
    <s:form action="reuse" method="post">
    <s:textfield type="hidden" name="name" value="%{#mytrash.name}"></s:textfield>
    <s:textfield type="hidden" name="picture" value="%{#mytrash.picture}"></s:textfield>
    <s:textfield type="hidden" name="tellphone" value="%{#mytrash.tellphone}"></s:textfield>
    <s:textfield type="hidden" name="email" value="%{#mytrash.email}"></s:textfield>
    <s:textfield type="hidden" name="remark" value="%{#mytrash.remark}"></s:textfield>
    <s:textfield type="hidden" name="fenzu" value="%{#mytrash.fenzu}"></s:textfield>
    <s:textfield type="hidden" name="trashname" value="%{#session.trashname}"></s:textfield>
    <s:textfield type="hidden" name="tablename" value="%{#session.tablename}"></s:textfield>
    </s:form>
    </s:iterator>
        <script>
document.reuse.submit();
</script>
  </body>
</html>
