/**
 * Created by gaoli on 2016.9.15.
 */
function ajaxschool(schoolid) {
    var schoolname=document.getElementById(schoolid).value;
    
    var xmlhttp;
    
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var str = xmlhttp.responseText;
            
            var lab=document.getElementById(schoolid);
           
            var labPar=lab.parentNode;
     
            var labnext=labPar.nextSibling.nextSibling;
            
            labnext.innerHTML=str;
        }
    }

    xmlhttp.open("POST", "../jsp/school.jsp", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("schoolname=" + schoolname);

}
function ajaxmajor(major) {
    var majormess=document.getElementById(major).value;
    var xmlhttp;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var str = xmlhttp.responseText;
       
            var lab=document.getElementById(major);
            
            var labPar=lab.parentNode;
     
            var labnext=labPar.nextSibling.nextSibling.nextSibling;
            
            labnext.innerHTML=str;
        }
    }

    xmlhttp.open("POST", "../jsp/major.jsp", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("majormess=" + majormess);
}

function ajaxApplication_mess(){
	var major11 = document.getElementById('major11').value;
	var major12 = document.getElementById('major12').value;
	var major13 = document.getElementById('major13').value;
	var major21 = document.getElementById('major21').value;
	var major22 = document.getElementById('major22').value;
	var major23 = document.getElementById('major23').value;
	var major31 = document.getElementById('major31').value;
	var major32 = document.getElementById('major32').value;
	var major33 = document.getElementById('major33').value;
	console.log("major1="+major11)
	var xmlhttp;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var str = xmlhttp.responseText;
            console.log(str);
            if(str==1){
            	showInfo();
            }
            
        }
    }
    xmlhttp.open("POST", "../jsp/insertAppMess.jsp", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("major11=" + major11+"&major12=" + major12+"&major13=" + major13+
    		"&major21=" + major21+"&major22=" + major22+"&major23=" + major23+
    		"&major31=" + major31+"&major32=" + major32+"&major33=" + major33);

}

function showInfo() {
	
	document.getElementById("tableAlert").style.display="block";
	console.log(document.getElementById("school1").value);
	document.getElementById("alertschool1").innerHTML=document.getElementById("school1").value;
	document.getElementById("alertschool2").innerHTML=document.getElementById("school2").value;
	document.getElementById("alertschool3").innerHTML=document.getElementById("school3").value;
	
	document.getElementById("schName1").innerHTML=
		document.getElementById("school1").parentNode.nextSibling.nextSibling.innerText;
	document.getElementById("schName2").innerHTML=
		document.getElementById("school2").parentNode.nextSibling.nextSibling.innerText;
	document.getElementById("schName3").innerHTML=
		document.getElementById("school3").parentNode.nextSibling.nextSibling.innerText;
	
	document.getElementById("majorid1").innerHTML=document.getElementById("major11").value;
	document.getElementById("majorid2").innerHTML=document.getElementById("major12").value;
	document.getElementById("majorid3").innerHTML=document.getElementById("major13").value;
	document.getElementById("majorid4").innerHTML=document.getElementById("major21").value;
	document.getElementById("majorid5").innerHTML=document.getElementById("major22").value;
	document.getElementById("majorid6").innerHTML=document.getElementById("major23").value;
	document.getElementById("majorid7").innerHTML=document.getElementById("major31").value;
	document.getElementById("majorid8").innerHTML=document.getElementById("major32").value;
	document.getElementById("majorid9").innerHTML=document.getElementById("major33").value;
	
	document.getElementById("majorNa1").innerHTML=
		document.getElementById("major11").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa2").innerHTML=
		document.getElementById("major12").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa3").innerHTML=
		document.getElementById("major13").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa4").innerHTML=
		document.getElementById("major21").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa5").innerHTML=
		document.getElementById("major22").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa6").innerHTML=
		document.getElementById("major23").parentNode.nextSibling.nextSibling.nextSibling.innerText	
	document.getElementById("majorNa7").innerHTML=
		document.getElementById("major31").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa8").innerHTML=
		document.getElementById("major32").parentNode.nextSibling.nextSibling.nextSibling.innerText
	document.getElementById("majorNa9").innerHTML=
		document.getElementById("major33").parentNode.nextSibling.nextSibling.nextSibling.innerText
}




