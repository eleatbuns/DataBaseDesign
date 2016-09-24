<%@page import="database.Database"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>高考π——高考院校库</title>
<meta name="description" content="">
<link href="../img/icon.ico" rel="shortcut icon" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/head.css" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/foot.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/indexbody.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/bodyleft.css" />
<link rel="stylesheet" type="text/css"
	href="../css/lookCSS/lookright.css">
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
						<li><a href="index.jsp#position"><img
								src="../img/checkData.png" style="vertical-align: text-bottom" />查数据</a></li>
						<li><a href="choiceSchool.jsp?province=&grade=&mingci=&Schprovince=&wenli="><img src="../img/grade.png"
								style="vertical-align: text-bottom" />估分选大学</a></li>
						<li><a href="application.jsp"><img src="../img/applyfor.png"
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
					}
				%>
			</tr>
		</table>
	</div>
	<hr style="border-top: 0 #C7FFED dotted" />
	<script type=text/javascript>
		var area = null;
		var genre = null;
		var nature = null;
	</script>
	<div id="bodyleft">
		<!-- 左半边上部看大学 -->
		<table class="lefttable" id="lookbody">
			<caption>
				<label><a name="position" id="position">高考院校库</a></label>
			</caption>
			<tr>
				<td class="option">按地区</td>
				<td class="section">
					<ul class="text" id="areaul">
						<li  id=1>北京</li>
						<li  id=2>上海</li>
						<li  id=3>山东</li>
						<li  id=4>浙江</li>
						<li  id=5>江苏</li>
						<li  id=6>湖南</li>
						<li  id=7>湖北</li>
						<li  id=8>河南</li>
						<li  id=9>河北</li>
						<li  id=10>四川</li>
						<li  id=11>辽宁</li>
						<li  id=12>广东</li>
						<li  id=13>广西</li>
						<li  id=14>吉林</li>
						<li  id=15>新疆</li>
						<li  id=16>西藏</li>
						<li  id=17>青海</li>
						<li  id=18>山西</li>
						<li  id=19>陕西</li>
						<li  id=20>云南</li>
						<li  id=21>重庆</li>
						<li  id=22>天津</li>
						<li  id=23>贵州</li>
						<li  id=24>甘肃</li>
						<li  id=25>宁夏</li>
						<li  id=26>海南</li>
						<li  id=27>福建</li>
						<li  id=28>安徽</li>
						<li  id=29>江西</li>
						<li  id=30>黑龙江</li>
						<li  id=31>内蒙古</li>
						<li  id=32>港澳台</li>
						<li  id=33>全部</li>
					</ul>
				</td>
				<script type=text/javascript>
				
					$(function() {

						$("#areaul li").click(function() {

							$(this).siblings('li').removeClass('selected'); // 删除其他兄弟元素的样式

							$(this).addClass('selected'); // 添加当前元素的样式
							area=$(this).text();
							console.log("area"+area);
						});
					});

				</script>

			</tr>
			<tr>
				<td class="option">按性质</td>
				<td class="section">
					<ul class="text" id="nature">
						<li  id=34>综合</li>
						<li  id=35>理工</li>
						<li  id=36>财经</li>
						<li  id=37>农业</li>
						<li  id=38>政法</li>
						<li  id=39>医药</li>
						<li  id=40>民族</li>
						<li  id=41>林业</li>
						<li  id=42>师范</li>
						<li  id=43>体育</li>
						<li  id=44>语言</li>
						<li  id=45>艺术</li>
						<li  id=46>军事</li>
					</ul>
				</td>
				<script type=text/javascript>
				
				$(function() {

					$("#nature li").click(function() {

						$(this).siblings('li').removeClass('selected'); // 删除其他兄弟元素的样式

						$(this).addClass('selected'); // 添加当前元素的样式
						nature=$(this).text();;
					});

				});

			</script>
					</script>
			</tr>
			<tr>
				<td class="option">按类型</td>
				<td class="section">
					<ul class="text" id="genre">
						<li  id='a1'>本科</li>
						<li  id='a2'>专科</li>
						<li  id='a3'>独立学院</li>
						<li  id='a4'>教育部直属</li>
						<li  id='a5'>985</li>
						<li  id='a6'>211</li>
						<li  id='a7'>民办高校</li>
					</ul>
				</td>
				<script type=text/javascript>
				
					$(function() {

						$("#genre li").click(function() {

							$(this).siblings('li').removeClass('selected'); // 删除其他兄弟元素的样式

							$(this).addClass('selected'); // 添加当前元素的样式
							genre=$(this).text();
						});

					});
				</script>
			</tr>

			<script>
			$(function() {

				$(".text li").click(function() {
					console.log(area+nature+genre)
					var xmlhttp;
					
					if (window.XMLHttpRequest) {
						xmlhttp = new XMLHttpRequest();
					} else {
						xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
					}
					xmlhttp.onreadystatechange = function() {
						if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
							var str = xmlhttp.responseText;
							
							
							var table=document.getElementById("looktable");  
							var len=table.rows.length;  
							for(var i=0;i<len;i++){  
							    table.deleteRow(0);
							} 
							
							var x = document.getElementById('looktable').insertRow(0);
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
							
							obj=eval(str);
							console.log(obj);

							for (var i = 0; i < obj.length; i++) {
								var x = document.getElementById('looktable').insertRow(i + 1);
								var c_name = x.insertCell(0);
								c_name.align = "center";

								var address = x.insertCell(1);
								address.align = "center";

								var nature = x.insertCell(2);
								nature.align = "center";

								var genre = x.insertCell(3);
								genre.align = "center";

								var phonenum = x.insertCell(4);
								phonenum.align = "center";

								var prfile = x.insertCell(5);
								prfile.align = "center";

								var introduce = x.insertCell(6);
								introduce.align = "center";

								c_name.innerHTML ='<h4>'+obj[i].c_name+'</h4>';
								address.innerHTML = obj[i].address;
								nature.innerHTML = obj[i].nature;
								genre.innerHTML = obj[i].genre;
								phonenum.innerHTML = obj[i].phonenum;
								prfile.innerHTML ='<a href='+ obj[i].prfile + '>'+obj[i].prfile + '</a>';
								introduce.innerHTML =obj[i].introduce;
							}
							
						}
					}
						xmlhttp.open("POST", "../jsp/lookforCollege.jsp", true);
						xmlhttp.setRequestHeader("Content-type",
								"application/x-www-form-urlencoded");
						xmlhttp.send("area=" + area + "&nature="
								+ nature + "&genre=" + genre);
					
				});
			});
				

			</script>

		</table>
		<div id="lookright">
			<h3>高考快讯</h3>
			<ul>
				<li><a href="">山东省高考人数较往年有所降低</a></li>
				<li><a href="">教育部：今年将有超过200所学校扩招</a></li>
				<li><a href="http://edu.qq.com/a/20160829/014521.htm#p=1">逆天神巧合
						准大学生同名同校高考同分</a></li>
				<li><a href="http://edu.qq.com/a/20160909/020378.htm">高校军训比叠被子
						8分钟叠“豆腐块”(图)</a></li>
			</ul>
		</div>
	</div>
	<hr
		style="width: 1000px; height: 1px; border: none; border-top: 1px dashed #0066CC; margin-top: 20px" />
	<div id="lookbottom">
		<table id="looktable" border="1px" cellspacing="0" cellpadding="0">
			<%
			try{
				request.setCharacterEncoding("UTF-8");
				String area = request.getParameter("area");
				String nature = request.getParameter("nature");
				String genre = request.getParameter("genere");
				
				String sql = null;
				if (area != null) {
					if (area.equals("全部")) {
						sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
								+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num ";
					} else {
						sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
								+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num "
								+ "WHERE s_name=\"" + area + "\";";
					}
				}
				else if(nature!=null){
					sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
							+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num "
							+ "WHERE nature=\"" + nature + "\";";
				}
				else if(genre!=null){
					if(genre.equals("本科")){
						sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
								+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num "
								+ "WHERE Bachelor=0;";
					}
					else if(genre.equals("专科")){
						sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
								+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num "
								+ "WHERE Bachelor=1;";
					}
					else{
						sql = "SELECT c_name,address,nature,genre,phonenum,PROFILE,introduce "
								+ "FROM province_num NATURAL JOIN college_message NATURAL JOIN college_num "
								+ "WHERE genre=\"" + genre + "\";";
					}
					
				}
// 				System.out.println("sql=" + sql);
				ResultSet rs = new selectService().select(sql);
// 				System.out.println("rs=" + rs);
				JsonArray array = new JsonArray();
				while (rs.next()) {
					JsonObject object = new JsonObject();
					object.addProperty("c_name", rs.getString(1));
					object.addProperty("address", rs.getString(2));
					object.addProperty("nature", rs.getString(3));
					object.addProperty("genre", rs.getString(4));
					object.addProperty("phonenum", rs.getString(5));
					object.addProperty("prfile", rs.getString(6));
					object.addProperty("introduce", rs.getString(7));
					array.add(object);
				}
			
			%>
			<script>
				
				var x = document.getElementById('looktable').insertRow(0);
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
				
				var len=<%= array.size()%>;
// 				console.log("array.size()="+len);
				
				for (var i = 0; i < len; i++) {
					var x = document.getElementById('looktable').insertRow(
							i + 1);
					var c_name = x.insertCell(0);
					c_name.align = "center";

					var address = x.insertCell(1);
					address.align = "center";

					var nature = x.insertCell(2);
					nature.align = "center";

					var genre = x.insertCell(3);
					genre.align = "center";

					var phonenum = x.insertCell(4);
					phonenum.align = "center";

					var prfile = x.insertCell(5);
					prfile.align = "center";

					var introduce = x.insertCell(6);
					introduce.align = "center";

					c_name.innerHTML ='<h4>'+<%=array%>[i].c_name+'</h4>';
					address.innerHTML = <%=array%>[i].address;
					nature.innerHTML = <%=array%>[i].nature;
					genre.innerHTML = <%=array%>[i].genre;
					phonenum.innerHTML = <%=array%>[i].phonenum;
					prfile.innerHTML ='<a href='+ <%=array%>
				[i].prfile + '>'
							+
			<%=array%>
				[i].prfile + '</a>';
					introduce.innerHTML =
			<%=array%>
				[i].introduce;

				}
			</SCRIPT>
			<%
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					new Database().close();
				}
			%>
		</table>

		<!--控制与底部的距离使用-->
		<div style="height: 80px;"></div>
	</div>

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
				<td>Copyright&copy;2016sdu GaoLi版权所有</td>
			</tr>
		</table>
	</footer>
</body>
</html>






