function choiceSchool() {
	var pro = document.getElementById("birthprovince").value;
	var grade = document.getElementById("input-grade").value;
	var rank = document.getElementById("input-mingci").value;
	var scPro = document.getElementById("CollegePro").value;
	var tropism = document.getElementById("tropism").value;
	
	
	
	var xmlhttp;
	
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var str = xmlhttp.responseText;
			
			var table=document.getElementById("schoolTable");  
			var len=table.rows.length;  
			for(var i=0;i<len;i++){  
			    table.deleteRow(0);
			} 
			
			var obj = JSON.parse(str);

			var schoolMess=obj.schoolMess;
			var schoolGrade=obj.schoolGrade;
			var len = schoolMess.length;
			
			var x = document.getElementById('schoolTable').insertRow(0);
			
			var c_name = x.insertCell(0);
			var address = x.insertCell(1);
			var nature = x.insertCell(2);
			var genre = x.insertCell(3);
			var phonenum = x.insertCell(4);
			var profile = x.insertCell(5)
			var introduce = x.insertCell(6)

			c_name.innerHTML = '<h3>大学名称</h3>';
			address.innerHTML = '<h3>学校地址</h3>';
			nature.innerHTML = '<h3>学校性质</h3>';
			genre.innerHTML = '<h3>学校类型</h3>';
			phonenum.innerHTML = '<h3>学校电话</h3>';
			profile.innerHTML = '<h3>学校主页</h3>';
			introduce.innerHTML = '<h3>学校简介</h3>';

			for (var i = 0; i < len; i++) {
				var x = document.getElementById('schoolTable').insertRow(i + 1);
				var c_name = x.insertCell(0);

				var address = x.insertCell(1);

				var nature = x.insertCell(2);

				var genre = x.insertCell(3);

				var phonenum = x.insertCell(4);

				var prfile = x.insertCell(5);

				var introduce = x.insertCell(6);

				 c_name.innerHTML ='<h4>'+schoolMess[i].c_name+'</h4>';
				 address.innerHTML = schoolMess[i].address;
				 nature.innerHTML = schoolMess[i].nature;
				 genre.innerHTML = schoolMess[i].genre;
				 phonenum.innerHTML = schoolMess[i].phonenum;
				 prfile.innerHTML ='<a href='+ schoolMess[i].profile+ '>'
				 		+schoolMess[i].profile + '</a>';
				 introduce.innerHTML =schoolMess[i].introduce;
			}
			
			
			
			$(function() {
				var schoolName;
				$("#schoolTable h4").click(function() {

					$(this).addClass('selected'); // 添加当前元素的样式
					schoolName=$(this).text();
					
//		 			console.log("schoolName"+schoolName);
					var length=schoolGrade.length;
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
						var cname=schoolGrade[i].c_name
//		 				console.log(cname);
						if(cname==schoolName){
								
								var x=document.getElementById('Table').insertRow(time);
								var c_name=x.insertCell(0);
								
								 c_name=x.insertCell(0);
								 year=x.insertCell(1);
								 grade=x.insertCell(2);
								 rank=x.insertCell(3)
								
								c_name.innerHTML=schoolGrade[i].c_name;
								year.innerHTML=schoolGrade[i].year;
								grade.innerHTML=schoolGrade[i].grade;
								rank.innerHTML=schoolGrade[i].rank;
								time++;
//								console.log("obj.c_name="+obj[i].c_name);
							}
						}
						
				});
			});
			
		}

	}
xmlhttp.open("POST", "../jsp/choiceSchoolSub.jsp", true);
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.send("province=" + pro + "&grade=" + grade + "&rank=" + rank
		+ "&scPro=" + scPro + "&tropism=" + tropism);
}



		
		
		
		