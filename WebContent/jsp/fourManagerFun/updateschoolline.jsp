<%@page import="operation.updateService"%>
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
	
	String sql="update college_grade set science='"+scienceline+"',liberal='"+liberaline+
			"',Srank='"+sciencerank+"',Lrank='"+liberalrank+"' where c_id='"+schoolnum+
			"' and year='"+year+"' and s_id='"+Birid+"'";
// 	System.out.println("updateSql="+sql);
	int a=new updateService().update(sql);
// 	System.out.println(a);
	response.getWriter().println(a);
	
%>