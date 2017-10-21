package com.mingri.info;

import com.mingri.dbconn.DBResult;
import java.sql.*;

public class KhRegist {
	private KhinfoBean khinfo;
	DBResult rst = new DBResult();

	public void setKhinfo(KhinfoBean khinfo) {
		this.khinfo = khinfo;
	}

	public void regist() throws Exception {
		String reg = "insert into tb_customer values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = rst.getPreparedStatement(reg);
			// ����һ��Ԥ������䣬Ȼ���������ǵĲ���
			pstmt.setString(1, khinfo.getKhname());
			pstmt.setString(2, khinfo.getKhjc());
			pstmt.setString(3, khinfo.getAddress());
			pstmt.setString(4, khinfo.getPostcode());
			pstmt.setString(5, khinfo.getTel());
			pstmt.setString(6, khinfo.getFax());
			pstmt.setString(7, khinfo.getLxr());
			pstmt.setString(8, khinfo.getLxrtel());
			pstmt.setString(9, khinfo.getEmail());
			pstmt.setString(10, khinfo.getKhyh());
			pstmt.setString(11, khinfo.getYhzh());
			// ִ�и��²���
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
