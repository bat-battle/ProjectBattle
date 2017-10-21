package com.core;

import java.io.InputStream;
import java.sql.*;
import java.util.*;

/**
 * <p>Title: </p>
 * <p>Description: ���ݿ�����</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 1.0
 */

public class Database {
	  public static Connection conn = null;
	  public Statement stmt = null;
	  public ResultSet rs = null;
	  private static String propFileName = "/com/connDB.properties";	//ָ����Դ�ļ������λ��
	  private static Properties prop = new Properties();
	  private static String dbClassName ="com.mysql.jdbc.Driver";
	  private static String dbUrl =
	      "jdbc:mysql://127.0.0.1:3306/db_myEnterprise?user=root&password=111&useUnicode=true";

    public Database() {
	    try {
		      InputStream in=getClass().getResourceAsStream(propFileName);
		      prop.load(in);									//ͨ���������������Properties�ļ�
		      dbClassName = prop.getProperty("DB_CLASS_NAME");	//��ȡ���ݿ�����
		      dbUrl = prop.getProperty("DB_URL",
		                               "jdbc:mysql://127.0.0.1:3306/db_myEnterprise?user=root&password=111&useUnicode=true&characterEncoding=gbk");
		    }
		    catch (Exception e) {
		      e.printStackTrace();		//����쳣��Ϣ
		    }
    }

    public static Connection getConnection() {
	    try {
	      Class.forName(dbClassName).newInstance();
	      conn = DriverManager.getConnection(dbUrl);
	    }
	    catch (Exception ee) {
	      ee.printStackTrace();
	    }
	    if (conn == null) {
	      System.err.println(
	          "����: DbConnectionManager.getConnection() ������ݿ�����ʧ��.\r\n\r\n��������:" +
	          dbClassName + "\r\n����λ��:" + dbUrl);
	    }
	    return conn;
    }

    public static int getRow(String sql) {
        int i = 0;
        conn = Database.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement("SELECT COUNT(*) FROM " + sql,
                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_READ_ONLY);
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            i = 0;
        } finally {
            System.out.println("SELECT COUNT(*) FROM " + sql);
            try {
                rs.close();
                ps.close();
            } catch (SQLException e) {}
        }
        return i;
    }
    public static boolean Delete(String sql) {
        boolean b = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = Database.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() > 0) {
                b = true;
            } else {
                b = false;
            }
        } catch (SQLException e) {
            b = false;
            e.printStackTrace();
        } finally {
            System.out.println(ps + " Database.Delete() "+sql);
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                ps = null;
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                con = null;
            }
        }
        return b;
    }
}
