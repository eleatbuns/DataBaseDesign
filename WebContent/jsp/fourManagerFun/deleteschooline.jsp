<%@page import="operation.deleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String schoolnum = request.getParameter("schoolnum");
	String year = request.getParameter("year");
	String Birid = request.getParameter("Birid");
	
	String sql="delete from college_grade where c_id='"+schoolnum+"' and year='"+
			year+"' and s_id='"+Birid+"'";
// 	System.out.println("sas="+sql);
	int a=new deleteService().delete(sql);
	response.getWriter().println(a);
%>