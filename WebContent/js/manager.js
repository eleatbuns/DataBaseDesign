function regManager(){
	var reginame = document.getElementById("manId");
    var name = reginame.value;
    var patty = /[^a-zA-Z0-9]/g;
    if (name.match(patty) != null) {
        alert("您输入的用户名中含有非法字符，请重新输入");
        reginame.value="";
    }
}

function checkConfirmPWD() {
    var passwd = document.getElementById("managerPwd");
    var pwd1=passwd.value;
    var confirmpwd = document.getElementById("confirmPwd");
    var pwd2=confirmpwd.value;
    if (pwd1!=pwd2) {
        alert("您两次输入的密码内容不一致，请重新输入");
        confirmpwd.value="";
    }
}

function displaydiv(id) {
	var adiv=document.getElementById(id);
//	console.log("id="+id)
	var divs=adiv.parentNode.children;
	 for(var index=0;index<divs.length;index++){
		 if(divs[index]==adiv){
			 divs[index].style.display="block";
		 }
		 else{
			 divs[index].style.display="none";
		 }
	 }
}

function checkName(){
	var xmlhttp;
	var str = document.getElementById("manId").value;
//	console.log("str="+str);
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4
				&& xmlhttp.status == 200) {
			var obj=xmlhttp.responseText;
			if(obj==1){
				document.getElementById("warning").style.display="block";
			}
			else {
				document.getElementById("warning").style.display="none";
			}
			
		}
	}
	xmlhttp.open("POST","../jsp/checkManageName.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("name="+ str);
}

function ajaxselect(){
	var str=document.getElementById("selUser").value;
	var http;

	if (window.XMLHttpRequest) {
		http = new XMLHttpRequest();
	} else {
		http = new ActiveXObject("Microsoft.XMLHTTP");
	}
	http.onreadystatechange = function() {
		if (http.readyState == 4
				&& http.status == 200) {
			var obj=http.responseText;
			if(obj==0){
				alert("该用户不存在");
				document.getElementById("selUser").value="";
			}
			else {
				var Useroption=document.getElementById("Useroption"); 
				Useroption.options.length=0;
				Useroption.options.add(new Option(str,str));
			}
			
		}
	}
	http.open("POST","../jsp/selUser.jsp", true);
	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	http.send("uname="+ str);
}

function ajaxlookuserMes(){
	var username=document.getElementById("Useroption").value;
	
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4
				&& xmlhttp.status == 200) {
			var str=xmlhttp.responseText;
			var obj = eval("("+str+")");
//			console.log(obj[0]);
			document.getElementById("usernick").innerHTML=obj[0].nickname;
			document.getElementById("firstinfo").innerHTML=obj[0].major11+"&nbsp;&nbsp;&nbsp;"+obj[0].major12+"&nbsp;&nbsp;&nbsp;"+obj[0].major13;
			document.getElementById("secondinfo").innerHTML=obj[0].major21+"&nbsp;&nbsp;&nbsp;"+obj[0].major22+"&nbsp;&nbsp;&nbsp;"+obj[0].major23;
			document.getElementById("thirdinfo").innerHTML=obj[0].major31+"&nbsp;&nbsp;&nbsp;"+obj[0].major32+"&nbsp;&nbsp;&nbsp;"+obj[0].major33;
		}
	}
	xmlhttp.open("POST","../jsp/selUserMes.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("name="+ username);
	
}

function delUser(){
	var obj=document.getElementById("Useroption");
	var username=obj.value;
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4
				&& xmlhttp.status == 200) {
			var str=xmlhttp.responseText;
			if(str==1){
				obj.remove(obj.selectedIndex);
				document.getElementById("usernick").innerHTML="";
				document.getElementById("firstinfo").innerHTML="";
				document.getElementById("secondinfo").innerHTML="";
				document.getElementById("thirdinfo").innerHTML="";
				
				alert("用户删除成功");
			}
		}
	}
	xmlhttp.open("POST","../jsp/delUser.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("name="+ username);
}

