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
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h1 align="center">图书管理系统---------修改图书界面</h1>
		<hr width="1000px">
		<!-- http://localhost/SSH2_SpringMVC/monster -->
		<form action="book" class="form-horizontal" method="post">
			<!-- 添加隐藏域，把请求变成PUT -->
			<input type="hidden" name="_method" value="PUT" />
			<!-- 不允许修改 所以 做一个隐藏域  monsterId带过去 -->
			<input type="hidden" name="bid" value="${b.bid }" />

			<div class="form-group">

				<div class="col-sm-4">
					<select name="fId" class="form-control">
						<!-- list传过去应该是1   2    3    -->
						<!-- monster school    schoolId  2 -->
						<c:forEach items="${flist }" var="f">
							<c:if test="${f.f_id ==fenlei.f_id }">
								<option value="${f.f_id }" selected="selected">${f.fname }</option>
							</c:if>
							<c:if test="${f.f_id !=fenlei.f_id }">
								<option value="${f.f_id }">${f.fname }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>



			<div class="form-group">
				<label for="bid" class="col-sm-4 control-label">图书编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="bid" name="bid"
						value="${b.bid }">
				</div>
			</div>



			<div class="form-group">
				<label for="fname" class="col-sm-4 control-label">图书分类</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fname" name="fname"
						value="${b.fname }">
				</div>
			</div>



			<div class="form-group">
				<label for="bname" class="col-sm-4 control-label">图书名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="bname" name="bname"
						value="${b.bname }">
				</div>
			</div>



			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">图书价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						value="${b.price }">
				</div>
			</div>


			<div class="form-group">
				<label for="chubanshe" class="col-sm-4 control-label">出版社</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="chubanshe" name="chubanshe"
						value="${b.chubanshe }">
				</div>
			</div>


			<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">图书状态</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="zhuangtai" name="zhuangtai"
						value="${b.zhuangtai }">
				</div>
			</div>



			<div class="form-group">
				<label for="jieshuren" class="col-sm-4 control-label">借书人</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="jieshuren" name="jieshuren"
						value="${b.jieshuren }">
				</div>
			</div>




			<div class="form-group">
				<label for="f_id" class="col-sm-4 control-label">分类编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="f_id" name="f_id"
						value="${b.f_id }">
				</div>
			</div>




			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">图书价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						value="${b.price }">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">修改</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>