<%@page import="operation.selectService"%>
<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="operation.insertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>高考π——志愿模拟填报</title>
<link href="../img/icon.ico" rel="shortcut icon" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/head.css" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/foot.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/application.css" />
<script type="text/javascript" src="../js/applicationShow.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
</head>
<body>
	<!--共同报头-->
	<div class="headtitle">
		<table class="tabletitle" align="center">
			<tr>
				<td><img src="../img/gaokao.png" alt="高考π" /><img id="logoch"
					src="../img/gaokaopai.png" alt="高考π" /></td>
				<td>
					<ul class="directory">
						<li><a href="index.jsp"><img src="../img/home.png"
								style="vertical-align: text-bottom" />首页</a></li>
						<li><a href="#position"><img src="../img/checkData.png"
								style="vertical-align: text-bottom" />查数据</a></li>
						<li><a href="choiceSchool.jsp?province=&grade=&mingci=&Schprovince=&wenli="><img src="../img/grade.png"
								style="vertical-align: text-bottom" />估分选大学</a></li>
						<li><a href=""><img src="../img/applyfor.png"
								style="vertical-align: text-bottom" />志愿模拟填报</a></li>
					</ul>
				</td>
				<td align="right" id="login"><a href="login.html"><img
						src="../img/people.png" style="vertical-align: text-bottom" /><label
						id="logAndReg">登录/注册</label></a></td>
				<%
					String nickname = (String) request.getSession().getAttribute("nickname");
					if (nickname != null) {

						out.println("<script>document.getElementById(\"logAndReg\").innerHTML=\"" + nickname + "\";</script>");
					} else {
						out.println("<script>window.onload=alert('当前您还未登录，请先登录再进行操作');location.href='login.html'</script>");
					}
				%>
			</tr>
		</table>
	</div>
	<hr style="border-top: 0 #C7FFED dotted" />
	<div class="outDiv">
		<h3>欢迎使用高考志愿模拟填报系统</h3>
		<p class="">*注：本系统只提供志愿模拟填报，填报结果将保存在个人用户信息中，正式填报志愿请前往本省志愿招生考试院网站</p>
		<div class="autodiv">
			<form>
				<table class="application-table" border="1px">
					<tr>
						<th rowspan="2">第一志愿</th>
						<td colspan="3"><label>学校代码：<input type="text"
								id="school1" onblur="ajaxschool(this.id)"></label>&nbsp;&nbsp;学校名称：<label></label></td>

					</tr>
					<tr>
						<td><label>专业代码：<input type="text" id="major11"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
						<td><label>专业代码：<input type="text" id="major12"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
						<td><label>专业代码：<input type="text" id="major13"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
					</tr>
					<tr>
						<th rowspan="2">第二志愿</th>
						<td colspan="3"><label>学校代码：<input type="text"
								id="school2" onblur="ajaxschool(this.id)"></label>&nbsp;&nbsp;学校名称：<label></label></td>

					</tr>
					<tr>
						<td><label>专业代码：<input type="text" id="major21"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
						<td><label>专业代码：<input type="text" id="major22"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
						<td><label>专业代码：<input type="text" id="major23"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
					</tr>
					<tr>
						<th rowspan="2">第三志愿</th>
						<td colspan="3"><label>学校代码：<input type="text"
								id="school3" onblur="ajaxschool(this.id)"></label>&nbsp;&nbsp;学校名称：<label></label></td>

					</tr>
					<tr>
						<td><label>专业代码：<input type="text" id="major31"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
						<td><label>专业代码：<input type="text" id="major32"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
						<td><label>专业代码：<input type="text" id="major33"
								onblur="ajaxmajor(this.id)"></label><br />专业名称:<label></label></td>
					</tr>
					<tr>
						<td colspan="4"><label><input type="button"
								value="提交" class="application-submit"
								onclick="ajaxApplication_mess()"></label></td>
					</tr>
				</table>
			</form>
		</div>
		
		<%
			String username = (String) request.getSession().getAttribute("username");
			String majorsql="select major11,major12,major13,major21,major22,major23,major31,major32,major33 "+
					"from application_info where username='"+username+"'";
		
			ResultSet majorSet=new selectService().select(majorsql);
// 			System.out.println("majorsql="+majorsql);
			String majorString[];
			majorString=new String[9];
			if(majorSet.next()){
				for(int i=0;i<9;i++){
					majorString[i]=majorSet.getString(i+1);
// 					System.out.println("majorString="+majorString[i]);
				}
			}
			new Database().close();
			String schoolSql="select c_name from major_message natural join college_num where m_id='"+majorString[0]+"'"+
					"union all select c_name from major_message natural join college_num where m_id='"+majorString[3]+"'"+
					"union all select c_name from major_message natural join college_num where m_id='"+majorString[6]+"'";
			ResultSet schoolSet=new selectService().select(schoolSql);
