<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css">
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript">
	$(function() {
		$("#register").bootstrapValidator({
			feedbackIcons : {
			valid : "glyphicon glyphicon-ok",
			invalid : "glyphicon glyphicon-remove",
			validating : "glyphicon glyphicon-refresh"
		},
		    fields : {
            name : {
            validators : {
            notEmpty : {
            message : '姓名值不能为空！'
        },
            regexp : {
	        regexp : /^[\u0391-\uFFE5]{2,10}$/,
			message : '姓名必须是2-10位汉字'
	    }
            }
            },
			
	        username : {
			validators : {
	        notEmpty : {
	        message : '用户名不能为空'
		},
		regexp : {
		regexp : /^[A-z0-9_]{3,15}$/,
		message : '用户名必须是3-15位数字字母下划线'
		},
		remote:{
		message:'用户名已存在',
		url:'AdminServlet',
		type:'post',//不指定type,默认是get
		data:{
	    action:'validateUserName',
		username:$('input[name=username]').val()
			},
		delay:500
		}
	}
},
		password : {
	        validators : {
	        notEmpty : {
	        message : '密码不能为为空'
		},
		    regexp : {
	        regexp : /^(\w|\w){6,15}$/,
			message : '必须是6-15位数字字母下划线或者特殊字符'
	    }
	        } 
		},
			repassword : {
	        validators : {
	        notEmpty : {
	        message : '确认密码不能为空'
		},
			identical : {
	        field : 'password',
			message : '两次密码不一致'
		 }
	   }
		},
			phone : {
	        validators : {
	        notEmpty : {
	        message : '手机号不能为空'
		 },
		    regexp : {
	        regexp : /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/,
			message : '手机号不合法'
			 }
		   }
		  },
		   touxiang : {
		   validators : {
		   notEmpty : {
		   message : '头像不能为空'
		 },
		  
				 }
			   
			 }
		}
    });
});
</script>
<!--  
<script>
	//1.验证姓名
	function validateName() {
		var name = document.register.name;
		nameReg = /^[\u0391-\uFFE5]{2,10}$/;
		var flag = nameReg.test(name.value);
		var nameMsg = document.getElementById("nameMsg");
		if (flag) {
			nameMsg.style.color = "green";
			nameMsg.innerHTML = "姓名合法";
			return true;
		} else {
			nameMsg.style.color = "red";
			nameMsg.innerHTML = "姓名必须是2-10位汉字";
			name.focus();
			return false;
		}
	}
	//2.验证用户名
	var flag;
	function validateUserName() {	
		var username = document.register.username;
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.open("POST", "AdminServlet", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("action=validateUserName&username=" + username.value);			
		var reg = /^[A-z0-9_]{3,15}$/;
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {//响应成功			
				var content = xmlhttp.responseText;//拿到服务器响应的数据了
				var usernameMsg = document.getElementById("usernameMsg");
				if (content == "0") {//用户名不存在，可以注册						
				//	flag=true;
					 if (reg.test(username.value)) {
							usernameMsg.style.color = "green";
							usernameMsg.innerHTML = "用户名合法";
							flag=true;
						} else {
							usernameMsg.style.color = "red";
							usernameMsg.innerHTML = "必须是3-15位数字字母下划线";
							username.focus();
							flag=false;
						}		 
				}else{//用户名存在，请换一个
					usernameMsg.style.color="red";
					usernameMsg.innerHTML="用户名已存在，请换一个";
					usernameMsg.focus();
					flag= false;
				}
			}			
		}
	}
	//3.验证密码
	function validatePassword() {
		var password = document.register.password;
		var reg = /^(\w|\w){6,15}$/;
		var passwordMsg = document.getElementById("passwordMsg");
		if (reg.test(password.value)) {
			passwordMsg.style.color = "green";
			passwordMsg.innerHTML = "密码合法";
			return true;
		} else {
			passwordMsg.style.color = "red";
			passwordMsg.innerHTML = "必须是6-15位数字字母下划线或者特殊字符";
			password.focus();
			return false;
		}
	}
	//4.确认密码
	function validateRePassword() {
		var password = document.register.password;
		var repassword = document.register.repassword;
		var repasswordMsg = document.getElementById("repasswordMsg");
		if (repassword.value == password.value) {
			repasswordMsg.style.color = "green";
			repasswordMsg.innerHTML = "密码一致";
			return true;
		} else {
			repasswordMsg.style.color = "red";
			repasswordMsg.innerHTML = "密码不一致";
			repassword.focus();
			return false;
		}
	}
	//5.验证手机
	function validatePhone() {
		var phone = document.register.phone;
		var reg = /^1[3-9][0-9]{9}$/;
		var phoneMsg = document.getElementById("phoneMsg");
		if (reg.test(phone.value)) {
			phoneMsg.style.color = "green";
			phoneMsg.innerHTML = "手机号合法";
			return true;
		} else {
			phoneMsg.style.color = "red";
			phoneMsg.innerHTML = "手机号不合法";
			phone.focus();
			return false;
		}
	}
	function jiaoyan() {
		return validateName() && flag && validatePassword()
				&& validateRePassword() && validatePhone();
	}
