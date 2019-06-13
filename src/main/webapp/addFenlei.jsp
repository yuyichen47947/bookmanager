<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							message : '分类名称不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '分类名称必须是2~10个汉字'
						},
					}
				},

			}

		})

	});
</script>
<style type="text/css">
.table {
	width: 600px;
}

tr {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {

		$("table tr:even").addClass("info");

		$("table tr:odd").addClass("active");
	});
</script>
</head>
<body background="images/003.jpg">
	<form id="login" action="addfenlei" method="post"
		enctype="application/x-www-form-urlencoded">
		<table class="table table-bordered table-striped table-hover"
			height="130px" align="center">
			<br>
			<br>
			<h1 align="center">
				<font size="7" face="幼圆">添加分类</font>
			</h1>
			<h1 class="text-center text-danger">
				<span class="glyphicon glyphicon-book"></span>
			</h1>
			<br>
			<tr>
				<td><font size="5" face="仿宋"><b>请输入分类的名字:</b></font></td>
				<td align="center"><input type="text" name="fname"
					onblur="validateFname()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					id="fnameMsg"></span></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="添加"
					class="btn btn-success btn-default" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" class="btn btn-primary btn-default" /></td>
			</tr>
		</table>
	</form>
</body>
</html>