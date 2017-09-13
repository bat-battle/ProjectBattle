package com.tools;

import java.sql.*;
import java.io.*;
import java.util.*;

public class ConnDB {
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	private static String propFileName = "/com/connDB.properties"; // ָ����Դ�ļ������λ��
	private static Properties prop = new Properties();
	private static String dbClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=db_shop";
	private static String dbUser = "sa";
	private static String dbPwd = "";

	public ConnDB() {
		try {
			InputStream in = getClass().getResourceAsStream(propFileName);
			prop.load(in); // ͨ���������������Properties�ļ�
			dbClassName = prop.getProperty("DB_CLASS_NAME"); // ��ȡ���ݿ�����
			dbUrl = prop.getProperty("DB_URL", dbUrl);
			dbUser = prop.getProperty("DB_USER", dbUser);
			dbPwd = prop.getProperty("DB_PWD", dbPwd);
		} catch (Exception e) {
			e.printStackTrace(); // ����쳣��Ϣ
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(dbClassName).newInstance();
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			System.err
					.println("����: DbConnectionManager.getConnection() ������ݿ�����ʧ��.\r\n\r\n��������:"
							+ dbClassName
							+ "\r\n����λ��:"
							+ dbUrl
							+ "\r\n�û�/����"
							+ dbUser + "/" + dbPwd);
		}
		return conn;
	}

	/*
	 * ���ܣ�ִ�в�ѯ���
	 */
	public ResultSet executeQuery(String sql) {
		try { // ��׽�쳣
			conn = getConnection(); // ����getConnection()��������Connection�����һ��ʵ��conn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage()); // ����쳣��Ϣ
		}
		return rs; // ���ؽ��������
	}

	/*
	 * ����:ִ�и��²���
	 */
	public int executeUpdate(String sql) {
		int result = 0; // ���屣�淵��ֵ�ı���
		try { // ��׽�쳣
			conn = getConnection(); // ����getConnection()��������Connection�����һ��ʵ��conn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql); // ִ�и��²���
		} catch (SQLException ex) {
			result = 0; // �����淵��ֵ�ı�����ֵΪ0
		}
		try {
			stmt.close();
		} catch (SQLException ex1) {
		}
		return result; // ���ر��淵��ֵ�ı���
	}

	public int executeUpdate_id(String sql) {
		int result = 0; // ���屣�淵��ֵ�ı���
		try { // ��׽�쳣
			conn = getConnection(); // ����getConnection()��������Connection�����һ��ʵ��conn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql); // ִ�и��²���
			// ��ȡ�ող����¼���Զ����
			String ID = "select @@IDENTITY as id";
			rs = stmt.executeQuery(ID);
			if (rs.next()) {
				int autoID = rs.getInt("id");
				result = autoID;
			}
		} catch (SQLException ex) {
			result = 0;
		}
		return result; // ���ظող�����Զ����
	}

	/*
	 * ����:�ر����ݿ������
	 */
	public void close() {
		try { // ��׽�쳣
			if (rs != null) { // ��ResultSet�����ʵ��rs��Ϊ��ʱ
				rs.close(); // �ر�ResultSet����
			}
			if (stmt != null) { // ��Statement�����ʵ��stmt��Ϊ��ʱ
				stmt.close(); // �ر�Statement����
			}
			if (conn != null) { // ��Connection�����ʵ��conn��Ϊ��ʱ
				conn.close(); // �ر�Connection����
			}
		} catch (Exception e) {
			e.printStackTrace(System.err); // ����쳣��Ϣ
		}
	}

}
