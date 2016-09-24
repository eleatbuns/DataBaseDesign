<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String schoolnum = request.getParameter("schoolnum");
	String year = request.getParameter("year");
	String Birid = request.getParameter("Birid");
	
	String sql="select science,liberal,Srank,Lrank from college_grade where"+
			" c_id='"+schoolnum+"' and year='"+year+"' and s_id='"+Birid+"'";
	
	ResultSet rs=new selectService().select(sql);
	JsonArray arr=new JsonArray();
	while(rs.next()){
		JsonObject obj=new JsonObject();
		obj.addProperty("science", rs.getString(1));
		obj.addProperty("liberal", rs.getString(2));
		obj.addProperty("Srank", rs.getString(3));
		obj.addProperty("Lrank", rs.getString(4));
		
		arr.add(obj);
	}
	response.getWriter().println(arr.toString());
%>