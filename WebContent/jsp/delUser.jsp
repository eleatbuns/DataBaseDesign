<%@page import="operation.deleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("name");
	String sql = "delete from login_message where username='" + username + "'";

	int a = new deleteService().delete(sql);
	String sql2 = "delete from application_info where username='" + username + "'";

	int b = new deleteService().delete(sql2);
// 	System.out.println("a="+a+"b="+b);
	if(a==1&&b==1){
		response.getWriter().println(1);
	}
%>