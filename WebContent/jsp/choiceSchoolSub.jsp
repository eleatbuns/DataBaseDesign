<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String BirProvince=request.getParameter("province");
		String grade=request.getParameter("grade");
		String rank=request.getParameter("rank");
		String scPro=request.getParameter("scPro");
		String wenli=request.getParameter("tropism");

		String sqlschool=null;
		String sqlMessage=null;
		if(wenli.equals("文科")){
			sqlschool="SELECT c_name,college_grade.s_id,YEAR,liberal,Lrank FROM college_grade,college_num "+
					"WHERE college_num.c_id=college_grade.c_id AND college_grade.c_id IN "+
					"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
					"WHERE s_name=\""+BirProvince+"\" AND liberal<"+Integer.parseInt(grade)+
					" AND Lrank>"+Integer.parseInt(rank)+" AND c_id IN"+
					"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+scPro+"\"))"+
					"AND college_grade.s_id IN (SELECT s_id FROM province_num WHERE s_name='"+BirProvince+"')";
			sqlMessage="SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce FROM college_message NATURAL JOIN college_num "+ 
					"WHERE c_id IN"+
					"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
					"WHERE s_name=\""+BirProvince+"\" AND liberal<"+Integer.parseInt(grade)+
					" AND Lrank>"+Integer.parseInt(rank)+" AND c_id IN"+
					"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+scPro+"\"))";
		}
		
		else if(wenli.equals("理科")){
			sqlschool="SELECT c_name,college_grade.s_id,YEAR,science,Srank FROM college_grade,college_num "+
					"WHERE college_num.c_id=college_grade.c_id AND college_grade.c_id IN "+
					"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
					"WHERE s_name=\""+BirProvince+"\" AND science<"+Integer.parseInt(grade)+
					" AND Srank>"+Integer.parseInt(rank)+" AND c_id IN"+
					"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+scPro+"\"))"+
					"AND college_grade.s_id IN (SELECT s_id FROM province_num WHERE s_name='"+BirProvince+"')";
			sqlMessage="SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce FROM college_message NATURAL JOIN college_num "+ 
					"WHERE c_id IN"+
					"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
					"WHERE s_name=\""+BirProvince+"\" AND science<"+Integer.parseInt(grade)+
					" AND Srank>"+Integer.parseInt(rank)+" AND c_id IN"+
					"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+scPro+"\"))";
		}
		
		ResultSet rsGrade= new selectService().select(sqlschool);
		ResultSet rsMes=new selectService().select(sqlMessage);
		
		JsonObject obj=new JsonObject();
		JsonArray jsonArray=new JsonArray();
		
		while(rsGrade.next()){
			JsonObject ObjGrade=new JsonObject();
			
			ObjGrade.addProperty("c_name", rsGrade.getString(1));
			ObjGrade.addProperty("year", rsGrade.getString(3));
			ObjGrade.addProperty("grade", rsGrade.getString(4));
			ObjGrade.addProperty("rank", rsGrade.getString(5));
			
			jsonArray.add(ObjGrade);
		}
		obj.add("schoolGrade", jsonArray);
		
		JsonArray Array=new JsonArray();
		while(rsMes.next()){
			JsonObject ObjMess=new JsonObject();
			
			ObjMess.addProperty("c_name", rsMes.getString(1));
			ObjMess.addProperty("address", rsMes.getString(2));
			ObjMess.addProperty("nature", rsMes.getString(3));
			ObjMess.addProperty("genre", rsMes.getString(4));
			ObjMess.addProperty("phonenum", rsMes.getString(5));
			ObjMess.addProperty("profile", rsMes.getString(6));
			ObjMess.addProperty("introduce", rsMes.getString(7));
			
			Array.add(ObjMess);
		}
		obj.add("schoolMess", Array);
		
		response.getWriter().println(obj.toString());
		
		%>	