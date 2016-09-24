<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%> 
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		try{
			request.setCharacterEncoding("UTF-8");
			String province=request.getParameter("province");
			
			ArrayList<String> list=new ArrayList<String>();
			
			
			String sql="SELECT c_name FROM province_num NATURAL JOIN college_num where s_name='"
						+province+"'";
			ResultSet rsSet=new selectService().select(sql);
			while(rsSet.next()){
				list.add(rsSet.getString(1));
			}
			String str=list.get(0);
			for(int i=1;i<list.size();i++){
				str=str+","+list.get(i);
			}
			response.getWriter().println(str);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			new Database().close();
		}
	
%>