/**
 * Created by GaoLi on 16-7-25.
 */
function province_option(id) {
    var pro_array = ["北京", "上海", "山东", "天津", "重庆", "河北", "河南", "四川", "山西", "安徽",
        "江西", "江苏", "浙江", "湖北", "湖南", "广东", "广西", "云南", "福建", "贵州", "陕西", "青海",
        "宁夏", "吉林", "辽宁", "西藏", "黑龙江","新疆", "内蒙古", "海南", "甘肃"];
  
    	var ops=document.getElementById(id);
    	for (var i = 0; i < pro_array.length; i++) {
			 var opt=new Option(pro_array[i],pro_array[i]);
			ops.options[i]=opt;
		    }
		 ops.selectedIndex=0;
}

function Gradelineoption(id) {
    var pro_array = ["北京", "上海", "山东", "天津", "重庆", "河北", "河南", "四川", "山西", "安徽",
        "江西", "江苏", "浙江", "湖北", "湖南", "广东", "广西", "云南", "福建", "贵州", "陕西", "青海",
        "宁夏", "吉林", "辽宁", "西藏", "黑龙江","新疆", "内蒙古", "海南", "甘肃"];
  
    	var ops=document.getElementById(id);
//		ops.options.length = 0;
    	for (var i = 0; i < pro_array.length; i++) {
			 var opt=new Option(pro_array[i],pro_array[i]);
			ops.options[i]=opt;
		    }
		 ops.selectedIndex=0;
		 selectLineyear();
		 
}


function city_list() {
    var city = document.getElementsByClassName("city_list");
    var pro_array = ["北京", "上海", "山东", "天津", "重庆", "河北", "河南", "四川", "山西", "安徽",
        "江西", "江苏", "浙江", "湖北", "湖南", "广东", "广西", "云南", "福建", "贵州", "陕西", "青海",
        "宁夏", "吉林", "辽宁", "西藏", "新疆", "海南", "甘肃", "黑龙江", "内蒙古", "港澳台", "全部"];
    for (var i = 0; i < pro_array.length; i++) {
        document.write('<a href="lookforCollege.jsp?area='+pro_array[i]+'" target="_blank" >'+ pro_array[i] + '</a>');
    }
}

function selectLineyear(){
	var province=document.getElementById("provinceline").value;
//	console.log("province="+province);
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
			var array=str.split(",");
//			console.log(str);
			var ops=document.getElementById("yearline");
			ops.options.length = 0;
			 for (var i = 1; i < array.length; i++) {
				 var yearline=document.getElementById("yearline")
				 yearline.options[i-1]=new Option(array[i],array[i]);
			    }

			 ops.selectedIndex=array.length-2;
			 str=null;
			 showmessage();
		}
	}
	xmlhttp.open("POST","../jsp/selectYear.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("province="+ province);
}

function college_num() {
	var xmlhttp;
	var obj = document.getElementById("schoolPro").value;
//	console.log("str="+str);
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4
				&& xmlhttp.status == 200) {
			var str=xmlhttp.responseText;
			var array=str.split(",");
			document.getElementById("college_name").options.length = 0;
			 for (var i = 0; i < array.length; i++) {
				 var yearline=document.getElementById("college_name")
				 yearline.options[i]=new Option(array[i],array[i]);
//				 var opt=new Option(array[i],array[i]);
//				 document.getElementById("college_name").options[i]=opt;
			    }
			 document.getElementById("college_name").selectedIndex=0;
			 schoolMessYear()
			 str=null;
		}
	}
	xmlhttp.open("POST","../jsp/CollegeName.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("province="+ obj);
}

