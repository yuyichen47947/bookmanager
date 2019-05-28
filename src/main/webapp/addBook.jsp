<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<title>添加图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
	var flag;

	function validateBName() {

		var bname = document.add.bname;

		var nameReg = /^[\u0391-\uFFE5_A-z0-9]{1,15}$/;

		var bNameMsg = document.getElementById("bNameMsg");

		ajax({
			method : "POST",
			url : "BookServlet",
			params : "action=validateBName&bname=" + bname.value,
			type : "text",
			success : function(data) {
				if (nameReg.test(bname.value)) {

					//bnameMsg.style.color = "darkcyan";

					//bnameMsg.innerHTML = "姓名合法";		

					if (data == "1") {//图书名称已经存在

						bNameMsg.style.color = "red";

						bNameMsg.innerHTML = "此图书名称已经存在";

						bname.focus();

						flag = false;

					} else {//图书名称不存在

						bNameMsg.style.color = "darkcyan";

						bNameMsg.innerHTML = "此图书名称可以添加";

						flag = true;
					}
				} else {

					bNameMsg.style.color = "red";

					bNameMsg.innerHTML = "必须是长度为1-15的汉字字母数字下划线";

					bname.focus();

					flag = false;
				}

			}
		})
	}
	/*
	 var xmlhttp = getXMLHttpRequest();

	 xmlhttp.open("POST", "BookServlet", true);

	 xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

	 xmlhttp.send("action=validateBName&bname=" + bname.value);
	
	 var nameReg = /^[\u0391-\uFFE5_A-z0-9]{1,15}$/;

	 var bNameMsg = document.getElementById("bNameMsg");

	 if (nameReg.test(bname.value)) {

	 //bnameMsg.style.color = "darkcyan";

	 //bnameMsg.innerHTML = "姓名合法";		

	 xmlhttp.onreadystatechange = function() {

	 if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

	 var content = xmlhttp.responseText;

	 var span = document.getElementById("bNameMsg");

	 if (content == "1") {//图书名称已经存在

	 span.style.color = "red";

	 span.innerHTML = "此图书名称已经存在";

	 span.focus();

	 flag = false;					

	 } else {//图书名称不存在

	 span.style.color = "darkcyan";

	 span.innerHTML = "此图书名称可以添加";

	 flag = true;
	
	 }
	
	 }
	
	 }

	 } else {

	 bNameMsg.style.color = "red";

	 bNameMsg.innerHTML = "必须是长度为1-15的汉字字母数字下划线";

	 flag=false;
	 }

	
	 }
	 */
	//2.校验价格
	function validatePrice() {

		var price = document.add.price;

		var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;

		var priceMsg = document.getElementById("priceMsg");

		if (reg.test(price.value)) {

			priceMsg.style.color = "darkcyan";

			priceMsg.innerHTML = "价格格式合法";

			return true;
		} else {

			priceMsg.style.color = "red";

			priceMsg.innerHTML = "价格格式不合法，正确格式为  52.11 或   52 或0.99";

			price.focus();

			return false;
		}

	};

	window.onload = function() {

		ajax({

			method : "POST",

			url : "FenleiServlet",

			ansy : true,

			params : "action=updateShowFenlei",

			type : "xml",

			success : function(data) {

				var select = document.getElementById("fenleiList");

				var names = data.getElementsByTagName("name");

				for (var i = 0; i < names.length; i++) {

					var name = names[i];

					var opt = document.createElement("option");

					var value;

					if (window.addEventListener) {

						value = name.textContent;

					} else {

						value = text;
					}

					opt.innerHTML = value;

					opt.value = value;

					select.appendChild(opt);
				}
			}
		});
	};

	function addb() {

		//alert(flag);
		return (flag) && validatePrice();
	};

	$(function() {

		$("tr:even").css("background-color", "transparent");

		$("tr:odd").css("background-color", "transparent");

		//事件
		$("tr").mouseover(function() {

			$(this).css("background-color", "LightYellow");
		});

		$("tr").mouseout(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");
		});
	});
</script>
</head>
<body background="./images/40.jpg">

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form action="book" method="post"
		           enctype="application/x-www-form-urlencoded" name="add"
		           onsubmit="return addb()">
					<br>
					<h1 class="text-center text-danger"><font face="幼圆">添加图书</font></h1>
					<hr>
					<ul class="nav">
						<li><b>请选择您想要添加的分类:</b></li>
						<li><select name="fId" class="form-control">
                            <c:forEach items="${list }" var="f">
                               <option value="${f.fId }">${f.fname }</option>
                            </c:forEach>
                         </select></li>
					</ul>
					<br>
					
					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="bname" onblur="validateBName()" class="form-control" placeholder="图书名称"/>
							 <span id="bNameMsg"></span>
					</div>
					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" onblur="validatePrice()" class="form-control" placeholder="图书价格"/> <span
							id="priceMsg"></span>
					</div>
					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chubanshe" class="form-control" placeholder="出版社"/>
					</div>
					<div class="form-group">
						<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</label> 
						<label class="radio-inline"> 
							<input type="radio" name="zhuangtai" value="未借出" checked/>未借出
						</label> 
						<label class="radio-inline"> 
						<input type="radio" name="zhuangtai" value="借出"/>借出
						</label>
					</div>
					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> 
						<input type="text" name="jieshuren" checked value="无" class="form-control"/> 
					</div>
					<br>
					<div class="form-group text-center">
						<ul class="list-inline">
							<li><button type="submit" class="btn btn-warning" style="width:200px;">添加</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="width:200px;">重填</button></li>
						</ul>
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>