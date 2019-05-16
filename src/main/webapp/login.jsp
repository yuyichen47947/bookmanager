<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<c:if test="${!(empty msg2) }">
  <script>
    alert("${msg2 }");
  </script>
  <c:remove var="msg2" scope="session"/>
</c:if>
<title>登录</title>
<style>
      body{
	  margin:0;
	  }
	  .table{
    width:500px;
 }
tr{
</style>
<script type="text/javascript">
     $(function(){
    	 $("table tr:even").addClass("active");
     	
     	$("table tr:odd").addClass("warning");

     });
</script>
</head>
<body>
<table width="100%" height="1000px" cellspacing="0">
	<tr height="80px"><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="orange" size="7" face="幼圆"><b>Oracle</b></font>&nbsp;<font size="6" face="仿宋">图书管理系统</font>&nbsp;<font size="6" color="purple">|</font>&nbsp;<font color="black" size="5">登录login</font></td></tr>
	<tr background="images/001.jpg">
	<td width="50%" align="center">
	<form action="AdminServlet?action=login" method="post">
	<table class="table table-bordered table-striped table-hover">
<!-- 	<table align="center" border="1" cellspacing="0" width="400px" height="400px" bordercolor="#ff9900"> -->
     <tr align="center"><td colspan="2"><font color="black" size="7" face="幼圆"><b>会员登录</b></font></td></tr>
	 <tr align="center"><td colspan="2"><font color="black" size="4" face="仿宋"><b>登&nbsp;录&nbsp;账&nbsp;号:</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username" /></td></tr>
	 <tr align="center"><td colspan="2"><font color="black"size="4" face="仿宋"><b>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password"/></td></tr>
	 <tr align="center"><td colspan="2"><input type="checkbox" checked><font size="3" color="purple">两周内自动登录</font></td></tr>
	 <tr align="center"><td colspan="2"><input type="image" src="images/06.png"/></td></tr>
	 <tr align="center"><td colspan="2"><a href="register.jsp"><font size="2" color="silver">还不是会员？立即注册</font></a></td></tr>
	</table>
	</form>
	 </td>
	 <td></td>
	 </tr>
	 <tr height="100px"><td align="center" colspan="2"><font color="gray" size="4" face="黑体">Oracle公司版权所有(当然，还有张老板) &copy; 2018-2028</font></td></tr>
	</table>
</body>
</html>
