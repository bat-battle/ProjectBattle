package electric.electricUtils;
import java.sql.*;
import java.io.*;
import java.util.*;

public class DbConnectionManager {

  private Connection con; 													//����һ��Connection����
  public static Connection getConnection() {
	  Connection con = null;
 	String user="sa";														//��¼���ݿ��û���
	  String password="";													//��¼���ݿ�����
	 	try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();	//�������ݿ�����
		} catch (Exception e) {System.out.println(e.getMessage());} 
	 	try{ 
		 String uri="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=YWW";			//���ݿ�URL
		 con=DriverManager.getConnection(uri,user,password); 					//��������
	 	}catch(SQLException e){System.out.println(e.getMessage());} 
		 return con;
	}
	public void setCon(Connection con) {
		this.con = con;   
	}     
 }

