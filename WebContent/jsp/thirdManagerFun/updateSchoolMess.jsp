<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="operation.updateService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
		String scname=request.getParameter("scname");
		String scnum=request.getParameter("scnum");
		String scpronum=request.getParameter("scpronum");
		String Bacnum=request.getParameter("Bacnum");
		String newaddress=request.getParameter("newaddress");
		String scNature=request.getParameter("scNature");
		String sctype=request.getParameter("sctype");
		String scPhone=request.getParameter("scPhone");
		String scprofile=request.getParameter("scprofile");
		String scintro=request.getParameter("scintro");
		
		String proSql="select s_name from province_num where s_id='"+scpronum+"'";
		ResultSet rs=new selectService().select(proSql);
		if(rs.next()==false){
			response.getWriter().println(0);
		}
		else{
			String sql="update college_num set s_id='"+scpronum+"',c_name='"+scname+"',Bachelor='"+Bacnum+
					"' where c_id='"+scnum+"'";
			
			int a=new updateService().update(sql);
// 			System.out.println("sql="+sql);
			String sql2="update college_message set address='"+newaddress+"',nature='"+scNature+
					"',genre='"+sctype+"',phonenum='"+scPhone+"',profile='"+scprofile+"',introduce='"+scintro+
					"' where c_id='"+scnum+"'";
			int b=new updateService().update(sql2);
			if(a==1&&b==1){
				response.getWriter().println(1);
			}
			else{
				response.getWriter().println(2);
			}
		}
		
		
	%>
