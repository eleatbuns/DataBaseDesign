/**
 * Created by gaoli on 16-7-25.
 */
function checkRegistername() {
    var reginame = document.getElementById("reginame");
    var name = reginame.value;
    var patty = /[^a-zA-Z0-9]/g;
    if (name.match(patty) != null) {
        alert("您输入的用户名中含有非法字符，请重新输入");
        reginame.value="";
    }
}

function checkConfirmPWD() {
    var passwd = document.getElementById("password");
    var pwd1=passwd.value;
    var confirmpwd = document.getElementById("confirmpwd");
    var pwd2=confirmpwd.value;
    if (pwd1!=pwd2) {
        alert("您两次输入的密码内容不一致，请重新输入");
        confirmpwd.value="";
    }
}


function checklogname() {
    var logname = document.getElementById("logname");
    var name = logname.value;
    var patty = /[^a-zA-Z0-9]/g;

    if (name.match(patty) != null) {
        alert("您输入的用户名中含有非法字符，请重新输入");
        logname.value="";
    }
}

