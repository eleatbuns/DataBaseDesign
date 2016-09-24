<%@page import="operation.insertService"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
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
	
	String checkpro="select s_name from province_num where s_id='"+proid+"'";
	ResultSet rs=new selectService().select(checkpro);
// 	System.out.println("che="+checkpro);
	if(rs.next()==false){
		response.getWriter().println(0);
	}
	else{
		String sql = "insert into gradeline values('"+proid+"','"+year+"','"+scg1+"','"+scg2+"','"+
				scg3+"','"+lib1+"','"+lib2+"','"+lib3+"')";
			
// 		System.out.println(sql);
		int a=new insertService().insert(sql);
		response.getWriter().println(a);
	}
	
%>