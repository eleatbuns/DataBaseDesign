<%@page import="java.util.ArrayList"%>
<%@page import="operation.selectService"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>高考π——管理员用户</title>
	<link href="../img/icon.ico" rel="shortcut icon" />
	<link rel="stylesheet" type="text/css" href="../css/indexcss/head.css" />
	<link rel="stylesheet" type="text/css" href="../css/indexcss/foot.css" />
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="../css/ManagerCss.css" />
	<script type="text/javascript" src="../js/manager.js"></script>
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
						<li><a href=""><img src="../img/grade.png"
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
					String username = (String) request.getSession().getAttribute("username");
					if (nickname != null) {
						out.println("<script>document.getElementById(\"logAndReg\").innerHTML=\"" + nickname + "\";</script>");
					}else {
						out.println("<script>window.onload=alert('当前您还未登录，请先登录再进行操作');location.href='login.html'</script>");
					}
				%>
			</tr>
		</table>
	</div>
		<hr style="border-top: 0 #C7FFED dotted" />
	<div class="container" >

		<div class="mid" onclick='displaydiv("firstdiv")' >
			<h3>添加管理员</h3>
		</div>
		<div class="mid" onclick='displaydiv("seconddiv")'>
			<h3>更改用户信息</h3>
		</div>
		<div class="mid"  onclick='displaydiv("thirddiv")'>
			<h3>更改学校信息</h3>
		</div>
		<div class="mid"  onclick='displaydiv("fourthdiv")'>
			<h3>更改分数信息</h3>
		</div>
		<div class="delself" id="delself">
		<label onclick="delSelf()">删除管理</label>
		</div>
		
		<script type="text/javascript">
			function delSelf(){
				var xmlhttp;
				var name="<%=username%>";
				console.log("name="+name);
				if (window.XMLHttpRequest) {
					xmlhttp = new XMLHttpRequest();
				} else {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4
							&& xmlhttp.status == 200) {
						var obj=xmlhttp.responseText;
						console.log(obj);
						if(obj==1){
							window.location="index.jsp";
							alert("管理员用户删除成功");
						}
						
					}
				}
				xmlhttp.open("POST","../jsp/delSelf.jsp", true);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("name="+name);
			}
		</script>
	</div>
	
<hr />
	<div class="divider">
<!-- 	第一个管理员功能 -->
		<div class="manager" id="firstdiv">
			<h4>管理员先生，你好，欢迎添加新的管理员用户</h4>
			<form method="post" action="../jsp/managerReg.jsp">
				<label class="label-warning"> 管理用户名：<input type="text" name="managerId" id="manId" onkeyup="regManager()"onblur="checkName()"></label><br />
				<label class="label-warning"> 管理员姓名：<input type="text" name="managerName"></label><br />
				<label class="label-warning"> 管理员密码：<input type="password" name="managerPwd" id="managerPwd"></label><br/>
				<label class="label-warning"> 确认该密码：<input type="password" name="confirmPwd" id="confirmPwd" onchange="checkConfirmPWD()"></label><br />
				<input type="submit" class="addMan" value="提交" />
			</form>
			<div id="warning">
				<p >*您输入的用户名已存在，请重新输入</p>
			</div>
		</div>
<!-- 		第二个管理员功能 -->
		<div class="userMess" id="seconddiv">
			
			<%
			String sql="select username,nickname from login_message where power=0";
			ResultSet rsResultSet=new selectService().select(sql);
			ArrayList<String> list=new ArrayList<String>();
			while(rsResultSet.next()){
				list.add(rsResultSet.getString(1));
			}
		%>
		<script type="text/javascript">
 			window.onload=function usermessage(){ 
				var Useroption=document.getElementById("Useroption"); 
				Useroption.options.length=0;
 				<%
 				
 					for(int i=0;i<list.size();i++){
 						String a=list.get(i);
 						out.println("Useroption.options.add(new Option(\""+a+"\",\""+a+"\"));");
 					}
 				%>
 			} 
		</script>
		
			<h3>用户信息查看与删除</h3>
			<form>
				<label>请输入用户名查找用户:<input type="text" id="selUser">
				<input type="button" value="确定" style="width:80px" onclick="ajaxselect()">
				<input type="button" value="重置" style="width:80px" onclick="usermessage()">
				
				<input type="button" value="删除" style="width:80px" onclick="delUser()"></label><br/>
				<select id="Useroption" size=8 onchange="ajaxlookuserMes()"></select>
				<div class="Messoption">
					<h4>用户昵称：<label id="usernick"></label></h4>
					<br/>
					<h5>志愿填报情况</h5>
					<p>第一志愿：<label id="firstinfo"></label></p>
					<p>第二志愿：<label id="secondinfo"></label></p>
					<p>第三志愿：<label id="thirdinfo"></label></p>
				</div>
			</form>
		</div>
		
		
		
