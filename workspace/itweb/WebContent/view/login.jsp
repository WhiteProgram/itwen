<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="data" class="doman.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/itweb/css/base.css">
<link rel="stylesheet" href="/itweb/css/login.css">
<title>管理员登录</title>
</head>
<body>
	<div class="j_login">
        <div class="j_logo_user"></div>
        <ul class="j_login_con">
            <form action="indexRoot" method="post" />
                <li><input id="j_user" class="a" name="username" type="text" placeholder=<%=data.getMessage() %> AUTOCOMPLETE="OFF"/></li>
                <li><input class="a" name="password" type="password" placeholder="请输入密码" AUTOCOMPLETE="OFF" /></li>
                <li><input id="c" type="checkbox"><span>记住密码</span></li>
                <li><input id="b" class="a" type="submit" value="登录" /></li>
            </form>
        </ul>
	</div>
	
	<%
		if(data.isMess() == false){
	%>
	<style>
		input#j_user::-webkit-input-placeholder { /* WebKit browsers */  
  color: red;  
}  
	</style>
	<%
		}
	%>
</body>
</html>