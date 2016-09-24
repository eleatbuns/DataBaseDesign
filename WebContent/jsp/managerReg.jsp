<%@page import="operation.registerImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String namagerId=request.getParameter("managerId");
		String managerName=request.getParameter("managerName");
		String password=request.getParameter("managerPwd");
		
		int a=new registerImp().insert(namagerId,managerName,password,"1");
		if(a==1){
			out.println("<script>window.onload=location.href='../html/manager.jsp';alert('管理员添加成功，请新管理员使用此信息登录');</script>");
		}
		
	%>
</body>
</html>