<!-- 		第三个管理员功能 -->
		<div class="changeschool" id="thirddiv">
			<h3>更改学校信息</h3>
			<div class="scdiv1" onclick="updateSCMess()"><h4>更新学校信息</h4></div>
			<div class="scdiv1" onclick="insertSCMess()"><h4>增加学校</h4></div>
			<div class="scdiv1" onclick="delSchool()"><h4>删除学校</h4></div>
			<div class="indiv">
				<form>
					<table style="margin: 0 auto;text-align: left;"  >
						<tr>
							<td><label>学校编号：<input type="text" id="scnum" onblur="retSchoolMess(this.id)"></label></td>
							<td><label>学校名称：<input type="text" id="scname" ></label></td>
						</tr>
						<tr>
						<td><label>省份编号：<input type="text" id="scpronum"></label></td>
						<td><label>本专科代号：<input type="text" id="Bacnum"></label></td>
						</tr>
						<tr>
						<td><label>具体地址：<input type="text" id="newaddress"></label></td>
						<td><label>学校性质：<input type="text" id="scNature"></label></td>
						</tr>
						<tr>
						<td><label>学校类型：<input type="text" id="sctype"></label></td>
						<td><label>学校电话：<input type="text" id="scPhone"></label></td>
						
						</tr>
						<tr>
						<td><label>学校主页：<input type="text" id="scprofile"></label></td>
						<td colspan="">
							<table style="margin: 0 auto">
								<tr>
								<td valign="middle"><label>学校简介:</label></td>
								<td><textarea rows="2" cols="40" id="scintro"></textarea></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					<label><input type="button" value="更新" style="width:100px;" onclick="updateSCMess()"></label>
					<label><input type="button" value="增加" style="width:100px;" onclick="insertSCMess()"></label>
					<label><input type="button" value="删除" style="width:100px;" onclick="delSchool()"></label>
				</form>

			</div>
		</div>
		
		<div class="changegrade" id="fourthdiv">
			<h3>更改分数线信息</h3>
			<div class="scdiv1" onclick='displaydiv("indiv1")'><h4>批次控制线</h4></div>
			<div class="scdiv1" onclick='displaydiv("indiv2")'><h4>大学录取线</h4></div>
			<div class="indiv">
				<div id="indiv1">
					<form>
					<table style="margin: 0 auto;text-align:center;"  >
						<tr>
							<td><label>省份编号：<input type="text" id="pronum" onblur="selectgrade()"></label></td>
							<td><label>年份：<input type="text" id="yearpro" onblur="selectgrade()"></label></td>
						</tr>
						<tr>
							<td><label>理科</label></td>
							<td><label>文科</label></td>
						</tr>
						<tr>
						<td><label>一批分数线：<input type="text" id="scg1"></label></td>
						<td><label>一批分数线：<input type="text" id="lib1"></label></td>
						</tr>
						<tr>
						<td><label>二批分数线：<input type="text" id="scg2"></label></td>
						<td><label>二批分数线：<input type="text" id="lib2"></label></td>
						</tr>
						<tr>
						<td><label>三批分数线：<input type="text" id="scg3"></label></td>
						<td><label>三批分数线：<input type="text" id="lib3"></label></td>
						</tr>
					</table>
					<label><input type="button" value="更新" style="width:100px;" onclick="updateGradeline()"></label>
					<label><input type="button" value="增加" style="width:100px;" onclick="insertGradeline()"></label>
					<label><input type="button" value="删除" style="width:100px;" onclick="deleteGradeLine()"></label>
				</form>
				</div>
				
				<div id="indiv2">
					<form>
					<table style="margin: 0 auto;text-align:center;"  >
						<tr>
							<td><label>学校编号：<input type="text" style="width:100px;" id="schoolnum" onblur="selschoolLine()"></label></td>
							<td><label>年份：<input type="text" style="width:50px;" id="yearschool" onblur="selschoolLine()"></label></td>
							<td><label>生源地编号：<input type="text" style="width:100px;" id="birthnum" onblur="selschoolLine()"></label></td>
							
						</tr>
						<tr>
							<td colspan="3"><label>理科录取线：<input type="text" id="scienceline"></label></td>
						</tr>
						<tr>
							<td colspan="3"><label>理科名次：<input type="text" id="sciencerank"></label></td>
						</tr>
						<tr>
							<td colspan="3"><label>文科录取线：<input type="text" id="liberaline"></label></td>
						</tr>
						<tr>
							<td colspan="3"><label>文科名次：<input type="text" id="liberalrank"></label></td>
						</tr>
					</table>
					<label><input type="button" value="更新" style="width:100px;" onclick="updateschooline()"></label>
					<label><input type="button" value="增加" style="width:100px;" onclick="insertschooline()"></label>
					<label><input type="button" value="删除" style="width:100px;" onclick="deleteschooline()"></label>
				</form>
				</div>
			</div>
				
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