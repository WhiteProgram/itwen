<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<div class="titlethree">
		<div class="title">
			<div class="titlemax">
				<img src="/human/img/logo.png" width="121" height="42" />&nbsp;&nbsp;员工管理系统
			</div>
		</div>
	</div>
	<form action="modify" method="post">
		<div class="Signmax">
			<div class="Signthree">
				<div class="name">员工修改页面</div>
				<input type="hidden" name="id" value="${id}" />
				<div class="column">
					<div class="Promptbut">姓名：</div>
					<input type="text" name="empName" value="${empName}" />
				</div>
				<div class="column">
					<div class="Promptbut">籍贯：</div>
					<input type="text" />
				</div>
				<div class="column">
					<div class="Promptbut">出生日期：</div>
					<input type="text" name="empBirthday" value="${empBirthday}" />
				</div>
				<c:choose>
					<c:when test="${empSex=='男'}">
						<div class="checkRadio">
							<div class="Promptbut">性别：</div>
							<input id="man" type="radio" name="empSex" class="radio"
								checked="checked" value="男" /> <label for="man" class="radio">男</label>&nbsp;&nbsp;
							<input id="woman" name="empSex" type="radio" class="radio"
								value="女" /> <label for="woman" class="radio">女</label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="checkRadio">
							<div class="Promptbut">性别：</div>
							<input id="man" type="radio" name="empSex" class="radio"
								value="男" /> <label for="man" class="radio">男</label>&nbsp;&nbsp;
							<input id="woman" name="empSex" type="radio" class="radio"
								value="女" checked="checked" /> <label for="woman" class="radio">女</label>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="column">
					<div class="Promptbut">家庭地址：</div>
					<input type="text" name="empAddress" value="${empAddress}" />
				</div>
				<div class="column">
					<div class="Promptbut">联系方式：</div>
					<input type="text" name="empTel" value="${empTel}" />
					<div class="button">
						<div class="Signin">
							<input class="submit_btn" type="submit" value="提交" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>