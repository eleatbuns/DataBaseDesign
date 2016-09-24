<%@page import="operation.deleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String proid = request.getParameter("proid");
	String year = request.getParameter("year");
	
	String sql="delete from gradeline where s_id='"+proid+"' and year='"+year+"'";
	int a=new deleteService().delete(sql);
	response.getWriter().println(a);
%>