<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="database.Database"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try{	
		request.setCharacterEncoding("UTF-8");
		String sql=null; 
		String exam_province = request.getParameter("examPro");
		String year = request.getParameter("gradeYear");
		String college_name = request.getParameter("college_name");
		
// 		System.out.println("exam_province="+exam_province);
// 		System.out.println("year="+year);
// 		System.out.println("college_name="+college_name);
		
		if(year.equals("全部")&&exam_province.equals("全部")==false){
			sql="SELECT c_name,s_name,year,science,liberal FROM college_grade , college_num,province_num "+ 
					"WHERE province_num.s_id=college_grade.s_id AND c_name=\""+college_name+
					"\" AND college_num.c_id=college_grade.c_id and s_name=\""+exam_province+"\";";
		}
		else{ 
			sql="SELECT c_name,s_name,year,science,liberal FROM college_grade , college_num,province_num "+
					"WHERE province_num.`s_id`=college_grade.s_id AND s_name= \""+exam_province+
					"\" AND YEAR=\""+year+"\" AND c_name=\""+college_name+
					"\" AND college_num.c_id=college_grade.c_id;";
			
		}
		ResultSet rsSet=new selectService().select(sql);
		
// 		int rowCount=rsSet.getRow();
		
		JsonArray jsonArray=new JsonArray();
		
		while(rsSet.next()){
			
			JsonObject message=new JsonObject();
			
			message.addProperty("c_name", rsSet.getString(1));
			message.addProperty("s_name", rsSet.getString(2));
			message.addProperty("year", rsSet.getString(3));
			message.addProperty("science", rsSet.getString(4));
			message.addProperty("liberal", rsSet.getString(5));
			jsonArray.add(message); 
			
		}
// 		jsonObject.add("message",jsonArray);
// 	 	System.out.println("jsonObject="+jsonArray.toString()); 
		response.getWriter().println(jsonArray.toString());
// 		response.getWriter().println(jsonObject);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		new Database().close();
	}
	%>
