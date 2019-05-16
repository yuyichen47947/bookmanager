<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>查看管理员信息</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var opt = {

			method : "POST",
			url : "AdminServlet",
			params : "action=showAdmin",
			type : "json",
			success:function(data){
	    		   
    			var admin=data;
    			
                var id=document.getElementById("id");
             
                id.innerHTML=admin.id;
                
                var name=document.getElementById("name");
                
                name.innerHTML=admin.name;
                
                var username=document.getElementById("username");
                
                username.innerHTML=admin.username;
                
                var password=document.getElementById("password");
                
                password.value=admin.password;
                
                var phone=document.getElementById("phone");
                
                phone.innerHTML=admin.phone;
                
                var touxiang=document.getElementById("touxiang");
				
				var img=document.createElement("img");
				
				img.src="/img"+admin.touxiang;
				
				img.style="width:60px;height:50px";
				
                touxiang.appendChild(img);
          
			}
		};

		ajax(opt);

	};
</script>
</head>
<body align="center" background="images/003.jpg">
		<caption>
			<font size="7" face="宋体">查看管理员信息</font>
		</caption>
		<h1 class="text-center text-danger"><span class="glyphicon glyphicon-user"></span></h1>

		<table bordercolor="#993300" border="1" align="center" width="500px"
			height="300px" cellspacing="0">
			<tr align="center">
				<td>编号</td>
				<td id="id"></td>
			</tr>
			<tr align="center">
				<td>姓名</td>
				<td id="name"></td>
			</tr>
			<tr align="center">
				<td>账号</td>
				<td id="username"></td>
			</tr>
			<tr align="center">
				<td>密码</td>
				<td><input type="password" id="password"
					disabled="disabled" /></td>
			</tr>
			<tr align="center">
				<td>手机</td>
				<td id="phone"></td>
			</tr>
			<tr align="center">
			    <td>头像</td>
				<td id="touxiang"></td>
			</tr>
		</table>
</body>
</html>