<%@page import="db.DButil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean id="data" class="doman.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="/itweb/css/base.css" />
    <link rel="stylesheet" href="/itweb/css/success.css" />
    <script src="/itweb/js/jquery-1.3.2.js"></script>
	<title>登录成功</title>
</head>
<body>
	<div class="layout">
        <div class="header">
            <span>后台管理系统</span>
        </div>
        <div class="con_left">
            <ul class="lie">
                <li>商品管理
                    <ul>
                        <li>商品列表</li>
                        <li>添加商品</li>
                        <li>删除商品</li>
                        <li>修改商品</li>
                    </ul>
                </li>
                <li>订单管理
                    <ul>
                        <li>查看订单</li>
                    </ul>
                </li>
                <li>管理员
                    <ul>
                        <li id="c_r">查看管理员</li>
                        <li id="t_r">添加管理员</li>
                        <li id="d_r">删除管理员</li>
                        <li>修改管理员</li>
                    </ul>
                </li>
                <li>会员管理
                    <ul>
                        <li>会员列表</li>
                        <li>未激活会员</li>
                        <li>团队系谱图</li>
                        <li>会员推荐图</li>
                        <li>推荐列表</li>
                    </ul>
                </li>
                <li>信息通知
                    <ul>
                        <li>站内信息/留言</li>
                        <li>短信</li>
                        <li>邮件</li>
                        <li>微信</li>
                        <li>客服</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="con_right">
            <div class="ta">
           		<form action="">
                    <input type="text" name="text"/>
                    <input type="submit" value="搜索">
                </form>
                <ul>
                    <li>用户名</li>
                    <li>密码</li>
                    <li>email</li>
                    <li>操作</li>
                </ul>
                <%
                	Connection conn = DButil.getConnection();
                	Statement sql = conn.createStatement();
                	ResultSet rs = sql.executeQuery("select * from userroot");
                	while(rs.next()){
                		out.print("<ul>");
                		out.print(" <li>"+rs.getString(1)+"</li>");
                		out.print(" <li>"+rs.getString(2)+"</li>");
                		out.print(" <li>"+rs.getString(3)+"</li>");
                		out.print("<li>");
                		out.print("<em class='em'>");
                		out.print("<span>修改</span>");
                		out.print("<span>刪除</span>");
                		out.print("</em>");
                		out.print("</li>");
                		out.print("</ul>");
                	}
                	conn.close();
                %>
            	<div class="ye">
                    <span>上一页</span>
                    <span>第1页</span>
                    <span>下一页</span>
                </div>
            </div>
        </div>
    </div>

</body>
<script>
    
    $(".lie li").toggle(function(e){
        var a = $(e.target).children("ul");
        a.show(500);
    },function(e){
        var a = $(e.target).children("ul");
        a.hide(500);
    });

    $("#c_r").click(function(e){
       $(".ta").css("display","block");
    });
</script>
</html>