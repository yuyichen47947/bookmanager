<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<!-- 2.移动设备优先 -->
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
<title>修改图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
   window.onload=function(){//页面加载完成	
	ajax({
		method:"POST",
		url:"FenleiServlet",
		params:"action=updateShowFenlei",
		type:"xml",
		success:function(data){
		   
			var select=document.getElementById("fenleiList");
			
            var fnames=data.getElementsByTagName("fname");
			
			for(var i=0;i<fnames.length;i++){
				
				var fname=fnames[i];
				
				var opt=document.createElement("option");
				
				var value;
				
				if(window.addEventListener){
					
					value=fname.textContent;
					
				}else{
					
					
					value=text;
				}
				
				opt.innerHTML=value;
				
				opt.value=value;
				
				
				select.appendChild(opt);
	   }
	}
	
	});
};
</script>
</head>
<body background="images/003.jpg">
<form action="BookServlet?action=updateBook" method="post">
      <table align="center" border="2" width="400px" height="600px">
	  <p align="center" >
		<font size="7"face="幼圆">修改图书</font>
	</p>
	  <input type='hidden' name='id' value="${b.id}"/>	
	    <tr align="center">		 
			<td>请选择分类：</td>
			<td><select name="fname" id="fenleiList" value="${b.fname }">
	    </select></td>
		 </tr>
		   <tr align="center">		 
			<td>图&nbsp;书&nbsp;名&nbsp;称：</td>
			<td><input type="text" name="name" value="${b.name }"/></td>
		 </tr>
		    <tr align="center">		 
			<td>图&nbsp;书&nbsp;价&nbsp;格：</td>
			<td><input type="text" name="price" value="${b.price }"/></td>
		 </tr>
		    <tr align="center">		 
			<td>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社：</td>
			<td><input type="text" name="publish" value="${b.publish }"/></td>
		 </tr>
		    <tr align="center">		 
			<td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</td>
			<td><input type="radio"name="state" value="未借出"/>未借出<input type="radio" name="state" value="借出"/>借出</td>
		 </tr>
		    <tr align="center">		 
			<td>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人：</td>
			<td><input type="text" name="borrower" value="${b.borrower }"/></td>
		 </tr>
		    <tr align="center">		 
			<td colspan="2"><input type="submit" value="修改" class="btn btn-active btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重填" class="btn btn-active btn-default"/></td>
	  </table>
	  </form>
  </body>
</body>
</html>