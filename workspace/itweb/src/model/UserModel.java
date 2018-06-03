package model;
import java.sql.*;
import com.sun.rowset.*;

import db.DButil;
public class UserModel{
   int pageSize=7;                        //每页显示的记录数
   int pageAllCount=0;                   //分页后的总页数
   int showPage=1   ;                   //当前显示页 
   StringBuffer presentPageResult;      //显示当前页内容
   CachedRowSetImpl rowSet;           //用于存储ResultSet对象
   String databaseName="";             //数据库名称
   String tableName="";                //表的名字
   String user=""       ;             //用户
   String password="" ;   
   String getStr1="";
   String getStr2="";
   String getStr3="";

public String getGetStr1() {
	return getStr1;
}
public void setGetStr1(String getStr1) {
	this.getStr1 = getStr1;
}
public String getGetStr2() {
	return getStr2;
}
public void setGetStr2(String getStr2) {
	this.getStr2 = getStr2;
}
public String getGetStr3() {
	return getStr3;
}
public void setGetStr3(String getStr3) {
	this.getStr3 = getStr3;
}
public String getDatabaseName() {
	return databaseName;
}
public void setDatabaseName(String databaseName) {
	this.databaseName = databaseName;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getPageSize() {
	return pageSize;
}
public String getTableName() {
	return tableName;
}
public void setPageAllCount(int pageAllCount) {
	this.pageAllCount = pageAllCount;
}
public void setPresentPageResult(StringBuffer presentPageResult) {
	this.presentPageResult = presentPageResult;
}

String 字段[]=new String[100] ;
   int 字段个数=0;
   public UserModel(){
      presentPageResult=new StringBuffer();
     
   }
   public void setPageSize(int size){
      pageSize=size;
      字段个数=0;
       Connection con = null;
      try {
		con=DButil.getConnection();
		        DatabaseMetaData metadata=con.getMetaData();
		        ResultSet rs1=metadata.getColumns(null,null,tableName,null);
		        int k=0;
		        while(rs1.next()){
		           字段个数++;
		           字段[k]=rs1.getString(4);  //获取字段的名字
		           k++;
		        }
		        Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
		                      ResultSet.CONCUR_READ_ONLY);
		        ResultSet rs=sql.executeQuery("SELECT * FROM "+tableName);
		        rowSet=new CachedRowSetImpl();  //创建行集对象
		        rowSet.populate(rs);
		        con.close();                     //关闭连接
		        rowSet.last();
		        int m=rowSet.getRow();          //总行数
		        int n=pageSize;
		        pageAllCount=((m%n)==0)?(m/n):(m/n+1);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
   }
   public int getPageAllCount(){
      return pageAllCount;
   } 
   public void setShowPage(int n){
      showPage=n;
   }
   public int getShowPage(){
      return showPage;
   }
   public StringBuffer getPresentPageResult(){
      if(showPage>pageAllCount)
          showPage=1;
       if(showPage<=0)
          showPage=pageAllCount;
       presentPageResult=show(showPage);
       return presentPageResult; 
   }
   public StringBuffer show(int page){
       StringBuffer str=new StringBuffer();
       try{  rowSet.absolute((page-1)*pageSize+1);
             boolean boo=true;
             for(int i=1;i<=pageSize&&boo;i++){
            	 
            	 str.append("<ul>");
            	 str.append(" <li>"+rowSet.getString(getStr1)+"</li>");
            	 str.append(" <li>"+rowSet.getString(getStr2)+"</li>");
            	 str.append(" <li>"+rowSet.getString(getStr3)+"</li>");
            	 str.append("<li>");
            	 str.append("<em class='em'>");
            	 str.append("<a href='#'>修改</a>");
            	 str.append("<a href=\'d?method=get&table=userroot&username="+rowSet.getString(1)+"\'>刪除</a>");
            	 str.append("</em>");
            	 str.append("</li>");
            	 str.append("</ul>");
                boo=rowSet.next();
             }
       }
       catch(SQLException exp){
 
       }
       return str;
   }

   public void setTableName(String s){
      tableName=s.trim();
   }
}