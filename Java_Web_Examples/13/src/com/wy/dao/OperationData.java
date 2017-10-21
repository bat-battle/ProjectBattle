package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.wy.form.Photo;
import com.wy.form.UserInfo;
import com.wy.tools.JDBConnection;

public class OperationData {
	private JDBConnection connection = null; //�������ݿ�������JDBConnection���󲢸�ֵΪnull
	private List list = null;                //����һ��List�����࣬����ֵΪnull
	String sql = "";                         //����һ��SQL���͵Ķ��󣬲���ֵΪһ�����ַ���
	                        //���û���Ϊ��������ѯ�û���Form�������ǵ����û�������
	public UserInfo user_query(String username) {
		UserInfo userInfo = null;         //�����û���UserInfo�����
		connection = new JDBConnection(); //��JDBCOnnection�������ʵ����
		sql = "SELECT * FROM tb_userInfo WHERE username='" + username + "'";
		//���ò�ѯ��SQL���
		ResultSet rs = connection.executeQuery(sql); //ִ�в�ѯ���������ؽ����ResultSet�����
		try {
			//�Խ�����������ѭ������
			while (rs.next()) {
				userInfo = new UserInfo();                       // ʵ����UserInfo����
				userInfo.setId(rs.getInt("id"));                 // �����ݱ���id�ֶ����ݽ��и�ֵ
				userInfo.setUsername(rs.getString("username"));  // �����ݱ���username�ֶ����ݽ��и�ֵ
				userInfo.setPassword(rs.getString("password"));  // �����ݱ���passwrod�ֶ����ݽ��и�ֵ
				userInfo.setRealname(rs.getString("realname"));  // �����ݱ���realname�ֶ����ݽ��и�ֵ
				userInfo.setEmail(rs.getString("email"));        // �����ݱ���email�ֶ����ݽ��и�ֵ
				userInfo.setQuestion(rs.getString("question"));  // �����ݱ���question�ֶ����ݽ��и�ֵ
				userInfo.setResult(rs.getString("result"));      // �����ݱ���result�ֶ����ݽ��и�ֵ
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			connection.closeConnection();                       // ִ�йر����ݿ����ӵĲ���
		}
		return userInfo;                                        // �������û���Ϊ�������в�ѯ�û���һ������
	}

	// ʵ���û�����������÷������û���Ϣ��Ķ���Ϊ����
	public boolean user_save(UserInfo userinfo) {
		connection = new JDBConnection(); //��JDBConnection�������ʵ����
		sql = "INSERT INTO tb_userInfo VALUES ('" + userinfo.getUsername()
				+ "','" + userinfo.getPassword() + "','"
				+ userinfo.getRealname() + "','" + userinfo.getEmail() + "','"
				+ userinfo.getQuestion() + "','" + userinfo.getResult() + "')";
		boolean flag = connection.executeUpdate(sql); //ִ�б����û��Ĳ�����flag����ֵ��ʾ�����ݿ��Ա�ʾִ�еĽ��
		connection.closeConnection();                 //�ر����ݿ����Ӳ���
		return flag;                                  //��flag������Ϊ��������ķ��ؽ��
	}

	// ʵ����Ƭ���ݱ���������÷�������Ƭ��Ϣ��Ķ���Ϊ����
	public boolean photo_save(Photo photo) {
		connection = new JDBConnection(); // ��JDBConnection�������ʵ����
		sql = "insert into tb_photo values ('" + photo.getPhotoName() + "','"
				+ photo.getPhotoSize() + "','" + photo.getPhotoType() + "','"
				+ photo.getPhotoTime() + "','" + photo.getPhotoAddress()
				+ "','" + photo.getUsername() + "',0,'" + photo.getSmallPhoto()
				+ "')";
		// ���ñ�����Ƭ���ݿ��SQL���
		boolean flag = connection.executeUpdate(sql); // ִ�б�����Ƭ��Ϣ������SQL���
		connection.closeConnection(); // �ر����ݿ����Ӳ���
		return flag; // ��flag������Ϊ��������ķ��ؽ��
	}

	// ��Ƭ��ɾ���������÷�������Ƭ��idΪ����
	public boolean photo_delete(Integer id) {
		connection = new JDBConnection(); // ʵ����JDBConnection��Ķ���
		sql = "delete from tb_photo where id=" + id + ""; // ����ɾ����Ƭ��SQL���
		boolean flag = connection.executeUpdate(sql); // ִ��ɾ����SQL������ִ�н����ֵflag����
		connection.closeConnection(); // �ر����ݿ����Ӳ���
		return flag; // ��SQL����ִ�н����Ϊ��������ķ���ֵ
	}

	// ��ѯ���Ĳ�����condition����Ϊ��������Ĳ�������Ҫ�����ò�ѯ������
	public List photo_queryList(String condition) {
		Photo photo = null; // ������Ƭ��Ϣ��Ķ���
		list = new ArrayList(); // ��List���϶������ʵ����
		sql = "SELECT * FROM tb_photo"; // ���ö���Ƭȫ��������ѯ�Ĳ���
		if (condition != null) { // ��condition����Ϊ�գ�������������������SQL���
			sql = "SELECT * FROM tb_photo WHERE " + condition + "";
		}
		connection = new JDBConnection(); // ʵ����JDBCOnneciotn����
		ResultSet rs = connection.executeQuery(sql); // ִ�в�ѯ��SQL��䣬����ѯ�Ľ����ֵ��ResultSet����
		try {
			// ѭ��rs����
			while (rs.next()) {
				photo = new Photo(); // ����Ƭ��Ϣ�������ʵ����
				photo.setId(rs.getInt(1)); // ����1���ֶ����ݽ��и�ֵ
				photo.setPhotoName(rs.getString(2));// ����2���ֶ����ݽ��и�ֵ
				photo.setPhotoSize(rs.getString(3));// ����3���ֶ����ݽ��и�ֵ
				photo.setPhotoType(rs.getString(4));// ����4���ֶ����ݽ��и�ֵ
				photo.setPhotoTime(rs.getString(5));// ����5���ֶ����ݽ��и�ֵ
				photo.setPhotoAddress(rs.getString(6));// 6��1���ֶ����ݽ��и�ֵ
				photo.setUsername(rs.getString(7));// ����7���ֶ����ݽ��и�ֵ
				photo.setPrintAddress(rs.getString(8));// ����8���ֶ����ݽ��и�ֵ
				photo.setSmallPhoto(rs.getString(9));// ����9���ֶ����ݽ��и�ֵ
				list.add(photo); // ����ѯ�Ľ��������List���϶�����
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection(); // �ر����ݿ����Ӳ���
		}
		return list;
	}

	// ���û���Ϊ��������ѯ�����ϴ���������
	public String[] queryPhotoType(String username) {
		String[] type = null; // ����type���飬�����ݱ����û��ϴ���������
		sql = "select photoType from tb_photo  where username='" + username
				+ "' group by photoType"; // ���÷����ѯ��SQL���
		connection = new JDBConnection(); // ��JDBConnection�������ʵ����
		ResultSet rs = connection.executeQuery(sql); // ִ�в�ѯSQL��䣬������ѯ���������rs������
		try {
			rs.last(); // rsִ��ָ�����һ������
			int length = rs.getRow(); // ��ѯ��ǰ��¼��
			type = new String[length]; // �����ݵĳ��Ƚ�������
			rs.beforeFirst(); // ��rsָ��ָ����ǰ������ݿ�
			int i = 0; // ����i������������¼ѭ���Ĵ���
			// rs�������ѭ��
			while (rs.next()) {
				type[i++] = rs.getString("photoType");// �������е�ÿ��������и�ֵ
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection();
		}
		return type; // ����ѯ�Ľ��������з���
	}

	// ���Զ����Ϊ�������޸�ˮӡͼƬ��λ��
	public boolean updatePhoto(Photo photo) {
		connection = new JDBConnection(); // ��JDBConnection�������ʵ����
		sql = "update tb_photo set printAddress = '" + photo.getPrintAddress()
				+ "' where id = '" + photo.getId() + "'";

		if (connection.executeUpdate(sql)) {
			return true;
		} else {
			return false;
		}
	}

	// ��ҳ��ѯ����
	public List queryPhotoList() {
		connection = new JDBConnection();
		list = new ArrayList(); // ��List���϶������ʵ����
		sql = "select photoType,count(*) as number from tb_photo group by photoType order by number desc";
		Photo photo = null;
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				photo = new Photo();
				photo.setPhotoType(rs.getString("photoType"));
				photo.setNumber(rs.getInt("number"));
				list.add(photo); // ����ѯ�Ľ��������List���϶�����
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.closeConnection(); // �ر����ݿ����Ӳ���
		}
		return list;
	}


}
