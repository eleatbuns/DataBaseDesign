<%@page import="operation.deleteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String scnum=request.getParameter("scnum");
	String sql="delete from college_num where c_id='"+scnum+"'";
	
	int a=new deleteService().delete(sql);
	String sql2="delete from college_message where c_id='"+scnum+"'";
	int b=new deleteService().delete(sql2);
	if(a==1&&b==1){
		response.getWriter().println(1);
	}
	else{
		response.getWriter().println(2);
	}
%>