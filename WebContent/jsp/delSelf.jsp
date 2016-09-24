<%@page import="operation.deleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("name");
	String sql="delete from login_message where username='"+username+"'";
	session.invalidate();
	int a=new deleteService().delete(sql); 
	response.getWriter().println(a);
%>