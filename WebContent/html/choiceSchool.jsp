<%@page import="database.Database"%>
<%@page import="com.sun.javafx.applet.ExperimentalExtensions"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>高考π——估分选大学</title>
</head>
<link href="../img/icon.ico" rel="shortcut icon" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/head.css" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/foot.css" />
<link rel="stylesheet" type="text/css"
	href="../css/choiceCSS/choiceschool.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/bodyright.css" />
<script src="../js/option.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript" src="../js/choiceSchool.js"></script>
<!-- 	<script type="text/javascript" src="../js/jquery-3.1.0.js"></script> -->

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
						<li><a href="index.jsp#position"><img
								src="../img/checkData.png" style="vertical-align: text-bottom" />查数据</a></li>
						<li><a href=""><img src="../img/grade.png"
								style="vertical-align: text-bottom" />估分选大学</a></li>
						<li><a href="application.jsp"><img
								src="../img/applyfor.png" style="vertical-align: text-bottom" />志愿模拟填报</a></li>
					</ul>
				</td>
				<td align="right" id="login"><a href="login.html"><img
						src="../img/people.png" style="vertical-align: text-bottom" /><label
						id="loghallo">登录/注册</label></a></td>
				<%
					String nickname = (String) request.getSession().getAttribute("nickname");
					if (nickname != null) {
						out.println("<script>document.getElementById(\"loghallo\").innerHTML=\"" + nickname + "\";</script>");
					}
				%>
			</tr>
		</table>
	</div>
	<hr style="border-top: 0 #C7FFED dotted" />
	<div id="choiceDiv">
		<div id="choiceLeft">
			<%

				request.setCharacterEncoding("UTF-8");
				String BirProvince = request.getParameter("province");
				String grade = request.getParameter("grade");
				String rank = request.getParameter("mingci");
				String Schprovince = request.getParameter("Schprovince");
				String wenli = request.getParameter("wenli");
// 				System.out.println("wenli+"+wenli);

				if(BirProvince==""||grade==""||rank==""||Schprovince==""||wenli==""){
					BirProvince="北京";
					Schprovince="北京";
					wenli="文科";
					grade="0";
					rank="0";
				}

				String sqlschool=null;
				String sqlMessage=null;
				if(wenli.equals("文科")){
					sqlschool="SELECT c_name,college_grade.s_id,YEAR,liberal,Lrank FROM college_grade,college_num "+
							"WHERE college_num.c_id=college_grade.c_id AND college_grade.c_id IN "+
							"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
							"WHERE s_name=\""+BirProvince+"\" AND liberal<"+Integer.parseInt(grade)+
							" AND Lrank>"+Integer.parseInt(rank)+" AND c_id IN"+
							"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+Schprovince+"\"))"+
							"AND college_grade.s_id IN (SELECT s_id FROM province_num WHERE s_name='"+BirProvince+"')";
					sqlMessage="SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce FROM college_message NATURAL JOIN college_num "+ 
							"WHERE c_id IN"+
							"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
							"WHERE s_name=\""+BirProvince+"\" AND liberal<"+Integer.parseInt(grade)+
							" AND Lrank>"+Integer.parseInt(rank)+" AND c_id IN"+
							"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+Schprovince+"\"))";
				}
				
				else if(wenli.equals("理科")){
					sqlschool="SELECT c_name,college_grade.s_id,YEAR,science,Srank FROM college_grade,college_num "+
							"WHERE college_num.c_id=college_grade.c_id AND college_grade.c_id IN "+
							"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
							"WHERE s_name=\""+BirProvince+"\" AND science<"+Integer.parseInt(grade)+
							" AND Srank>"+Integer.parseInt(rank)+" AND c_id IN"+
							"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+Schprovince+"\"))"+
							"AND college_grade.s_id IN (SELECT s_id FROM province_num WHERE s_name='"+BirProvince+"')";
					sqlMessage="SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce FROM college_message NATURAL JOIN college_num "+ 
							"WHERE c_id IN"+
							"(SELECT DISTINCT(c_id) FROM college_grade NATURAL JOIN province_num "+
							"WHERE s_name=\""+BirProvince+"\" AND science<"+Integer.parseInt(grade)+
							" AND Srank>"+Integer.parseInt(rank)+" AND c_id IN"+
							"(SELECT c_id FROM province_num NATURAL JOIN college_num WHERE s_name=\""+Schprovince+"\"))";
				}