function showmessage() {
	var xmlhttp;
	var province = document.getElementById("provinceline").value;
	var year = document.getElementById("yearline").value;
//	 		console.log("yearhahah="+year);			
	if (window.XMLHttpRequest) {
		//code for IE7+,firefox,chrome
		xmlhttp = new XMLHttpRequest();
	} else {//code for IE5,IE6
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4
				&& xmlhttp.status == 200) {
			var str = xmlhttp.responseText;
//				console.log(str);
			var arr = str.split(",");

			document.getElementById("science1").innerHTML = arr[0];
			document.getElementById("science2").innerHTML = arr[1];
			document.getElementById("science3").innerHTML = arr[2];
			document.getElementById("liberal1").innerHTML = arr[3];
			document.getElementById("liberal2").innerHTML = arr[4];
			document.getElementById("liberal3").innerHTML = arr[5];
		}

	}
	xmlhttp.open("POST","../jsp/gradeline.jsp",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("provinceLine="+ province+ "&yearLine=" + year);
}

function  submitSchool(){
	var examPro= document.getElementById("examPro").value;
	var gradeYear= document.getElementById("gradeYear").value;
	var college_name=document.getElementById("college_name").value;
	
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
//	console.log("hi");
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4&&xmlhttp.status==200){
			var str=xmlhttp.responseText;
//			console.log(str)
			var obj=eval("("+str+")");
//			console.log(obj.length);
			document.getElementById("alertWin").style.display="block";
			document.getElementById("collegeName").innerHTML=obj[0].c_name;
			document.getElementById("ProName").innerHTML=obj[0].s_name;
			
			var x=document.getElementById('alertTable').insertRow(0);
			var c_name=x.insertCell(0);
			var s_name=x.insertCell(1);
			var year=x.insertCell(2);
			var science=x.insertCell(3);
			var liberal=x.insertCell(4);
			c_name.innerHTML="大学名称";
			s_name.innerHTML="省份名称";
			year.innerHTML="考试年份";
			science.innerHTML="理科分数线";
			liberal.innerHTML="文科分数线";

			for (var i = 0; i <obj.length; i++) {
				var x=document.getElementById('alertTable').insertRow(i+1);
				var c_name=x.insertCell(0);
				c_name.align="center";
				var s_name=x.insertCell(1);
				s_name.align="center";
				var year=x.insertCell(2);
				year.align="center";
				var science=x.insertCell(3);
				science.align="center";
				var liberal=x.insertCell(4);
				liberal.align="center";
				c_name.innerHTML=obj[i].c_name;
				s_name.innerHTML=obj[i].s_name;
				year.innerHTML=obj[i].year;
				science.innerHTML=obj[i].science;
				liberal.innerHTML=obj[i].liberal;
//				console.log("obj.c_name="+obj[i].c_name);
			}
		}
	}
	xmlhttp.open("POST","../jsp/CollegeLine.jsp",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("examPro="+examPro+"&gradeYear="+gradeYear+"&college_name="+college_name);
}

function schoolMessYear(){
	var birthPro=document.getElementById("examPro").value;
	var schoolname=document.getElementById("college_name").value;
//	console.log("schoolname="+schoolname);
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
			var array=str.split(",");
//			console.log(array);
			document.getElementById("gradeYear").options.length = 0;
			 var opt=new Option("全部","全部");
			 document.getElementById("gradeYear").options[0]=opt;
			 for (var i = 0; i < array.length; i++) {
				 var opt=new Option(array[i],array[i]);
				 document.getElementById("gradeYear").options[i+1]=opt;
			    }
//			 document.getElementById("gradeYear").selectedIndex=array.length-1;
			 str=null;
		}
	}
	xmlhttp.open("POST","../jsp/schoolMessYear.jsp", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("birthPro="+ birthPro+"&schoolname="+schoolname);
}

function Alertclose() {
	document.getElementById("alertWin").style.display="none";
	var table=document.getElementById("alertTable");  
	var len=table.rows.length;  
	for(var i=0;i<len;i++){  
	    table.deleteRow(0);
	}
}

function Close() {
	document.getElementById("gradeAlert").style.display="none";
	var table=document.getElementById("Table");  
	var len=table.rows.length;  
	for(var i=0;i<len;i++){  
	    table.deleteRow(0);
	} 
}


