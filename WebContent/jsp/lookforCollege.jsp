<%@page import="database.Database"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	try {
		request.setCharacterEncoding("UTF-8");
		String area = request.getParameter("area");
		String nature = request.getParameter("nature");
		String genre = request.getParameter("genre");

// 		System.out.println("area=" + area);
// 		System.out.println("charcter=" + nature);
// 		System.out.println("type=" + genre);
		String sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
				+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num where ";
		
		if (area.length() > 0 && area.length() < 4&&area.equals("null")==false) {
			sql += " s_name=\"" + area + "\"";
			
			if (nature.length() > 0 && nature.length() < 3&&nature.equals("null")==false) {
				sql += " and nature=\"" + nature + "\"";
			}
			
			if (genre.length() > 0 && genre.length() < 6&&genre.equals("null")==false) {
				if (genre.equals("本科")) {
					sql += " and Bachelor=0";
				} else if (genre.equals("专科")) {
					sql += " and Bachelor=1";
				} else {
					sql += " and genre=\"" + genre + "\"";
				}
			}
			
		} else if (nature.length() > 0 && nature.length() < 3&&nature.equals("null")==false) {
			sql += "  nature=\"" + nature + "\"";
			
			if (genre.length() > 0 && genre.length() < 6&&genre.equals("null")==false) {
				if (genre.equals("本科")) {

					sql += " and Bachelor=0";

				} else if (genre.equals("专科")) {
					sql += " and Bachelor=1";
				} else {
					sql += " and genre=\"" + genre + "\"";
				}
			}
			
		} else if (genre.length() > 0 && genre.length() < 6&&genre.equals("null")==false) {
			if (genre.equals("本科")) {
				sql += " Bachelor=0";
			} else if (genre.equals("专科")) {
				sql += " Bachelor=1";
			} else {
				sql += " genre=\"" + genre + "\"";
			}
		}

// 		System.out.println("sql=" + sql);
		ResultSet rs = new selectService().select(sql);
		// 		System.out.println("rs=" + rs);
		JsonArray array = new JsonArray();
		while (rs.next()) {
			JsonObject object = new JsonObject();
			// 			System.out.println("rs.getString(1)="+rs.getString(1));
			object.addProperty("c_name", rs.getString(1));
			object.addProperty("address", rs.getString(2));
			object.addProperty("nature", rs.getString(3));
			object.addProperty("genre", rs.getString(4));
			object.addProperty("phonenum", rs.getString(5));
			object.addProperty("prfile", rs.getString(6));
			object.addProperty("introduce", rs.getString(7));
			array.add(object);
		}
		String arrayMess = array.toString();
		// 		// 		String name="helloworld";
		// 				System.out.println("array="+arrayMess);
		// 		//array.toString()
		// 		response.sendRedirect("../html/lookforCollege.jsp?arrayMess="+arrayMess);
		response.getWriter().println(arrayMess);

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		new Database().close();
	}
%>










