<%@page import="com.google.gson.JsonObject"%>
<%@page import="operation.selectService"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String username = request.getParameter("name");
	String mesSql = "select nickname,major11,major12,major13,major21,major22,major23,major32,major32,major33"
			+ " from login_message natural join application_info where username='"+username+"'";
//  		System.out.println("sql="+mesSql);
	ResultSet rs = new selectService().select(mesSql);

	JsonArray arr = new JsonArray();

	while (rs.next()) {
		JsonObject obj = new JsonObject();
		obj.addProperty("nickname", rs.getString(1));
		obj.addProperty("major11", rs.getString(2));
		obj.addProperty("major12", rs.getString(3));
		obj.addProperty("major13", rs.getString(4));
		obj.addProperty("major21", rs.getString(5));
		obj.addProperty("major22", rs.getString(6));
		obj.addProperty("major23", rs.getString(7));
		obj.addProperty("major31", rs.getString(8));
		obj.addProperty("major32", rs.getString(9));
		obj.addProperty("major33", rs.getString(10));
		arr.add(obj);
	}
	response.getWriter().println(arr.toString());
%>