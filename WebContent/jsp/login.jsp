<%--
  Created by IntelliJ IDEA.
  User: GaoLi
  Date: 16-8-16
  Time: 下午2:50
  To change this template use File | Settings | File Templates.
--%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page import="database.Database"%>
<title>高考π——用户登录</title>
<html>



<body bgcolor="#f3f3f3" style="text-align:center;">
	<%
		String name, pwd;
		request.setCharacterEncoding("UTF-8");
		name = request.getParameter("logname");
		pwd = request.getParameter("logpassword");
		if (pwd == "") {
			pwd = "default";
		}

		String sql = "select password from login_message where username = \'" + name + "\'";
		String password = new Database().userLogin(sql);
		if (password.equals(pwd)) {	
			
			String nicksql = "select nickname from login_message where username = \'" + name + "\'";
			ResultSet rs=new selectService().select(nicksql);
			String nickname=null;
			if(rs.next()){
				nickname=rs.getString(1);
				request.getSession().setAttribute("nickname", nickname);
					
				request.getSession().setAttribute("username",name);
			}
			
			String sqlManage="select power from login_message where username='"+name+"'";
			ResultSet rsSet=new selectService().select(sqlManage);
			String pow=null;
			if(rsSet.next()){
				pow=rsSet.getString(1);
			}
			if(pow.equals("1")){
				response.sendRedirect("../html/manager.jsp");
			}
			else{
				response.sendRedirect("../html/index.jsp");
			}
		} else {
			response.sendRedirect("../html/login.html");
		}
	%>
</body>
</html>
