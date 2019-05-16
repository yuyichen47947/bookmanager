<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>添加分类</title>

<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	//1.验证姓名
	var flag;
	function validateFname() {	
		var fname = document.addFenlei.fname;
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.open("POST", "FenleiServlet",true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("action=validateFname&fname=" + fname.value);			
		var reg = /^[\u0391-\uFFE5]|[A-z]{1,10}$/;
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {//响应成功			
				var content = xmlhttp.responseText;//拿到服务器响应的数据了
				var fnameMsg = document.getElementById("fnameMsg");
				if (content == "0") {//用户名不存在，可以注册						
					flag=true;
					 if (reg.test(fname.value)) {
							fnameMsg.style.color = "green";
							fnameMsg.innerHTML = "分类名合法";
							flag=true;
						} else {
							fnameMsg.style.color = "red";
							fnameMsg.innerHTML = "必须是1-10位汉字或字母";
							fname.focus();
							flag=false;
						}		 
				}else{//用户名存在，请换一个
					fnameMsg.style.color="red";
					fnameMsg.innerHTML="分类名已存在，请换一个";
					fname.focus();
					flag= false;
				}
			}			
		}
	}
	function jiaoyan() {
		return flag;
	}
</script>
<style type="text/css">
 
 .table{
 width:600px;
 }
 tr{

  text-align: center;
}
</style>
<script type="text/javascript">
    $(function(){
    	
    	$("table tr:even").addClass("info");
    	
    	$("table tr:odd").addClass("active");
    });
</script>
</head>
<body background="images/003.jpg">
<form action="FenleiServlet?action=addFenlei" method="post" name="addFenlei" onsubmit="return jiaoyan()" enctype="application/x-www-form-urlencoded">
      <table class="table table-bordered table-striped table-hover" height="130px" align="center">
	  <br>
	  <br>
	  <h1 align="center"><font size="7" face="幼圆">添加分类</font></h1>
         <h1 class="text-center text-danger"><span class="glyphicon glyphicon-book"></span></h1>
	    <br>
	     <tr>
		    <td><font size="5" face="仿宋"><b>请输入分类的名字:</b></font></td>
			<td align="center"><input type="text" name="fname" onblur="validateFname()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="fnameMsg"></span></td>					
		 </tr>
		 <tr>	   
			<td colspan="2"><input type="submit"value="添加"class="btn btn-success btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重填" class="btn btn-primary btn-default"/></td>
		 </tr>
	  </table>
	  </form>
</body>
</html>