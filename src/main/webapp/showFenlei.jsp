<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String path=request.getContextPath();

  String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";
%>
<!-- http://localhost:端口号/项目名/ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="<%=base %>bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="<%=base %>bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="<%=base %>bootstrap/js/bootstrap.js"></script>
<style type="text/css">
 
 .table{
 width:1000px;
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
<title>查看所有分类</title>
<link type="text/css" rel="stylesheet" href="<%=base %>jquery-ui.css" />
<script type="text/javascript" src="<%=base %>js/jquery-ui.js"></script>
<script type="text/javascript">
    $(function(){
    	$("#selectAll").button({
    		
    		showLabel: true
    	});
    	$("#noSelectAll").button({
    		
    		showLabel: true
    	});
    	$("#fanxuan").button({
    		
    		showLabel: true
    	});
    	$("#deleteFenlei").button({
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
		var selectAll = document.getElementById("selectAll");
		selectAll.onclick = function() {
			var chek = document.getElementsByName("fids");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = true;
			}
		};
		var noSelectAll = document.getElementById("noSelectAll");
		noSelectAll.onclick = function() {
			var chek = document.getElementsByTagName("input");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = false;
			}
		};
		var fanxuan = document.getElementById("fanxuan");
		fanxuan.onclick = function() {
			var chek = document.getElementsByName("fids");
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					chek[i].checked = false;
				} else {
					chek[i].checked = true;
				}
			}
		};
		var deleteFenlei = document.getElementById("deleteFenlei");
		deleteFenlei.onclick = function() {
			var chek = document.getElementsByName("fids");
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
				location.href = "<%=base %>FenleiServlet?action=delete&fids=" + str;
			} else {
				location.reload();
			}
		};
		
		var outAll=document.getElementById("outAll");
		outAll.onclick=function(){
			var flage=confirm("你确定导出所有分类吗?");
			if(flage){
				window.location.href="<%=base %>OutPutFenleiServlet?action=all";
			}
		};

		var outSelect=document.getElementById("outSelect");
		
		outSelect.onclick=function(){
			
			var chek = document.getElementsByName("fids");
			
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
				 

				var flage = confirm("你确定导出选中的分类信息？");
				
				if (flage) {//确定
				
					window.location.href = "<%=base %>OutPutFenleiServlet?action=outSelect&fids="+ str;

				}
			}
			
		};
		
	};
</script>
</head>
<body background="<%=base %>/images/003.jpg">

	<table class="table table-bordered table-striped table-hover"align="center" height="500px">
		<caption>
			<h1 align="center"><font size="7" face="幼圆" color="black">查看所有分类</h1>
		</caption>
		<tr align="center">
			<td><font size="4">编号</font></td>
			<td><font size="4">分类名称</font></td>
			<td><font size="4">批量删除</font></td>
			<td><a href="<%=base %>AllupdateFenlei.jsp" /><button class="btn btn-info">选择修改 </button></a></td>
		</tr>
		<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			<tr align="center">
				<td><font size="4">${s.index+1 }</font></td>
				<td><font size="4">${f.fname}</font></td>
				<td><font size="4"><input type="checkbox" name="fids" value="${f.fid}" /></font></td>
				<td><a href="<%=base %>FenleiServlet?action=showOne&fid=${f.fid}"><span class="glyphicon glyphicon-pencil" style="font-size: 25px;"></span></a></td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="4"><button id="selectAll">全选</button>&nbsp;&nbsp;
				<button id="noSelectAll">全不选</button>&nbsp;&nbsp;
				<button id="fanxuan">反选</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteFenlei">删除</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="outSelect">导出所选</button>&nbsp;&nbsp;&nbsp;
				<button id="outAll">导出全部</button></td>
		</tr>
	</table>
	<p>
	<p>
	<center>
		<ul class="pagination">
		<li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=1">首页</a></li>
		&nbsp;&nbsp;
		<c:if test="${pb.pageNow>1 }">
			<li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
		</c:if>
		&nbsp;
		  <!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
		        -->
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
		             <li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${i }">[${i }]</a></li>
		                </c:otherwise>
		            </c:choose>
		           
		        </c:forEach>        
		&nbsp;		
		<c:if test="${pb.pageNow<pb.pages }">
			<li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
		</c:if>
		&nbsp;&nbsp; 
		<li><a href="<%=base %>FenleiServlet?action=showFenleiByPage&pageNow=${pb.pages }">尾页</a></li>
	</ul>
	
	</center>
	<p  align="center">第${pb.pageNow }页/共${pb.pages }页</p>
		<br>
	<p align="center">
		<font size=5>没有钟意的？请点这里再添一个<a href="<%=base %>addFenlei.jsp">添加分类</a></font>
	</p>
</body>
</html>