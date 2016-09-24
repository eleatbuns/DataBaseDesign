<%@page import="java.util.ArrayList"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String province=request.getParameter("province");
	
	String sql="select year from gradeline natural join province_num where s_name='"+province+"'"; 
	
	ResultSet rs=new selectService().select(sql);
// 	ArrayList<String> list=new ArrayList<String>();
	String str=null;
	while(rs.next()){
// 		list.add(rs.getString(1));
		str=str+","+rs.getShort(1);
	}
	response.getWriter().println(str);
%>