package model;
import java.sql.*;
import com.sun.rowset.*;
public class ShowRecordByPage{
   int pageSize=10;                      //每页显示的记录数
   int pageAllCount=0;                   //分页后的总页数
   int showPage=1   ;                   //当前显示页 
   StringBuffer presentPageResult;      //显示当前页内容
   CachedRowSetImpl rowSet;            //用于存储ResultSet对象
   String databaseName="";             //数据库名称
   String tableName="";                //表的名字
   String user=""       ;             //用户
   String password="" ;               //密码 
   String 字段[]=new String[100] ;
   int 字段个数=0;
   public ShowRecordByPage(){
      presentPageResult=new StringBuffer();
      try{ Class.forName("com.mysql.jdbc.Driver"); 
      }
      catch(Exception e){} 
   }
   public void setPageSize(int size){
      pageSize=size;
      字段个数=0;
      String uri="jdbc:mysql://127.0.0.1/"+databaseName;
      try{  Connection con=DriverManager.getConnection(uri,user,password);
            DatabaseMetaData metadata=con.getMetaData();
            ResultSet rs1=metadata.getColumns(null,null,tableName,null);
            int k=0;
            while(rs1.next()){
               字段个数++;
               字段[k]=rs1.getString(4); //获取字段的名字
               k++;
            }
            Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                          ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=sql.executeQuery("SELECT * FROM "+tableName);
            rowSet=new CachedRowSetImpl();  //创建行集对象
            rowSet.populate(rs);
            con.close();                    //关闭连接 
            rowSet.last();
            int m=rowSet.getRow();          //总行数
            int n=pageSize;
            pageAllCount=((m%n)==0)?(m/n):(m/n+1);
      }
      catch(Exception exp){}
   }
   public int getPageSize(){
      return pageSize;
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
       str.append("<table border=1>");
       str.append("<tr>");
       for(int i=0;i<字段个数;i++)
          str.append("<th>"+字段[i]+"</th>");
       str.append("</tr>");
       try{  rowSet.absolute((page-1)*pageSize+1);
             boolean boo=true;
             for(int i=1;i<=pageSize&&boo;i++){
                str.append("<tr>");
                for(int k=1;k<=字段个数;k++)
                    str.append("<td>"+rowSet.getString(k)+"</td>");
                str.append("</tr>");
                boo=rowSet.next();
             }
       }
       catch(SQLException exp){}
       str.append("</table>");   
       return str;
   }
   public void setDatabaseName(String s){
      databaseName=s.trim();
   }
   public String getDatabaseName(){
      return databaseName;
   }
   public void setTableName(String s){
      tableName=s.trim();
   }
   public String getTableName(){
      return tableName;
   }
   public void setPassword(String s){
      password=s.trim();;
   }
   public void setUser(String s){
      user=s.trim();
   }
   public String getUser(){
      return user;
   } 
}