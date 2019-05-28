<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="jquery-ui.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<!-- <style>
#changeFenlei{
display:none;
}
#changeBook{
display:none
}
#changeUser{
display:none;
}
#changeAdmin{
display:none
}
</style>
<script>
window.onload=function(){
	var fenlei=document.getElementById("fenlei");
	fenlei.onclick=function(){
		var changeFenlei=document.getElementById("changeFenlei");
		if(changeFenlei.style.display=="block"){//显式
			fenlei.innerHTML="+分类管理";
			changeFenlei.style.display="none";
		}else{
			fenlei.innerHTML="-分类管理";
			changeFenlei.style.display="block";
		}
	};
	var book=document.getElementById("book");
	book.onclick=function(){
		var changeBook=document.getElementById("changeBook");
		if(changeBook.style.display=="block"){
			book.innerHTML="+图书管理";
			changeBook.style.display="none";
		}else{
			book.innerHTML="-图书管理";
			changeBook.style.display="block";
		}
	};
	var user=document.getElementById("user");
	user.onclick=function(){
		var changeUser=document.getElementById("changeUser");
		if(changeUser.style.display=="block"){
			user.innerHTML="+用户管理";
			changeUser.style.display="none";
		}else{
			user.innerHTML="-用户管理";
			changeUser.style.display="block";
		}
	};
	var admin=document.getElementById("admin");
	admin.onclick=function(){
		var changeAdmin=document.getElementById("changeAdmin");
		if(changeAdmin.style.display=="block"){
			admin.innerHTML="+管理员信息管理";
			changeAdmin.style.display="none";
		}else{
			admin.innerHTML="-管理员信息管理";
			changeAdmin.style.display="block";
		}
	};
};
</script>
 -->
<style>
#accordion {
	width: 240px
}

li {
	list-style-type: none;
	padding-top: 5px;
}

a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function() {
		//	$("#date").datepicker();
		$("#accordion").accordion();

	});
</script>
</head>
<body background="images/002.jpg">
	<h1 class="demoHeaders">
		<font color="#CD853F">菜单</font>
	</h1>
	<div id="accordion">
		<h1>
			分类管理
			</h2>
			<div>
				<li><a href="addFenlei.jsp" target="right"><span
						class="ui-icon ui-icon-circle-plus"></span>添加分类</a></li>
				<li><a href="monsters" target="right"><span
						class="ui-icon ui-icon-copy"></span>查看分类</a></li>
			</div>

			<h2>图书管理</h2>
			<div>
				<ul>
					<li><a href="addBook.jsp" target="right"><span
							class="ui-icon ui-icon-star"></span>添加图书</a></li>
					<li><a href="BookServlet?action=showBookByPage" target="right"><span
							class="ui-icon ui-icon-star"></span>查看图书</a></li>
				</ul>
			</div>
<<<<<<< HEAD
			<h3>用户管理</h3>
			<div>
				<li><a href="addUser.jsp" target="right"><span
						class="ui-icon ui-icon-circle-plus"></span>添加用户</a></li>
				<li><a href="users" target="right"><span
						class="ui-icon ui-icon-copy"></span>查看用户</a></li>




			</div>
			<h2>管理员信息管理</h2>
			<div>
				<ul>
					<li><a href="showAdmin.jsp" target="right"><span
							class="ui-icon ui-icon-star"></span>查看管理员信息</a></li>
					<li><a href="updatePassword.jsp" target="right"><span
							class="ui-icon ui-icon-star"></span>修改密码</a></li>
					<li><a href="AdminServlet?action=exit" target="_parent"><span
							class="ui-icon ui-icon-star"></span>退出系统</a></li>
=======
			 
			  <h3>用户管理</h3>
		<div>
				<li><a  href="addUser.jsp" target="right"><span class="ui-icon ui-icon-circle-plus"></span>添加用户</a></li>
				<li><a href="users" target="right"  ><span class="ui-icon ui-icon-copy"></span>查看用户</a></li>
					 
	  </div>
			
		<h2>管理员信息管理</h2>
		<div>
			<ul>
				<li><a href="showAdmin" target="right"><span
						class="ui-icon ui-icon-star"></span>查看管理员信息</a></li>
				<li>
			<a href="updatePassword.jsp" target="right"><span
					class="ui-icon ui-icon-star"></span>修改密码</a>
				</li>
				<li>
			<a href="AdminServlet?action=exit" target="_parent"><span
					class="ui-icon ui-icon-star"></span>退出系统</a>
				</li>
>>>>>>> branch 'master' of https://github.com/yuyichen47947/bookmanager.git
				</ul>
		</div>

	</div>

</body>
</html>