
<%@page import="database.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String sql = "select password from login_message where username = \'" + name + "\'";
	String ret = new Database().userLogin(sql);
	if(ret!=""){
		response.getWriter().println("1");
	}
%>