<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("uname");
	String sql = "select password from login_message where username = \'" + username + "\'";
	String ret = new Database().userLogin(sql);
	if(ret==""){
		response.getWriter().println(0);//查询数据失败，没有这个用户
	}
	else{
		response.getWriter().println(1);
	}
%>