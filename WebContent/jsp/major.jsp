<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String major=request.getParameter("majormess");
	String sql = "select m_name from major_message where m_id='" + major + "';";
	ResultSet rs = new selectService().select(sql);
	String mname = null;
	if (rs.next()) {
		mname = rs.getString(1);
	}
	response.getWriter().println(mname);
%>