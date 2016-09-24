<%@page import="operation.insertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String scname = request.getParameter("scname");
	String scnum = request.getParameter("scnum");
	String scpronum = request.getParameter("scpronum");
	String Bacnum = request.getParameter("Bacnum");
	String newaddress = request.getParameter("newaddress");
	String scNature = request.getParameter("scNature");
	String sctype = request.getParameter("sctype");
	String scPhone = request.getParameter("scPhone");
	String scprofile = request.getParameter("scprofile");
	String scintro = request.getParameter("scintro");
// 	System.out.println(scname+scnum+scpronum+Bacnum+newaddress+scNature+sctype+scPhone+scprofile+scintro);
	if(scname==""||scnum==""||scpronum==""||Bacnum==""||newaddress==""||scNature==""||sctype==""||scPhone==""||scprofile==""||scintro==""){
		response.getWriter().println(0);
	}
	else{
		String sql="insert into college_num values('"+scnum+"','"+scname+"','"+scpronum+"','"+Bacnum+"')";
		int a= new insertService().insert(sql);
		
// 		System.out.println("sql="+sql);
		String sql2="insert into college_message values('"+scnum+"','"+newaddress+"','"+scNature+
					"','"+sctype+"','"+scPhone+"','"+scprofile+"','"+scintro+"')";
		int b= new insertService().insert(sql2);
// 		System.out.println("sql22="+sql2);
// 		System.out.println(a+"+"+b);
		if(a==1&&b==1){
			response.getWriter().println(1);
		}
		else{
			response.getWriter().println(2);
		}
	}
	
%>