// 				System.out.println("sqlMes="+sqlMessage);
				
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
// 				System.out.println("obj="+obj);
			
			%>

			<script type="text/javascript">
				window.onload=function fun(){
			
				var len=<%= Array.size()%>;
// 				console.log("array.size()="+len);
				var x = document.getElementById('schoolTable').insertRow(0);
				var c_name = x.insertCell(0);
				var address = x.insertCell(1);
				var nature = x.insertCell(2);
				var genre = x.insertCell(3);
				var phonenum = x.insertCell(4);
				var profile = x.insertCell(5)
				var introduce = x.insertCell(6)
	
				c_name.innerHTML ='<h3>大学名称</h3>';
				address.innerHTML ='<h3>学校地址</h3>';
				nature.innerHTML = '<h3>学校性质</h3>';
				genre.innerHTML = '<h3>学校类型</h3>';
				phonenum.innerHTML ='<h3>学校电话</h3>';
				profile.innerHTML = '<h3>学校主页</h3>';
				introduce.innerHTML ='<h3>学校简介</h3>';
				
				
				
				for (var i = 0; i < len; i++) {
					var x = document.getElementById('schoolTable').insertRow(i + 1);
					var c_name = x.insertCell(0);

					var address = x.insertCell(1);
	
					var nature = x.insertCell(2);
	
					var genre = x.insertCell(3);
	
					var phonenum = x.insertCell(4);
	
					var prfile = x.insertCell(5);
	
					var introduce = x.insertCell(6);
	
					c_name.innerHTML ='<h4>'+<%=Array%>[i].c_name+'</h4>';
					address.innerHTML = <%=Array%>[i].address;
					nature.innerHTML = <%=Array%>[i].nature;
					genre.innerHTML = <%=Array%>[i].genre;
					phonenum.innerHTML = <%=Array%>[i].phonenum;
					prfile.innerHTML ='<a href='+ <%=Array%>[i].profile+ '>' +<%=Array%>[i].profile + '</a>';
					introduce.innerHTML =<%=Array%>[i].introduce;
				}
		}
		</script>

			<table id="choiceMessage">
				<tr>
					<td>高考省份：<%=BirProvince %></td>
					<td>高考分数：<%=grade %></td>
				</tr>
				<tr>
					<td>高考排名：<%=rank %></td>
					<td>文理取向：<%=wenli %></td>
				</tr>
				<tr>
					<th colspan="2">*本预测只根据高考前十年的录取分数线和排名推算，只作为高考志愿填报的参考,填报志愿前请谨慎思考</th>
				</tr>
			</table>



		</div>
		<div id="choiceRight">
			<form>
				<table class="righttable" cellpadding="10px">
					<tr>
						<th class="choice">估分选大学</th>
					</tr>
					<tr>
						<td><label>高考省份： <select name="province"
								id="birthprovince" class="province">
									<script>province_option("birthprovince");</script>
							</select></label></td>
						<td><label>年份：</label>&nbsp;&nbsp;<label><script>
						var date=new Date();
						document.write(date.getYear()+1900);
					</script>年</label></td>
					</tr>
					<tr>
						<td><label>高考分数： <input type="text" name="grade"
								id="input-grade" maxlength="3" /></label></td>
						<td><label>名次： <input type="text" name="mingci"
								id="input-mingci" maxlength="7" /></label></td>
					</tr>
					<tr>
						<td><label>大学省份： <select name="province"
								id="CollegePro" class="province">
									<script>province_option("CollegePro");</script>
							</select></label></td>
						<td><label>文/理： <select name="tropism" id="tropism">
									<option value="文科">文科</option>
									<option value="理科">理科</option>
							</select></label></td>
					</tr>
					<tr>
						<td colspan="2" class="submit"><label><input
								type="button" value="确定" onclick="choiceSchool()" /></label></td>
					</tr>
				</table>
			</form>



		</div>
	</div>

	<div style="width: 1000px; margin: 0 auto;">
		<table id="schoolTable" style="text-align: center; margin-top: 250px;"
			cellspacing="0" cellpadding="5px"></table>
		<!--控制与底部的距离使用-->
		<div style="height: 80px;"></div>
	</div>

	<div id="gradeAlert">
		<div id="newDiv">
			<table id='Table' style="font-size: 20px; text-align: center;"
				cellpadding="8px"></table>
			<p id="closeP">
				<button type="button" onclick="Close()">点击关闭</button>
			</p>
		</div>
	</div>

	<script type="text/javascript">
	$(function() {
		var schoolName;
		$("#schoolTable h4").click(function() {

			$(this).addClass('selected'); // 添加当前元素的样式
			schoolName=$(this).text();
			
// 			console.log("schoolName"+schoolName);
			var length=<%=jsonArray.size()%>
			document.getElementById("gradeAlert").style.display="block";
			var x=document.getElementById('Table').insertRow(0);
			var c_name=x.insertCell(0);
			var year=x.insertCell(1);
			var grade=x.insertCell(2);
			var rank=x.insertCell(3)
			
			c_name.innerHTML="<h3>大学名称</h3>";
			year.innerHTML="<h3>考试年份</h3>";
			grade.innerHTML="<h3>投档分数线</h3>";
			rank.innerHTML="<h3>最低录取名次</h3>";
			var time=1;
			
			for(var i=0;i<length;i++){
				var cname=<%=jsonArray%>[i].c_name
// 				console.log(cname);
				if(cname==schoolName){
						
						var x=document.getElementById('Table').insertRow(time);
						var c_name=x.insertCell(0);
						
						 c_name=x.insertCell(0);
						 year=x.insertCell(1);
						 grade=x.insertCell(2);
						 rank=x.insertCell(3)
						
						c_name.innerHTML=<%=jsonArray%>[i].c_name;
						year.innerHTML=<%=jsonArray%>[i].year;
						grade.innerHTML=<%=jsonArray%>[i].grade;
						rank.innerHTML=<%=jsonArray%>
		[i].rank;
										time++;
										//						console.log("obj.c_name="+obj[i].c_name);
									}
								}

							});
		});
	</script>


	<!--共同结尾-->
	<hr style="border-top: 0 #C7FFED dotted" width="1000px" />
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