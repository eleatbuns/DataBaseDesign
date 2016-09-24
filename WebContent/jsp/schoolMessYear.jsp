<%@page import="java.util.ArrayList"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String birthPro = request.getParameter("birthPro");
	String schoolname = request.getParameter("schoolname");
	 
	String sql="SELECT year FROM college_grade ,college_num,province_num WHERE province_num.s_id=college_grade.s_id AND "+
			"college_num.c_id=college_grade.c_id AND s_name='"+birthPro+"' AND c_name='"+schoolname+"'";
	ResultSet rs=new selectService().select(sql);
	ArrayList<String> list=new ArrayList<String>();
// 	System.out.println(sql);
	while(rs.next()){
		list.add(rs.getString(1));
	}
	String str=list.get(0);
	for(int i=1;i<list.size();i++){
		str=str+","+list.get(i);
	}
	response.getWriter().println(str);

%>