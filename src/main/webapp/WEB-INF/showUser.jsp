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
    	 $("tr:odd").css("background-color","#FFE4B5");
    	 
    	 $("tr").mouseout(function(){
    		 
    		 $("tr:even").css("background-color","#FFCC66");
        	 $("tr:odd").css("background-color","#FFE4B5");
    		 
    	 });
    	 
     });
</script>
<title>查看用户</title>
<link type="text/css" rel="stylesheet" href="jquery-ui.css" />
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
    $(function(){
    	
    	$("#deleteUser").button({
    		icon: "ui-icon-trash",
    		showLabel: true
    	});
    	$("#outSelect").button({
    		icon: "ui-icon-caret-1-n",
    		showLabel: true
    	});
    	$("#outAll").button({
    		icon: "ui-icon-caret-1-n",
    		showLabel: true
    	});
    	
    });  
</script>
<script>
	window.onload = function() {
		var deleteUser = document.getElementById("deleteUser");
		deleteUser.onclick = function() {
			var chek = document.getElementsByName("ids");
			var flag = false;
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}
			if (flag == false) {
				alert("请至少选择一项进行删除!");
				return;
			}
			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";
				}
			}
			str = str.slice(0, str.length - 1);
			alert(str);
			var queren = confirm("您确认要删除这些分类吗");
			if (queren == true) {
				location.href = "UserServlet?action=delete&ids=" + str;
			} else {
				location.reload();
			}
		}
		//导出信息
		var outAll=document.getElementById("outAll");
		
		outAll.onclick=function(){
		
		var flage=confirm("你确定导出所有用户的信息吗?");
		
		if(flage){
		
			window.location.href="OutPutUserServlet?action=all";
			}
		};

		var outSelect=document.getElementById("outSelect");
		
		outSelect.onclick=function(){
			
			var chek = document.getElementsByName("ids");
			
			var flag = false;

			for (var i = 0; i < chek.length; i++){

				if (chek[i].checked == true) {
				
					flag = true;
					
					break;
				}
			}

		if (flag == false) {
		alert("请至少选一项");
		return;
	} else {    		
		var str = "";
		for (var i = 0; i < chek.length; i++) {
		if (chek[i].checked == true) {
		str += chek[i].value + ",";
		}
	}
		str = str.slice(0, str.length - 1);		
		var flage = confirm("你确定导出选中的用户信息？");		
		if (flage) {//确定			
		window.location.href = "OutPutUserServlet?action=outSelect&ids="+ str;
				}
			}		
		};
	};
</script>
</head>
<body background="images/003.jpg">
	<table align="center" width="900px" height="500px" border="1px">
		<caption align="top">
			<h1>查看用户信息</h1>
		</caption>
		<tr align="center">
			<td>编号</td>
			<td>姓名</td>
			<td>用户名</td>
			<td>密码</td>
			<td>手机</td>
			<td>注册时间</td>
			<td>头像</td>
			<td>修改</td>
			<td><button id="deleteUser">删除</button></td>
		</tr>
		<c:forEach items="${pb.beanList }" var="u" varStatus="s">
			<tr align="center">
				<td>${s.index+1 }</td>
				<td>${u.name}</td>
				<td>${u.username }</td>
				<td>${u.password }</td>
				<td>${u.phone }</td>
				<td>${u.time }</td> 
				<td><img src="/img${u.touxiang }" style="width:60px;height:50px"class="img-circle img-responsive"/></td>
				<td><a href="UserServlet?action=showOne&id=${u.id}"><span class="glyphicon glyphicon-pencil" style="font-size: 25px;"></span></a></td>
				<td><input type="checkbox" name="ids" value="${u.id}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p align="center"><button id="outSelect">导出所选</button>&nbsp;&nbsp;&nbsp;
	<button id="outAll">导出全部</button></p>
	<p>
	<center>
	<ul class="pagination">
		<li><a
			href="UserServlet?action=showUserByPage&pageNow=1">首页</a><li>
		&nbsp;&nbsp;
		<c:if test="${pb.pageNow>1 }">
			<li><a href="UserServlet?action=showUserByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
		</c:if>
		&nbsp;
		<c:choose>
			<c:when test="${pb.pages<=10 }">
				<c:set var="begin" value="1"></c:set>
				<c:set var="end" value="${pb.pages }"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
				<c:set var="end" value="${pb.pageNow+4 }"></c:set>
				<c:if test="${begin<=1 }">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="10"></c:set>
				</c:if>
				<c:if test="${end>=pb.pages }">
					<c:set var="begin" value="${pb.pages-9 }"></c:set>
					<c:set var="end" value="${pb.pages }"></c:set>
				</c:if>
			</c:otherwise>
		</c:choose>
		<!-- 循环十个数 -->
		<c:forEach begin="${begin }" end="${end }" var="i">
			<c:choose>
				<c:when test="${pb.pageNow==i }">
		              <li class="active"><span>${i}</span></li>
		                </c:when>
				<c:otherwise>
					<li><a href="UserServlet?action=showUserByPage&pageNow=${i }">[${i }]</a></li>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		&nbsp;
		<c:if test="${pb.pageNow<pb.pages }">
			<li><a href="UserServlet?action=showUserByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
		</c:if>
		&nbsp;&nbsp; <li><a
			href="UserServlet?action=showUserByPage&pageNow=${pb.pages }">尾页</a></li>
	</ul>
	</center>
	<p  align="center">第${pb.pageNow }页/共${pb.pages }页</p>
	
	<br>
	<p align="center">
		<font size=5>没有找到指定用户？您可以点击这里<a href="addUser.jsp">添加用户</a></font>
	</p>
</body>
</html>