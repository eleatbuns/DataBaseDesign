<%--
  Created by IntelliJ IDEA.
  User: GaoLi
  Date: 16-7-27
  Time: 下午2:11
  To change this template use File | Settings | File Templates.
--%>
<%@page import="operation.insertService"%>
<%@page import="database.Database"%>
<%@page import="operation.registerImp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="operation.register" %>
<html>

<body bgcolor="#f3f3f3" style="text-align:center;">
	<%
		try{
			String name, pwd,nickname;
			request.setCharacterEncoding("UTF-8");
			name = request.getParameter("username");
			pwd = request.getParameter("password");
			nickname=request.getParameter("nickname");
			
			String sql = "select password from login_message where username = \'" + name + "\'";
			String ret=	new Database().userLogin(sql);
			
			if(ret==""){
				int a=new registerImp().insert(name,nickname,pwd,"0");
				if(a==1){
					String insertName="insert into application_info (username) values ('"+name+"')";
					new insertService().insert(insertName);
					request.getSession().setAttribute("nickname", nickname);
					request.getSession().setAttribute("username", name);
					
					response.sendRedirect("../html/index.jsp");
				}
				else{
					response.sendRedirect("../html/login.html");
				}
			}
			else{
				response.sendRedirect("../html/login.html");
			}
		}catch(Exception e){
				System.err.println("有错误出现");
		}
	%>
</body>
</html>
