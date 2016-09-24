<%@page import="operation.updateService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String proid = request.getParameter("proid");
	String year = request.getParameter("year");
	String scg1 = request.getParameter("scg1");
	String scg2 = request.getParameter("scg2");
	String scg3 = request.getParameter("scg3");
	String lib1 = request.getParameter("lib1");
	String lib2 = request.getParameter("lib2");
	String lib3 = request.getParameter("lib3");
	
	String sql="update gradeline set science1='"+scg1+"',science2='"+scg2+"',science3='"+scg3+
			"',liberal1='"+lib1+"',liberal2='"+lib2+"',liberal3='"+lib3+"' where s_id='"+proid+
			"' and year='"+year+"'";
	int a=new updateService().update(sql);
	response.getWriter().println(a);
	
	

%>