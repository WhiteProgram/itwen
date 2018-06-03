<%@page import="db.DButil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="model.ShowRecordByPage" %>
<jsp:useBean id="look" class="model.ShowRecordByPage" scope="session"/>
<jsp:setProperty name="look" property="databaseName" value="itwen"/>
<jsp:setProperty name="look" property="tableName" value="shangping"/>
<jsp:setProperty name="look" property="user" value="root"/>
<jsp:setProperty name="look" property="password" value=""/>
 <jsp:setProperty name="look" property="pageSize" value="3"/>
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
<script>
	function hid(){
		 $(".r").css("display","none");
		 $(".s").css("display","none");
	}
</script>
<body>
 
                			  
	<div class="layout">
        <div class="header">
            <span>后台管理系统</span>
        </div>
        <div class="con_left">
            <ul class="lie">
                <li>商品管理
                    <ul>
                        <li id="c_s">商品列表</li>
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
			<div class="ta r">
			
                <div class="biao">管理员列表</div>
           		<form action="success" method="post" class="myform" name="myform1">
                    <input type="text" id="t" name="t"/>
                    <input type="submit" value="搜索" onclick="check()">
                </form>
                <ul>
                    <li>用户名</li>
                    <li>密码</li>
                    <li>email</li>
                    <li>操作</li>
                </ul>
                
                <%
                Connection conn = DButil.getConnection();
            	PreparedStatement sql;
            	ResultSet rs;
                %>
           
                			<%
                			String t = request.getParameter("t");
                			if(t == null)
                				t = "";
                			if(t.equals(" ")){
                				t = "";
                				%>
                				<script>
                				hid();
                					$(".r").css("display","block");
                				</script>
                				<%
                			}
                			if(t.length() != 0){	%>
            				<script>
            				hid();
        					$(".r").css("display","block");
        				</script>
        				<%
                				sql = conn.prepareStatement("select * from userroot where username like ?");
                				sql.setString(1, "%"+t+"%");
                				rs = sql.executeQuery();
                				while(rs.next()){
                            		out.print("<ul>");
                            		out.print(" <li>"+rs.getString(1)+"</li>");
                            		out.print(" <li>"+rs.getString(2)+"</li>");
                            		out.print(" <li>"+rs.getString(3)+"</li>");
                            		out.print("<li>");
                            		out.print("<em class='em'>");
                            		out.print("<a href='#'>修改</a>");
                            		out.print("<a href='#'>刪除</a>");
                            		out.print("</em>");
                            		out.print("</li>");
                            		out.print("</ul>");
                            		}
                			}else if(t.equals("")){
                			sql = conn.prepareStatement("select * from userroot");
							 rs = sql.executeQuery();
                        	while(rs.next()){
                        		out.print("<ul>");
                        		out.print(" <li>"+rs.getString(1)+"</li>");
                        		out.print(" <li>"+rs.getString(2)+"</li>");
                        		out.print(" <li>"+rs.getString(3)+"</li>");
                        		out.print("<li>");
                        		out.print("<em class='em'>");
                        		out.print("<a href='#'>修改</a>");
                        		out.print("<a href='#'>刪除</a>");
                        		out.print("</em>");
                        		out.print("</li>");
                        		out.print("</ul>");
                        		}
                			}
        
                			%>
                
                
            	<div class="ye">
                    <span>上一页</span>
                    <span>第1页</span>
                    <span>下一页</span>
                </div>
            </div>
            <div class="ta s">
           
                <div class="biao">商品列表</div>
           		<form action="success" method="post" class="myform" name="myform2">
                    <input type="text" id="text" name="text"/>
                    <input type="submit" value="搜索" onclick="check2()">
                </form>
                <ul>
                    <li>商品名称</li>
                    <li>商品描述</li>
                    <li>商品价格</li>
                    <li>操作</li>
                </ul>
            
                			<%
                			String text = request.getParameter("text");
                			if(text == null)
                				text = "";
                			if(text.equals("  ")){
                				text = "";
                				%>
                				<script>
                				hid();
                					$(".s").css("display","block");
                				</script>
                				<%
                			}
                			if(text.length()!=0){%>
            				<script>
            				hid();
            					$(".s").css("display","block");
            				</script>
            				<%
                				sql = conn.prepareStatement("select * from shangping where name like ?");
                				sql.setString(1, "%"+text+"%");
                				rs = sql.executeQuery();
                				while(rs.next()){
                            		out.print("<ul>");
                            		out.print(" <li>"+rs.getString(2)+"</li>");
                            		out.print(" <li>"+rs.getString(3)+"</li>");
                            		out.print(" <li>"+rs.getString(5)+"</li>");
                            		out.print("<li>");
                            		out.print("<em class='em'>");
                            		out.print("<a href='#'>修改</a>");
                            		out.print("<a href='#'>刪除</a>");
                            		out.print("</em>");
                            		out.print("</li>");
                            		out.print("</ul>");
                            		}
                				conn.close();
                			}else if(text.equals("")){
                			%>
                			<jsp:setProperty  name= "look"  property="showPage"  />
 								<jsp:getProperty  name= "look"  property="presentPageResult" />
                			<%
                			}
                        	conn.close();
                			%>
                
                
            	<div class="ye">
                    <form action="login" method="post">
        <Input type=hidden name="showPage" value="<%=look.getShowPage()-1 %>" >
        <span> <Input type=submit name="g" value="上一页"></span>
        <span><Input type=text name="showPage" size=1 value=<%=look.getShowPage() %>>页(共<jsp:getProperty name="look" property="pageAllCount"/>页)</span>          
        <Input type=hidden name="showPage" value="<%=look.getShowPage()+1 %>" >
       <span> <Input type=submit name="g" value="下一页"></span>
        </form>
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
	function check(){
		var te = $('.r').attr("class");
    	if(te == "ta r"&&document.getElementById("t").value==""){
    		document.getElementById("t").value=" ";
    	}
    	
	}
	function check2(){
		var te = $('.s').attr("class");
    	if(te == "ta s"&&document.getElementById("text").value==""){
    		document.getElementById("text").value="  ";
    	}
    	
	}
 
    
    $("#c_r").click(function(){
    	hid();
       $(".r").css("display","block");
    });
    $("#c_s").click(function(){
    	hid();
        $(".s").css("display","block");
     });
</script>
</html>