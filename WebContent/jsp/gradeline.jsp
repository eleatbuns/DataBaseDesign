<%@page import="java.io.Console"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="operation.selectService" %>
<%@ page import="database.Database" %>
	<%
	try{
		String s_id=null;
		String s1,s2,s3,l1,l2,l3;

		request.setCharacterEncoding("UTF-8");
		String province=request.getParameter("provinceLine");
		String year=request.getParameter("yearLine");

		String sidSql="select s_id from province_num where s_name='"+province+"';";
		ResultSet rSet=new selectService().select(sidSql);
		while(rSet.next()){
			s_id=rSet.getString(1);
		}
// 		System.out.println(s_id);
		String sql="select science1,science2,science3,liberal1,liberal2,liberal3 "+
				"from gradeline where s_id='"+s_id+"'and year='"+year+"';";

		ResultSet grade=new selectService().select(sql);
		if(grade.next()){
			s1=grade.getString(1);
			s2=grade.getString(2);
			s3=grade.getString(3);
			l1=grade.getString(4);
			l2=grade.getString(5);
			l3=grade.getString(6);
			response.getWriter().println(s1+","+s2+","+s3+","+l1+","+l2+","+l3);
		}	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		new Database().close();
	}
		
	%>