function retSchoolMess(id){
	var scnum=document.getElementById(id).value;
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4
				&& xmlhttp.status == 200) {
			var str=xmlhttp.responseText;
			var obj = eval("("+str+")");
			
			if(obj!=""){
				document.getElementById("scname").value=obj[0].c_name;
				document.getElementById("scpronum").value=obj[0].s_id;
				document.getElementById("Bacnum").value=obj[0].Bachelor;
				document.getElementById("newaddress").value=obj[0].address;
				document.getElementById("scNature").value=obj[0].nature;
				document.getElementById("sctype").value=obj[0].genre;
				document.getElementById("scPhone").value=obj[0].phonenum;
				document.getElementById("scprofile").value=obj[0].profile;
				document.getElementById("scintro").value=obj[0].introduce;
			}
			else{
				document.getElementById("scname").value="";
				document.getElementById("scpronum").value="";
				document.getElementById("Bacnum").value="";
				document.getElementById("newaddress").value="";
				document.getElementById("scNature").value="";
				document.getElementById("sctype").value="";
				document.getElementById("scPhone").value="";
				document.getElementById("scprofile").value="";
				document.getElementById("scintro").value="";
			}
			}
		}
	xmlhttp.open("POST","../jsp/thirdManagerFun/retSchoolMess.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("scnum="+ scnum);
}

function updateSCMess(){
//	var array=new Array();
	scname=document.getElementById("scname").value;
	scnum=document.getElementById("scnum").value;
	scpronum=document.getElementById("scpronum").value;
	Bacnum=document.getElementById("Bacnum").value;
	newaddress=document.getElementById("newaddress").value;
	scNature=document.getElementById("scNature").value;
	sctype=document.getElementById("sctype").value;
	scPhone=document.getElementById("scPhone").value;
	scprofile=document.getElementById("scprofile").value;
	scintro=document.getElementById("scintro").value;
	
	if(scnum==""){
		alert("请先输入学校编号再进行更新");
	}
	else{
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("学校信息更新成功！");
				}
				else if(str==0){
					alert("省份信息不存在，请重新输入");
				}
				else if(str==2){
					alert("更新数据有错误出现，请检查数据是否规范！");
				}
				
			}
		}
		xmlhttp.open("POST", "../jsp/thirdManagerFun/updateSchoolMess.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("scname="+scname+"&scnum=" + scnum+"&scpronum="+scpronum+"&Bacnum="+Bacnum+"&newaddress="+
				newaddress+"&scNature="+scNature+"&sctype="+sctype+"&scPhone="+scPhone+"&scprofile="+
				scprofile+"&scintro="+scintro);
	}
	

}

function insertSCMess(){
	scname=document.getElementById("scname").value;
	scnum=document.getElementById("scnum").value;
	scpronum=document.getElementById("scpronum").value;
	Bacnum=document.getElementById("Bacnum").value;
	newaddress=document.getElementById("newaddress").value;
	scNature=document.getElementById("scNature").value;
	sctype=document.getElementById("sctype").value;
	scPhone=document.getElementById("scPhone").value;
	scprofile=document.getElementById("scprofile").value;
	scintro=document.getElementById("scintro").value;
	
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var str = xmlhttp.responseText;
			if(str==0){
				alert("学校信息不完善，请完善后再添加");
			}
			else if(str==1){
				alert("添加学校信息成功！");
			}
			else if(str==2){
				alert("该学校信息已添加，请勿重复添加");
			}
			
		}
	}
	xmlhttp.open("POST", "../jsp/thirdManagerFun/insertSchool.jsp", true);
	xmlhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xmlhttp.send("scname="+scname+"&scnum=" + scnum+"&scpronum="+scpronum+"&Bacnum="+Bacnum+"&newaddress="+
			newaddress+"&scNature="+scNature+"&sctype="+sctype+"&scPhone="+scPhone+"&scprofile="+
			scprofile+"&scintro="+scintro);

}

