<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.UserModel" %>
<jsp:useBean id="look" class="model.UserModel" scope="session"/>
<jsp:setProperty name="look" property="tableName" value="shangping"/>
 <jsp:setProperty name="look" property="pageSize" value="3"/>
 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="/itweb/css/base.css" />
    <link rel="stylesheet" href="/itweb/css/success.css" />
    <script src="/itweb/js/jquery-1.3.2.js"></script>
	<title>登录成功</title>
	
</head>
<BODY bgcolor=cyan>
    <div class="ta">
                <div class="biao">商品列表</div>
           		<form action="" method="post" name="myform2">
                    <input type="text" id="text" name="text"/>
                    <input type="submit" value="搜索" onclick="check2()">
                </form>
                <ul>
                    <li>商品名称</li>
                    <li>商品描述</li>
                    <li>商品价格</li>
                    <li>操作</li>
                </ul>
                <jsp:setProperty  name= "look"  property="showPage"  />
  <jsp:getProperty  name= "look"  property="presentPageResult" />
  		<div class="ye">
                   <FORM action="">
        <Input type=hidden name="showPage" value="<%=look.getShowPage()-1 %>" >
        <span> <Input type=submit name="g" value="上一页"></span>
        <span><Input type=text name="showPage" size=1 value=<%=look.getShowPage() %>>页(共<jsp:getProperty name="look" property="pageAllCount"/>页)</span>          
        <Input type=hidden name="showPage" value="<%=look.getShowPage()+1 %>" >
       <span> <Input type=submit name="g" value="下一页"></span>
        </Form>
       </div>
 </div>

 				
</BODY></HTML>