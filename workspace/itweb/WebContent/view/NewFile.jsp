<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.UserModel" %>
<jsp:useBean id="look" class="model.UserModel" scope="session"/>
<jsp:setProperty name="look" property="tableName" value="userroot"/>
<HTML><BODY bgcolor=cyan>
     数据库
     <jsp:getProperty  name= "look" property="tableName"/>表的记录将被分页显示。
<br>共有 <jsp:getProperty name="look" property="pageAllCount"/> 页，
    每页最多显示<jsp:getProperty  name="look"  property="pageSize" />条记录。
  <jsp:getProperty  name= "look"  property="presentPageResult" />
  <BR>单击“前一页”或“后一页”按纽查看记录（当前显示第
  <jsp:getProperty  name= "look"  property="showPage" /> 页）。
 <Table>
  <tr><td><FORM action="">
        <Input type=hidden name="showPage" value="<%=look.getShowPage()-1 %>" >
        <Input type=submit name="g" value="前一页">
        </FORM>
      </td>
      <td><FORM action="">
        <Input type=hidden name="showPage" value="<%=look.getShowPage()+1 %>" >
        <Input type=submit name="g" value="后一页">
        </Form>
      </td>
      <td> <FORM action="">
           输入页码：<Input type=text name="showPage" size=5 >
           <Input type=submit name="g" value="提交">
           </FORM>
      </td>
  </tr>
  </Table>
</BODY></HTML>