// 			System.out.println("schoolSql="+schoolSql);
// 			System.out.println("schoolSet="+schoolSet);
			String schoolString[];
			schoolString=new String[3];
			int i=0;
			while(schoolSet.next()){
				schoolString[i]=schoolSet.getString(1);
// 				System.out.println("schoolString="+schoolString[i]);
				i++;
				
			}
			new Database().close();
			String namesql="select m_name from major_message where m_id='"+majorString[0]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[1]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[2]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[3]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[4]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[5]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[6]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[7]+"'"+
					"union all select m_name from major_message where m_id='"+majorString[8]+"'";
// 			System.out.println("namesql="+namesql);
			ResultSet nameSet=new selectService().select(namesql);
			String nameString[];
			nameString=new String[10];
			int a=0;
			while(nameSet.next()){
					nameString[a]=nameSet.getString(1);
// 					System.out.println("nameString="+nameString[a]);
					a++;
			}
			
		%>
		
		<div class="history">
			<h3>历史填报记录</h3>
			
			<table class="application-table" border="1px">
				<tr>
					<th rowspan="2">第一志愿</th>
					<td colspan="3"><label>学校名称：<%=schoolString[0] %></label></td>

				</tr>
				<tr>
					<td><label>专业名称：<%=nameString[0] %></label></td>
					<td><label>专业名称：<%=nameString[1] %></label></td>
					<td><label>专业名称：<%=nameString[2] %></label><br /></td>
				</tr>
				<tr>
					<th rowspan="2">第二志愿</th>
					<td colspan="3"><label>学校名称：<%=schoolString[1] %></label></td>

				</tr>
				<tr>
					<td><label>专业名称：<%=nameString[3] %></label></td>
					<td><label>专业名称：<%=nameString[4] %></label></label></td>
					<td><label>专业名称：<%=nameString[5] %></label></label></td>
				</tr>
				<tr>
					<th rowspan="2">第三志愿</th>
					<td colspan="3"><label>学校名称：<%=schoolString[2] %></label></td>

				</tr>
				<tr>
					<td><label>专业名称：<%=nameString[6] %></label></td>
					<td><label>专业名称：<%=nameString[7] %></label></td>
					<td><label>专业名称：<%=nameString[8] %></label></td>
				</tr>
			</table>
			</div>
		</div>
		


	<div class="alertWin" id='tableAlert'>
		<div class="truediv">
			<table class="application-table" border="1px">
				<tr>
					<th rowspan="2">第一志愿</th>
					<td colspan="3"><label>学校代码：<label id="alertschool1"></label></label>&nbsp;&nbsp;学校名称：<label
						id="schName1"></label></td>

				</tr>
				<tr>
					<td><label>专业代码：<label id="majorid1"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa1"></label></td>
					<td><label>专业代码：<label id="majorid2"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa2"></label></td>
					<td><label>专业代码：<label id="majorid3"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa3"></label></td>
				</tr>
				<tr>
					<th rowspan="2">第二志愿</th>
					<td colspan="3"><label>学校代码：<label id="alertschool2"></label></label>&nbsp;&nbsp;学校名称：<label
						id="schName2"></label></td>

				</tr>
				<tr>
					<td><label>专业代码：<label id="majorid4"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa4"></label></td>
					<td><label>专业代码：<label id="majorid5"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa5"></label></td>
					<td><label>专业代码：<label id="majorid6"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa6"></label></td>
				</tr>
				<tr>
					<th rowspan="2">第三志愿</th>
					<td colspan="3"><label>学校代码：<label id="alertschool3"></label></label>&nbsp;&nbsp;学校名称：<label
						id="schName3"></label></td>

				</tr>
				<tr>
					<td><label>专业代码：<label id="majorid7"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa7"></label></td>
					<td><label>专业代码：<label id="majorid8"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa8"></label></td>
					<td><label>专业代码：<label id="majorid9"></label></label><br />&nbsp;&nbsp;专业名称:<label
						id="majorNa9"></label></td>
				</tr>
			</table>

			<p class="alertButton">
				<button type="button" onclick="document.getElementById('tableAlert').style.display='none'">点击关闭</button>
			</p>
		</div>
	</div>

	<div height="100px"></div>
	<!--共同结尾-->
	<footer class="footer">
		<table class="bottomtable">
			<tr>
				<td>
					<ul class="footdir">
						<li><a href="">关于我们</a> |</li>
						<li><a href="">联系我们</a> |</li>
						<li><a href="">反馈建议</a> |</li>
						<li><a href="">帮助中心</a></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td>Copyright&copy;2016sdu gaoli版权所有</td>
			</tr>
		</table>
	</footer>
</body>
</html>