</script>
-->
</head>
<body background="images/004.jpg">
	<p align="center">
		<font size=7 face="幼圆">欢迎来到注册页面！</font>
	</p>
	<p align="center">
		<font size=6 face="幼圆">Welcome to register page！</font>
	</p>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="register" action="AdminServlet?action=register" enctype="multipart/form-data" method="post">
				<div class="form-group">
						<label>姓名:</label> <input type="text" name="name"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>用户名:</label> <input type="text" name="username"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>密码</label> <input type="password" name="password"
							class="form-control">
					</div>
					<div class="form-group">
						<label>确认密码</label> <input type="password" name="repassword"
							class="form-control">
					</div>
					
					<div class="form-group">
						<label>手机号</label> <input type="text" name="phone"
							class="form-control">
					</div>
					<div class="form-group">
						<label>头像</label> <input type="file" name="touxiang"
							class="form-control">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-danger btn-block">注册</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- <form action="AdminServlet?action=register" method="post"
		name="register" onsubmit="return jiaoyan()"
		enctype="multipart/form-data">
		<table align="center" border=0 width="450px" height="500px">
			<tr align="center">
				<td><font size="5" face="幼圆"><b>姓名:<b></font></td>
				<td><input type="text" name="name" onblur="validateName()" /></td>
				<td><span id="nameMsg"></span></td>
			</tr>
			<tr align="center">
				<td><font size="5" face="幼圆"><b>用户名:<b></font></td>
				<td><input type="text" name="username"
					onblur="validateUserName()" /></td>
				<td><span id="usernameMsg"></span></td>
			</tr>
			<tr align="center">
				<td><font size="5" face="幼圆"><b>密码:<b></font></td>
				<td><input type="text" name="password"
					onblur="validatePassword()" /></td>
				<td><span id="passwordMsg"></span></td>
			</tr>
			<tr align="center">
				<td><font size="5" face="幼圆"><b>确认密码:<b></font></td>
				<td><input type="text" name="repassword"
					onblur="validateRePassword()" /></td>
				<td><span id="repasswordMsg"></span></td>
			</tr>
			<tr align="center">
				<td><font size="5" face="幼圆"><b>手机号:<b></font></td>
				<td><input type="text" name="phone" onblur="validatePhone()" /></td>
				<td><span id="phoneMsg"></span></td>
			</tr>
			<tr align="center">
				<td><font size="5" face="幼圆"><b>头像:<b></font></td>
				<td><input type="file" name="touxiang" /></td>
				<td></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="注册" /></td>
			</tr>
		</table>
	</form>-->
	<br>
	<br>
	<p align="center">
		<font size=5>注册完了想look,look吗？come on！-><a href="login.jsp">登录</a></font>
	</p>
</body>
</html>