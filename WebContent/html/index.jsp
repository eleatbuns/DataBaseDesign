<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>

<title>高考π</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<link href="../img/icon.ico" rel="shortcut icon" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/head.css" />
<link rel="stylesheet" type="text/css" href="../css/indexcss/foot.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/indexbody.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/bodyleft.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/bodyright.css" />
<link rel="stylesheet" type="text/css"
	href="../css/indexcss/alertwindow.css" />

<script src="../js/option.js"></script>
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
	<!--主体部分-->
	<table class="tabletitle">
		<!-- 上部图片 -->
		<tr>
			<td id="top" colspan="2">
				<div id="bodytop">
					<a href="application.jsp" target="_blank">
						<ul id="toppic">
							<li><img src="../img/yuanxing.png" alt="圆形" /></li>
							<li><img class="pic1" src="../img/moni.png" alt="志愿模拟" /></li>
							<li><label>志愿模拟</label></li>
						</ul>
					</a> <a href="choiceSchool.jsp?province=&grade=&mingci=&Schprovince=&wenli=" target="_blank">
						<ul id="secpic">
							<li><img src="../img/yuanxing.png" alt="圆形" /></li>
							<li><img class="pic2" src="../img/gujigrade.png" alt="成绩评估" /></li>
							<li><label>成绩评估</label></li>
						</ul>
					</a> <a href="" target="_blank">
						<ul id="thipic">
							<li><img src="../img/yuanxing.png" alt="圆形" /></li>
							<li><img class="pic3" src="../img/download.png" alt="资料下载" /></li>
							<li><label>资料下载</label></li>
						</ul>
					</a>
				</div>
			</td>
		</tr>
		<tr>
			<!-- 中部左半边 -->
			<td>
				<div id="bodyleft">
					<!-- 左半边上部看大学 -->
					<table class="lefttable">
						<caption>
							<label><a name="position" id="position">高考院校库</a></label>
						</caption>
						<tr>
							<td class="option">按地区</td>
							<td class="section city_list"><script>
								city_list();
							</script></td>
						</tr>
						<tr>
							<td class="option">按性质</td>
							<td class="section"><a href="lookforCollege.jsp?nature=综合"
								target="_blank">综合</a><a href="lookforCollege.jsp?nature=理工"
								target="_blank">理工</a><a href="lookforCollege.jsp?nature=财经"
								target="_blank">财经</a><a href="lookforCollege.jsp?nature=农业"
								target="_blank">农业</a><a href="lookforCollege.jsp?nature=政法"
								target="_blank">政法</a><a href="lookforCollege.jsp?nature=医药"
								target="_blank">医药</a><a href="lookforCollege.jsp?nature=民族"
								target="_blank">民族</a><a href="lookforCollege.jsp?nature=林业"
								target="_blank">林业</a><a href="lookforCollege.jsp?nature=师范"
								target="_blank">师范</a><a href="lookforCollege.jsp?nature=体育"
								target="_blank">体育</a><a href="lookforCollege.jsp?nature=语言"
								target="_blank">语言</a><a href="lookforCollege.jsp?nature=艺术"
								target="_blank">艺术</a> <a href="lookforCollege.jsp?nature=军事"
								target="_blank">军事</a></td>
						</tr>
						<tr>
							<td class="option">按类型</td>
							<td class="section"><a href="lookforCollege.jsp?genere=本科"
								target="_blank">本科</a><a href="lookforCollege.jsp?genere=专科"
								target="_blank">专科</a><a href="lookforCollege.jsp?genere=独立学院"
								target="_blank">独立学院</a> <a href="lookforCollege.jsp?genere=教育部直属"
								target="_blank">教育部直属</a> <a href="lookforCollege.jsp?genere=985"
								target="_blank">985</a><a href="lookforCollege.jsp?genere=211"
								target="_blank">211</a></td>
						</tr>
					</table>
					<hr
						style="height: 1px; border: none; border-top: 1px dashed #0066CC;" />
					<!-- 左半边下部分数线 -->
					<form method="post" action="../jsp/gradeline.jsp" name=form
						id="gradeline">
						<table class="lefttable">
							<caption>分数线</caption>
							<tr>
								<td class="provinceyear"><label>省份： <select
										name="provinceLine" id="provinceline" class="province"
										onchange="showmessage()">       
											<script>Gradelineoption("provinceline");</script> 
									</select>
								</label></td>
								<td class="wenli"><label>理科</label></td>
								<td class="grade"><label>&nbsp;&nbsp;一批：<span
										id="science1"></span>
								</label> <label>&nbsp;二批：<span id="science2"></span>
								</label> <label>&nbsp;三批：<span id="science3"></span></label></td>

							</tr>
							<tr>
								<td class="provinceyear"><label>年份： <select
										name="yearLine" id="yearline" class="year"
									onchange="showmessage()">
									</select></label></td>
								<td class="wenli"><label>文科</label></td>
								<td class="grade"><label>&nbsp;&nbsp;一批：<span
										id="liberal1"></span>
								</label> <label>&nbsp;二批：<span id="liberal2"></span>
								</label> <label>&nbsp;三批：<span id="liberal3"></span>
								</label></td>
							</tr>
							</tbody>
						</table>
					</form>

					<script type="text/javascript">
						showmessage();
					</script>

				</div>
			</td>
			<!-- 中部右半边上侧估分选大学 -->
			<td valign="top">
				<div id="bodyright">
					<form action="choiceSchool.jsp">
						<table class="righttable" cellpadding="10px">
							<tr>
								<th class="choice">估分选大学</th>
							</tr>
							<tr>
								<td><label>高考省份： <select name="province"
										class="province" id="gaokao">
											<script>province_option("gaokao");</script>
									</select></label></td>
								<td><label>年份：</label>&nbsp;&nbsp;<label><script>
									var date = new Date();
									document.write(date.getYear() + 1900);
								</script>年</label></td>
							</tr>
							<tr>
								<td><label>高考分数： <input type="text" name="grade"
										id="input-grade" maxlength="3" /></label></td>
								<td><label>名次： <input type="text" name="mingci"
										id="input-mingci" maxlength="7" /></label></td>
							</tr>
							<tr>
								<td><label>大学省份： <select name="Schprovince"
										class="province" id="collegeshengfen">
											<script>province_option("collegeshengfen");</script>
									</select></label></td>
								<td><label>文/理： <select name="wenli">
											<option value="文科">文科</option>
											<option value="理科">理科</option>
									</select></label></td>
							</tr>
							<tr>
								<td colspan="2" class="submit"><label><input
										type="submit" value="确定" /></label></td>
							</tr>
						</table>
					</form>
					<hr
						style="height: 1px; border: none; border-top: 1px dashed #476678;" />
					<!-- 中部右半边下侧大学录取线 -->
					<form name="collegeLine">
						<table class="righttable" cellpadding="10px">
							<tr>
								<th class="choice" colspan="2" align="right">大学录取线</th>
							</tr>
							<tr>
								<td><label>高考省份：<select name="examPro"
										class="province" id="examPro">
											<script>province_option("examPro");</script>
									</select></label></td>
								<td><label>年份： <select name="gradeYear"
										class="year" id="gradeYear">
									</select></label></td>
							</tr>
							<tr>
								<td><label>学校省份： <select id="schoolPro"
										name="schoolPro" class="province" onchange="college_num()">
											<script>province_option("schoolPro");</script>
									</select></label></td>
							</tr>
							<tr>
								<td colspan="2"><label>大学名称： <select
										name="college_name" class="collegeName" id="college_name">
											<script type="text/javascript">
												college_num();
											</script>
									</select></label></td>
							</tr>
							<tr>
								<td colspan="3" class="submit"><label><input
										type="button" value="确定" onclick="submitSchool()" /></label></td>
							</tr>
						</table>
					</form>
				</div>
			</td>
		</tr>
	</table>

	<div id="alertWin">
		<div id="truediv">
			<h2 align="center">
				<label id="collegeName"></label>在<label id="ProName"></label>录取分数线</h2>
			
				<table id="alertTable" style="font-size: 20px; text-align:center" cellpadding="8px">
					</table>
				<p id="alertButton">
					<button type="button" onclick="Alertclose()">点击关闭</button>
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
