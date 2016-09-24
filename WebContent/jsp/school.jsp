<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String schoolId=request.getParameter("schoolname");
	String sql="select c_name from college_num where c_id='"+schoolId+"';";
	ResultSet rs =new selectService().select(sql);
	String sname=null;
	if(rs.next()){
		sname=rs.getString(1);
	}
	response.getWriter().println(sname);
%>