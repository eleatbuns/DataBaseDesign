<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String scNum=request.getParameter("scnum");
	String sql="select c_name,s_id,Bachelor,address,nature,genre,phonenum,profile,introduce "+
		"from college_num NATURAL JOIN college_message where c_id='"+scNum+"'";
	ResultSet rs=new selectService().select(sql);

	JsonArray array=new JsonArray();
	while(rs.next()){
		JsonObject obj=new JsonObject();
		obj.addProperty("c_name", rs.getString(1));
		obj.addProperty("s_id", rs.getString(2));
		obj.addProperty("Bachelor", rs.getString(3));
		obj.addProperty("address", rs.getString(4));
		obj.addProperty("nature", rs.getString(5));
		obj.addProperty("genre", rs.getString(6));
		obj.addProperty("phonenum", rs.getString(7));
		obj.addProperty("profile", rs.getString(8));
		obj.addProperty("introduce", rs.getString(9));
		array.add(obj);
	}
	response.getWriter().println(array);
%>