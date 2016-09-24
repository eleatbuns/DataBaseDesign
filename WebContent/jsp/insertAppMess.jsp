<%@page import="operation.insertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String username = (String) request.getSession().getAttribute("username");
		String major11=request.getParameter("major11");
		String major12=request.getParameter("major12");
		String major13=request.getParameter("major13");
		String major21=request.getParameter("major21");
		String major22=request.getParameter("major22");
		String major23=request.getParameter("major23");
		String major31=request.getParameter("major31");
		String major32=request.getParameter("major32");
		String major33=request.getParameter("major33");
// 		String sql="insert into application_info "+
// 				"(username,major11,major12,major13,major21,major22,major23,major31,major32,major33)"+
// 				"values('"+username+"','"+major11+"','"+major12+"','"+major13+"','"+
// 				major21+"','"+major22+"','"+major23+"','"+major31+"','"+major32+"','"+major33+"')";
		
		String sql="update application_info set major11='"+major11+"',major12='"+major12+"',major13='"+
					major13+"',major21='"+major21+"',major22='"+major22+"',major23='"+major23+"',major31='"+
					major31+"',major32='"+major32+"',major33='"+major33+"' where username='"+username+"'";
// 		System.out.println(sql);
		int a=new insertService().insert(sql);
		
		response.getWriter().println(a);
		
	%>
