<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.ShowRecordByPage" %>
<jsp:useBean id="look" class="model.ShowRecordByPage" scope="session"/>
<jsp:setProperty name="look" property="databaseName" value="itwen"/>
<jsp:setProperty name="look" property="tableName" value="shangping"/>
<jsp:setProperty name="look" property="user" value="root"/>
<jsp:setProperty name="look" property="password" value=""/>
 <jsp:setProperty name="look" property="pageSize" value="3"/>
<HTML><BODY bgcolor=cyan>
     数据库
     <jsp:getProperty  name= "look" property="databaseName"/>中
     <jsp:getProperty  name= "look" property="tableName"/>表的记录将被分页显示。
<br>共有 <jsp:getProperty name="look" property="pageAllCount"/> 页，
    每页最多显示<jsp:getProperty  name="look"  property="pageSize" />条记录。
   <jsp:setProperty  name= "look"  property="showPage"  />
  <jsp:getProperty  name= "look"  property="presentPageResult" />
  <BR>单击“前一页”或“后一页”按纽查看记录（当前显示第
  <jsp:getProperty  name= "look"  property="showPage" /> 页）。
 <Table>
  <tr><td><FORM action="login" method="post">
        <Input type=hidden name="showPage" value="<%=look.getShowPage()-1 %>" >
        <Input type=submit name="g" value="前一页">
        </FORM>
      </td>
      <td><FORM action="login" method="post">
        <Input type=hidden name="showPage" value="<%=look.getShowPage()+1 %>" >
        <Input type=submit name="g" value="后一页">
        </Form>
      </td>
      <td> <FORM action="login" method="post">
           输入页码：<Input type=text name="showPage" size=5 >
           <Input type=submit name="g" value="提交">
           </FORM>
      </td>
  </tr>
  </Table>
</BODY></HTML>