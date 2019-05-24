<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<HEAD
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
$(function() {
	$("#login").bootstrapValidator({

		feedbackIcons : {
			valid : "glyphicon glyphicon-ok",
			invalid : "glyphicon glyphicon-remove",
			validating : "glyphicon glyphicon-refresh"
		},
		fields : {
			name : {
				validators : {
					notEmpty : {
						message : '姓名不能为空'
					},
					regexp : {
						regexp : /^[\u0391-\uFFE5]{2,10}$/,
						message : '姓名必须是2~10个汉字'
					},
				}
			},
			 phone:{
				  validators:{
					  notEmpty:{
						  message:'手机号不能为空'
					  },
					  regexp:{
						  regexp:/^1[3-9][0-9]{9}$/,
					    message:'手机号不合法'
					  },
				  }
			  },
			  username:{
				  validators:{
					  notEmpty:{
						  message:'用户名不能为空'
					  },
					  regexp:{
						  regexp:/^[A-Za-z_\.]{6,12}$/,
					    message:'用户名必须是6~12位字母或下划线'
					  },
				  }
			  },
			password:{
				  validators:{
					  notEmpty:{
						  message:'密码不能为空'
					  },
					  regexp:{
						  regexp:/^[A-Za-z_\.0-9]{6,}$/,
						    message:'密码至少六位数'
						  },
					  different:{
						  field:'userName',
						 message:'密码不能和用户名一样'
					  }
					  
				  }
			  },
			  repassword:{
				  validators:{
					  notEmpty:{
						  message:'确认密码不能为空'
					  },
					  identical:{
						  field:'password',
							  message:'两次密码不一致'
					  }
					  
				  }
			  },
			 

			
			
			  zhucetime: {
				validators : {
					notEmpty : {
						message : '注册时间不能为空'
					},
					regexp : {
						regexp : /^([1][7-9][0-9][0-9]|[2][0][0-9][0-9])(\-)([0][1-9]|[1][0-2])(\-)([0-2][1-9]|[3][0-1])$/g,
						message : '注册时间必须是当天'
					},
				}
			},
			
		}

	})

});

	</script>
</head>
<body background="imgs/3.jpg">
  <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="add" method="post">
					<h3 class="text-center text-success">添加用户</h3>
					<div class="form-group">
						<label>姓&nbsp;&nbsp;名&nbsp;:</label> <input type="text"
							name="name" class="form-control" />
					</div>
					<div class="form-group">
						<label>手&nbsp;机&nbsp;号&nbsp;码:</label> <input type="text"
							name="phone" class="form-control" />
					</div>
					<div class="form-group">
						<label>用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名:</label> <input
							type="text" name="username" class="form-control" />
					</div>
                    <div class="form-group">
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;</label> <input
							type="text" name="password" class="form-control" />
					</div>
					  <div class="form-group">
						<label>确&nbsp;&nbsp;认&nbsp;&nbsp;密&nbsp;&nbsp;码</label> <input
							type="text" name="repassword" class="form-control" />
					</div>
					<div class="form-group">
						<label>注&nbsp;&nbsp;册&nbsp;时&nbsp;&nbsp;&nbsp;间:</label> <input
							type="date" name="zhucetime" class="form-control" />
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<button type="reset" class="btn btn-success btn-block">重填</button>
					</div>
				</form>

			</div>


		</div>

	</div>
	 
=======
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
     $(function(){
    	 
    	 $("tr:even").css("background-color","#FFCC66");
    	 $("tr:odd").css("background-color","#FFE4B5");
     });
</script>
<title>添加用户</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	//1.验证姓名
	function validateName() {
		var name = document.addUser.name;
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
		var username = document.addUser.username;
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.open("POST", "UserServlet", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("action=validateUserName&username=" + username.value);			
		var reg = /^[A-z0-9_]{3,15}$/;
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {//响应成功			
				var content = xmlhttp.responseText;//拿到服务器响应的数据了
				var usernameMsg = document.getElementById("usernameMsg");
				if (content == "0") {//用户名不存在，可以注册						
					flag=true;
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
					username.focus();
					flag= false;
				}
			}			
		}
	}
	//3.验证密码
	function validatePassword() {
		var password = document.addUser.password;
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
	4
	//4.验证手机
	function validatePhone() {
		var phone = document.addUser.phone;
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
	//5.验证注册时间
	function validateTime(){
		var time= document.addUser.time;
		var date=new Date();
		var year=date.getFullYear();
		var moth=date.getMonth()+1;
		var day=date.getDate();
		time.value=year+"-"+moth+"-"+day;
		var timeMsg=document.getElementById("timeMsg");
		if(time.value){
		 timeMsg.style.color = "green";
		 timeMsg.innerHTML="时间合法";
		 return true;
		}else{
			timeMsg.style.color = "red";
			 timeMsg.innerHTML="格式为年-月-日";
			 time.focus();
			return false;
		}
	}

	function jiaoyan() {
		return validateName() && flag && validatePassword()
				&& validatePhone()&&validateTime();
	}
</script>
</head>
<body background="images/003.jpg">
<form action="UserServlet?action=addUser" method="post"
       name="addUser" onsubmit="return jiaoyan()"
		enctype="multipart/form-data">
      <table align="center" border="2" width="500px" height="600px">
	  <p align="center"><font size="7" face="仿宋">添加用户</font></p>
		   <tr align="center">		 
			<td>真实姓名：</td>
			<td><input type="text" name="name" onblur="validateName()"/></td>
		    <td><span id="nameMsg"></span></td>
		 </tr>
		    <tr align="center">		 
			<td>用&nbsp;户&nbsp;名：</td>
			<td><input type="text" name="username" onblur="validateUserName()" /></td>
				<td><span id="usernameMsg"></span></td>
		 </tr>
		    <tr align="center">		 
			<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			<td><input type="text" name="password" onblur="validatePassword()" /></td>
				<td><span id="passwordMsg"></span></td>
		 </tr>
		    <tr align="center">		 
			<td>手机号码：</td>
			<td><input type="text" name="phone" onblur="validatePhone()" /></td>
				<td><span id="phoneMsg"></span></td>
		 </tr>
		    <tr align="center">		 
			<td>注册时间：</td>
			<td><input type="text" name="time" onblur="validateTime()"/></td>
				<td><span id="timeMsg"></span></td>
		 </tr>
		  <tr align="center">
		  <td>上传头像：</td>
		  <td><input type="file" name="touxiang" /></td>
		  <td><span></span></td>
		  </tr>
		    <tr align="center">		 
			<td colspan="3"><input type="submit" value="添加用户" class="btn btn-primary btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重新填写" class="btn btn-active btn-default"/></td>
	  </table>
	  </form>
>>>>>>> branch 'master' of https://github.com/yuyichen47947/bookmanager.git
</body>
</html>