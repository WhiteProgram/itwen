<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/itweb/css/base.css">
<link rel="stylesheet" href="/itweb/css/zhuce.css">
<title>管理员登录</title>
<jsp:useBean id="data" class="doman.User" scope="session" />
</head>
<script>
    function $(id){
        return document.getElementById(id);
    }
   function a(){
       var a = eemail();
       var b = yonghu();
       var c = pw();
       var d = repw();
       if(a == false||b == false||c == false || d == false){
       return false;
       }

       return true;

   }
    function eemail(){
      var email = $("email").value;
      var reg = /^\w+@\w+\.\w+$/;
      if(reg.test(email) == false){
          $("email").value = "";
          $("email").setAttribute("placeholder","邮箱格式不正确");
          $("email").setAttribute("class","change");
          return false;
      }
      return true;
  }
  function yonghu(){
      var username = $("username").value;
      var length = username.length;
      if(length == 0){
          $("username").value = "";
          $("username").setAttribute("placeholder","用户名不为空");
          $("username").setAttribute("class","change");
          return false;
      }
      return true;
  }
  function pw(){
      var password = $("password").value;
      var reg = /^[a-zA-Z][a-zA-Z0-9]{3,15}$/;
      if(reg.test(password) == false){
          $("password").value = "";
          $("password").setAttribute("placeholder","以字母开头，由4-16字符的字母和数字组成");
          $("password").setAttribute("class","change");
          return false;
      }
      return true;
  }
  function repw(){
      var repassword = $("repassword").value;
      var reg = /^[a-zA-Z][a-zA-Z0-9]{3,15}$/;
      if(reg.test(repassword) == false){
          $("repassword").value = "";
          $("repassword").setAttribute("placeholder","两次密码不一致");
          $("repassword").setAttribute("class","change");
          return false;
      }
      return true;
  }
</script>
<body>
	<div class="j_con">
        <h1>用户注册</h1>
        <p>创建一个新的用户</p>
        <form class="j_fo" action="regRoot" method="post" onsubmit="return a()">
            <input id="email" type="text" placeholder="邮箱" name="email" AUTOCOMPLETE="OFF" onblur="eemail()" />
            <input id="username" type="text" placeholder="用户名" name="username" AUTOCOMPLETE="OFF" onblur="yonghu()" />
            <input id="password" type="password" placeholder="请输入密码" name="password" AUTOCOMPLETE="OFF" onblur="pw()" />
            <input id="repassword" type="password" placeholder="再次输入密码" name="repassword" AUTOCOMPLETE="OFF" onblur="repw()" />
            <input class="s" type="checkbox" /><div class="d">我已阅读并同意 <span>《用户注册协议》</span></div>
            <input type="submit" id="submit" value="注册" class="j_sub"/>
        </form>
    </div>
    <%
		if(data.isMess() == false){
	%>
	<script>
	$("username").setAttribute("placeholder","该用户已经注册");
	$("username").setAttribute("class","change");
	</script>
	<%
		}
	%>
</body>
</html>