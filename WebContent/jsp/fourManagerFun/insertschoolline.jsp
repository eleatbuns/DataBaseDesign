<%@page import="operation.insertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String schoolnum = request.getParameter("schoolnum");
	String year = request.getParameter("year");
	String Birid = request.getParameter("Birid");

	String scienceline = request.getParameter("scienceline");
	String liberaline = request.getParameter("liberaline");
	String sciencerank = request.getParameter("sciencerank");
	String liberalrank = request.getParameter("liberalrank");
	
	String sql="insert into college_grade values('"+schoolnum+"','"+year+"','"+Birid+"','"+scienceline+"','"+
			liberaline+"','"+sciencerank+"','"+liberalrank+"')";
// 	System.out.println("awwa="+sql);
	int a=new insertService().insert(sql);
	response.getWriter().println(a);
	
%>