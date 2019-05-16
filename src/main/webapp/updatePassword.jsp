<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    	 $("tr:odd").css("background-color","#FFDEAD");
     });
</script>
<script type="text/javascript" src="js/ajax.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	/* var flag=false;
	  
	  function validatePassword() {
	  
	  var xmlhttp=getXMLHttpRequest();

	  var passwordMsg=document.getElementById("passwordMsg");       

	  var password=document.updatePassword.password;
	  
	  xmlhttp.open("POST","AdminServlet",true);

	  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

	  xmlhttp.send("action=validatePassword&password="+password.value);

	  xmlhttp.onreadystatechange=function(){
		
	 if(xmlhttp.readyState==4 && xmlhttp.status==200){
	
	var content=xmlhttp.responseText;
							
	  if(content== "1"){
		   
		  passwordMsg.style.color="green";
	   
		  passwordMsg.innerHTML="密码正确";
	       
	       flag=true;
		   
	   }else{
		   
		  passwordMsg.style.color="red";
		   
		  passwordMsg.innerHTML="密码错误";
	       
		  password.focus();
		   
	       flag=false;
		  
	   }
	   
	  }

	}
	  }
	 */
	//校验原密码
	var flag;

	function validatePassword() {
		var password = document.updatePassword.password;
		var passwordMsg = document.getElementById("passwordMsg");
		ajax({
			method : "POST",
			url : "AdminServlet",
			params : "action=validatePassword&password=" + password.value,
			type : "text",
			success : function(data) {

				if (data == "1") {//找到用户名

					passwordMsg.style.color = "green";

					passwordMsg.innerHTML = "原密码输入正确!";

					flag = true;

				} else {//没找到用户名

					passwordMsg.style.color = "red";

					passwordMsg.innerHTML = "原密码输入错误，请重新输入!";

					password.focus();

					flag = false;

				}

			}

		});

	}
	//新密码
	function validateNewPassword() {
		var password = document.updatePassword.password;
		var newpassword = document.updatePassword.newpassword;
		var reg = /^(\w|\w){6,15}$/;
		var newpasswordMsg = document.getElementById("newpasswordMsg");
		/*if (reg.test(newpassword.value)) {
			if (newpassword.value == password.value) {
				newpasswordMsg.style.color = "red";
				newpasswordMsg.innerHTML = "与原密码不能一致";
				newpassword.focus();
				return false;
			} else {
				newpasswordMsg.style.color = "green";
				newpasswordMsg.innerHTML = "密码合法";
				return true;
			}
		} else {
			newpasswordMsg.style.color = "red";
			newpasswordMsg.innerHTML = "必须是6-15位数字字母下划线或者特殊字符";
			newpassword.focus();
			return false;
		}
		*/
		if (!reg.test(newpassword.value)) {//格式不匹配

			newpasswordMsg.style.color = "red";

			newpasswordMsg.innerHTML = "必须是6-15位数字字母下划线或者特殊字符";

			return false;

		}

		if (password.value == newpassword.value) {
			
			newpasswordMsg.style.color = "red";

			newpasswordMsg.innerHTML = "与原密码不能一致";

			return false;

		}
		
		newpasswordMsg.style.color = "green";

		newpasswordMsg.innerHTML = "新密码合法!";
		
		return true;

	}
	
	//确认密码
	function validateRePassword() {
		var newpassword = document.updatePassword.newpassword;
		var repassword = document.updatePassword.repassword;
		var repasswordMsg = document.getElementById("repasswordMsg");
		if (repassword.value == newpassword.value) {
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

	function jiaoyan() {
		return flag && validateNewPassword() && validateRePassword();
	}
</script>
</head>
<body align="center" background="images/003.jpg">
	<form action="AdminServlet?action=updatePassword" method="post"
		name="updatePassword" onsubmit="return jiaoyan()"
		enctype="application/x-www-form-urlencoded">
		<br>
		<p align="center"><font size="7" >修改密码</font></p>
		<hr size="5px" width="600px" color="#cc6600">
		<br> <br>
		<table bordercolor="#993300" border="1" align="center" width="550px"
			height="250px" cellspacing="0">
			<!--  	<input type='hidden' name='id' value="${admin.id}" />-->
			<tr align="center">
				<td>原密码：</td>
				<td><input type="text" name="password"
					onblur="validatePassword()" /></td>
				<td><span id="passwordMsg"></span></td>
			</tr>
			<tr align="center">
				<td>新密码：</td>
				<td><input type="text" name="newpassword"
					onblur="validateNewPassword()" /></td>
				<td><span id="newpasswordMsg"></span></td>
			</tr>
			<tr align="center">
				<td>确认新密码：</td>
				<td><input type="text" name="repassword"
					onblur="validateRePassword()" /></td>
				<td><span id="repasswordMsg"></span></td>
			</tr>
			<tr height="45px" align="center">
				<td size="3" color="black" align="center" colspan="3"><input
					type="submit" value="修改" class="btn btn-active btn-default"/>&nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="重置" class="btn btn-active btn-default"/></td>
			</tr>
		</table>
	</form>
</body>
</html>