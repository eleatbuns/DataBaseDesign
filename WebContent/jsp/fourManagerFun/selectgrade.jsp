<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String proid=request.getParameter("proid");
	String year=request.getParameter("year");
	
	String sql="select science1,science2,science3,liberal1,liberal2,liberal3 from gradeline"+
		" where s_id='"+proid+"' and year='"+year+"'";
// 	System.out.println(sql);
	ResultSet rs=new selectService().select(sql);
	JsonArray arr=new JsonArray();
	while(rs.next()){
		JsonObject obj=new JsonObject();
		obj.addProperty("science1", rs.getString(1));
		obj.addProperty("science2", rs.getString(2));
		obj.addProperty("science3", rs.getString(3));
		obj.addProperty("liberal1", rs.getString(4));
		obj.addProperty("liberal2", rs.getString(5));
		obj.addProperty("liberal3", rs.getString(6));
		arr.add(obj);
	}
	response.getWriter().println(arr.toString());
%>