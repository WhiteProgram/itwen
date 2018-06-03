<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录页面</title>
<link href="/human/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="titlebox">
		<div class="title">
			<div class="titlebut">
				<img src="/human/img/logo.png" width="121" height="42" />&nbsp;&nbsp;员工信息管理系统
			</div>
		</div>
	</div>
	<form action="logined" method="post">
		<div class="Waist">
			<div class="Signmax">
				<div class="Signbut">
					<div class="name">登录页面</div>
					<div class="column">
						<div class="Promptbut">用户名：</div>
						<input type="text" name="accountName" />
					</div>
					<div class="column">
						<div class="Promptbut">密&nbsp;&nbsp;码：</div>
						<input type="password" name="accountPasswd" />
					</div>
					<div class="button">
						<div class="Signin">
							<input class="submit_btn" type="submit" value="登录" />
						</div>
						<div class="Registered">
							<a class="change_a" href="regist">注册</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>