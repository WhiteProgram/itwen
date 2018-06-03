package model;
import java.sql.*;
import com.sun.rowset.*;

import db.DButil;
public class UserModel{
   int pageSize=7;                      //ÿҳ��ʾ�ļ�¼��
   int pageAllCount=0;                   //��ҳ�����ҳ��
   int showPage=1   ;                   //��ǰ��ʾҳ 
   StringBuffer presentPageResult = null;      //��ʾ��ǰҳ����
   CachedRowSetImpl rowSet;            //���ڴ洢ResultSet����
   String tableName="";                //�������
   String 字段[]=new String[100] ;
   int 字段个数=0;
   public UserModel(){
      presentPageResult=new StringBuffer();
      try{ Class.forName("com.mysql.jdbc.Driver"); 
      }
      catch(Exception e){} 
   }
   public void setPageSize(int size){
      pageSize=size;
      字段个数=0;
      try{  Connection con=DButil.getConnection();
            DatabaseMetaData metadata=con.getMetaData();
            ResultSet rs1=metadata.getColumns(null,null,tableName,null);
            int k=0;
            while(rs1.next()){
               字段个数++;
               字段[k]=rs1.getString(4); //��ȡ�ֶε�����
               k++;
            }
            Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                          ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=sql.executeQuery("SELECT * FROM "+tableName);
            rowSet=new CachedRowSetImpl();  //�����м�����
            rowSet.populate(rs);
            con.close();                    //�ر����� 
            rowSet.last();
            int m=rowSet.getRow();          //������
            int n=pageSize;
            pageAllCount=((m%n)==0)?(m/n):(m/n+1);
      }
      catch(Exception exp){}
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
            	 str.append(" <li>"+rowSet.getString(2)+"</li>");
            	 str.append(" <li>"+rowSet.getString(3)+"</li>");
            	 str.append(" <li>"+rowSet.getString(5)+"</li>");
            	 str.append("<li>");
            	 str.append("<em class='em'>");
            	 str.append("<a href='#'>修改</a>");
            	 str.append("<a href='#'>刪除</a>");
            	 str.append("</em>");
            	 str.append("</li>");
            	 str.append("</ul>");
                boo=rowSet.next();
             }
       }
       catch(SQLException exp){}
       return str;
   }

   public void setTableName(String s){
      tableName=s.trim();
   }
}