function delSchool() {
	scname=document.getElementById("scname").value;
	scnum=document.getElementById("scnum").value;
	if (scname=="") {
		alert("该学校信息不存在，无法删除");
	}
	else {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				if(str==1){
					alert("学校信息删除成功");
					document.getElementById("scname").value="";
					document.getElementById("scpronum").value="";
					document.getElementById("Bacnum").value="";
					document.getElementById("newaddress").value="";
					document.getElementById("scNature").value="";
					document.getElementById("sctype").value="";
					document.getElementById("scPhone").value="";
					document.getElementById("scprofile").value="";
					document.getElementById("scintro").value="";
				}
				else{
					alert("学校信息不存在，无法删除");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/thirdManagerFun/deleteSchool.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("scnum="+scnum);
	}
}

function selectgrade(){
	var proid=document.getElementById("pronum").value;
	var year=document.getElementById("yearpro").value;
	if(proid!=""&&year!=""){
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				var obj=eval("("+str+")");
				if(obj!=""){
					document.getElementById("scg1").value=obj[0].science1;
					document.getElementById("scg2").value=obj[0].science2;
					document.getElementById("scg3").value=obj[0].science3;
					document.getElementById("lib1").value=obj[0].liberal1;
					document.getElementById("lib2").value=obj[0].liberal2;
					document.getElementById("lib3").value=obj[0].liberal3;
				}
				else{
					document.getElementById("scg1").value="";
					document.getElementById("scg2").value="";
					document.getElementById("scg3").value="";
					document.getElementById("lib1").value="";
					document.getElementById("lib2").value="";
					document.getElementById("lib3").value="";
				}
				
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/selectgrade.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("proid="+proid+"&year="+year);
	}
}

function updateGradeline(){
	var proid=document.getElementById("pronum").value;
	var year=document.getElementById("yearpro").value;
	var scg1=document.getElementById("scg1").value;
	var scg2=document.getElementById("scg2").value;
	var scg3=document.getElementById("scg3").value;
	var lib1=document.getElementById("lib1").value;
	var lib2=document.getElementById("lib2").value;
	var lib3=document.getElementById("lib3").value;
	
	if(proid==""||year==""||scg1==""||lib1==""){
		alert("请先完善相关数据再进行更新")
	}
	else {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("分数线信息更新成功！");
				}
				else if(str==0){
					alert("更新数据有错误出现，请检查数据是否规范！");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/updategradeline.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("proid="+proid+"&year=" + year+"&scg1="+scg1+"&scg2="+scg2+"&scg3="+
				scg3+"&lib1="+lib1+"&lib2="+lib2+"&lib3="+lib2);
	}
}

function insertGradeline(){
	var proid=document.getElementById("pronum").value;
	var year=document.getElementById("yearpro").value;
	var scg1=document.getElementById("scg1").value;
	var scg2=document.getElementById("scg2").value;
	var scg3=document.getElementById("scg3").value;
	var lib1=document.getElementById("lib1").value;
	var lib2=document.getElementById("lib2").value;
	var lib3=document.getElementById("lib3").value;
	
	if(proid==""||year==""||scg1==""||lib1==""){
		alert("请先完善相关数据再进行插入操作");
	}
	else {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("分数线信息添加成功！");
				}
				else if(str==0){
					alert("插入数据有错误出现，请检查数据是否规范！");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/insertgradeline.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("proid="+proid+"&year=" + year+"&scg1="+scg1+"&scg2="+scg2+"&scg3="+
				scg3+"&lib1="+lib1+"&lib2="+lib2+"&lib3="+lib2);
	}
}

function deleteGradeLine(){
	var proid=document.getElementById("pronum").value;
	var year=document.getElementById("yearpro").value;
	if(proid==""||year==""){
		alert("请先完善相关数据再进行删除操作");
	}
	else{
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("删除成功！");
					document.getElementById("scg1").value="";
					document.getElementById("scg2").value="";
					document.getElementById("scg3").value="";
					document.getElementById("lib1").value="";
					document.getElementById("lib2").value="";
					document.getElementById("lib3").value="";
				}
				else if(str==0){
					alert("分数线信息不存在，无法进行删除");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/deletegradeline.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("proid="+proid+"&year="+year);
	}
}

function selschoolLine() {
	var schoolnum=document.getElementById("schoolnum").value;
	var year=document.getElementById("yearschool").value;
	var Birid=document.getElementById("birthnum").value;
	if(schoolnum!=""&&year!=""&&Birid!=""){
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				var obj=eval("("+str+")");
				if(obj!=""){
					document.getElementById("scienceline").value=obj[0].science;
					document.getElementById("liberaline").value=obj[0].liberal;
					document.getElementById("sciencerank").value=obj[0].Srank;
					document.getElementById("liberalrank").value=obj[0].Lrank;
					
				}
				else{
					document.getElementById("scienceline").value="";
					document.getElementById("liberaline").value="";
					document.getElementById("sciencerank").value="";
					document.getElementById("liberalrank").value="";
				
				}
				
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/selectschoolLine.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("schoolnum="+schoolnum+"&year="+year+"&Birid="+Birid);
	}
}

function updateschooline() {
	var schoolnum=document.getElementById("schoolnum").value;
	var year=document.getElementById("yearschool").value;
	var Birid=document.getElementById("birthnum").value;
	
	var scienceline=document.getElementById("scienceline").value;
	var liberaline=document.getElementById("liberaline").value;
	var sciencerank=document.getElementById("sciencerank").value;
	var liberalrank=document.getElementById("liberalrank").value;
	
	if(schoolnum==""||year==""||Birid==""){
		alert("请先完善相关数据再进行更新")
	}
	else {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("大学录取分数线信息更新成功！");
				}
				else if(str==0){
					alert("更新数据有错误出现，请检查数据是否规范！");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/updateschoolline.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("schoolnum="+schoolnum+"&year=" + year+"&Birid="+Birid+
				"&scienceline="+scienceline+"&liberaline="+
				liberaline+"&sciencerank="+sciencerank+"&liberalrank="+liberalrank);
	}
	
}

function insertschooline() {
	var schoolnum=document.getElementById("schoolnum").value;
	var year=document.getElementById("yearschool").value;
	var Birid=document.getElementById("birthnum").value;
	
	var scienceline=document.getElementById("scienceline").value;
	var liberaline=document.getElementById("liberaline").value;
	var sciencerank=document.getElementById("sciencerank").value;
	var liberalrank=document.getElementById("liberalrank").value;	
	
	if(schoolnum==""||year==""||Birid==""){
		alert("请先完善相关数据再进行插入操作");
	}
	else {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("分数线信息添加成功！");
				}
				else if(str==0){
					alert("插入数据有错误出现，请检查数据是否规范！");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/insertschoolline.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("schoolnum="+schoolnum+"&year=" + year+"&Birid="+Birid+
				"&scienceline="+scienceline+"&liberaline="+
				liberaline+"&sciencerank="+sciencerank+"&liberalrank="+liberalrank);
	}
}

function deleteschooline(){
	var schoolnum=document.getElementById("schoolnum").value;
	var year=document.getElementById("yearschool").value;
	var Birid=document.getElementById("birthnum").value;
	
	if(schoolnum==""||year==""||Birid==""){
		alert("请先完善相关数据再进行删除操作");
	}
	else{
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				
				if(str==1){
					alert("删除成功！");
					document.getElementById("scienceline").value="";
					document.getElementById("liberaline").value="";
					document.getElementById("sciencerank").value="";
					document.getElementById("liberalrank").value="";
				}
				else if(str==0){
					alert("分数线信息不存在，无法进行删除");
				}
			}
		}
		xmlhttp.open("POST", "../jsp/fourManagerFun/deleteschooline.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("schoolnum="+schoolnum+"&year="+year+"&Birid="+Birid);
	}
}



