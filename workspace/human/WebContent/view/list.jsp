<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工信息管理系统</title>
<link href="/human/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="exit">
		<img src="/human/img/tuichu.png" width="16" height="16" alt="" /> <a
			href="">&nbsp;退出</a>
	</div>
	<div class="titlethere">
		<div class="title">
			<div class="titlemax">
				<img src="/human/img/logo.png" width="121" height="42" />&nbsp;&nbsp;员工信息管理系统
			</div>
		</div>
	</div>
	<div class="Signfour">
		<div class="List">
			<table width="940" border="0">
				<thead>
					<th width="27">ID</th>
					<th width="49">姓名</th>
					<th width="98">出生日期</th>
					<th width="49">性别</th>
					<th width="100">籍贯</th>
					<th width="254">家庭地址</th>
					<th width="126">联系方式</th>
					<th width="171">操作</th>
				</thead>
				<c:forEach items="${list}" var="emp" varStatus="status">
					<tr <c:if test="${status.count%2==0}">class="Background"</c:if>>
						<td>${emp.id}</td>
						<td>${emp.empName}</td>
						<td>${emp.empBirthday}</td>
						<td>${emp.empSex}</td>
						<td>${emp.empAddress}</td>
						<td>${emp.empAddress}</td>
						<td>${emp.empTel}</td>
						<td>
							<div class="Operation">
								<a href="del?id=${emp.id}">刪除</a>
								<a href="update?id=${emp.id}">修改</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="pagemax">
		<div class="page">
			<a href="find?page=${page<=1?1:page-1}">上一页</a>&nbsp;|&nbsp; <a
				href="find?page=${page}">当前&nbsp; <input type="text"
				value=${page } />&nbsp;页
			</a>&nbsp;&nbsp; <a href="find?page=${page<pageSum?page+1:pageSum}">下一页</a>&nbsp;|&nbsp;
			总计${pageSum}页
		</div>
	</div>
	<div class="box">
		<div class="Employee">
			<a class="change_a" href="add">员工添加</a>
		</div>
	</div>
</body>
</html>