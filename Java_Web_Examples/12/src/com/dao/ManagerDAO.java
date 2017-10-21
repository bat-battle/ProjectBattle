package com.dao;

import com.core.*;
import java.util.*;
import com.actionForm.ManagerForm;
import java.sql.*;
import java.*;

public class ManagerDAO {
    private ConnDB conn = new ConnDB();
    //��ѯ����
    public Collection query(String queryif) {
        ManagerForm managerForm = null;
      Collection managercoll = new ArrayList();
        String sql = "";
        if (queryif == null || queryif == "" || queryif == "all") {	//������queryif��ֵΪnull��all���ʱ��ѯȫ������
            sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id";
            }else{
                sql="select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id where m.name='"+queryif+"'";			//�˴���ҪӦ��������
        }
        ResultSet rs = conn.executeQuery(sql);					//ִ��SQL���
        try {											//��׽�쳣��Ϣ
            while (rs.next()) {
                managerForm = new ManagerForm();
                managerForm.setId(Integer.valueOf(rs.getString(1)));
                managerForm.setName(rs.getString(2));
                managerForm.setPwd(rs.getString(3));
                managerForm.setSysset(rs.getInt(4));
                managerForm.setReaderset(rs.getInt(5));
                managerForm.setBookset(rs.getInt(6));
                managerForm.setBorrowback(rs.getInt(7));
                managerForm.setSysquery(rs.getInt(8));
                managercoll.add(managerForm);			//����ѯ������浽Collection������
            }
        } catch (SQLException e) {}
        return managercoll;								//���ز�ѯ���
    }

    /*********************************************************/
    //��ѯȨ����Ϣ
    public ManagerForm query_p(String str) {
        ManagerForm managerForm1 = null;
        String sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id where m.name='"+str+"'";

        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setId(Integer.valueOf(rs.getString(1)));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerForm1.setSysset(rs.getInt(4));
                managerForm1.setReaderset(rs.getInt(5));
                managerForm1.setBookset(rs.getInt(6));
                managerForm1.setBorrowback(rs.getInt(7));
                managerForm1.setSysquery(rs.getInt(8));
            }
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }finally{
        	conn.close();
        }
        return managerForm1;
    }


    //����Ա�����֤
    public int checkManager(ManagerForm managerForm) {
        int flag = 0;
        ChStr chStr=new ChStr();
        String sql = "SELECT * FROM tb_manager where name='" +
        chStr.filterStr(managerForm.getName()) + "'";
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
                String pwd = chStr.filterStr(managerForm.getPwd());		//��ȡ��������벢���������ַ����е�Σ���ַ�
                if (pwd.equals(rs.getString(3))) {
                    flag = 1;
                } else {
                    flag = 0;
                }
            }else{
                flag = 0;
            }
        } catch (SQLException ex) {
            flag = 0;
        }finally{
        	conn.close();
        }
        return flag;
    }

    //�޸�ʱӦ�õĲ�ѯ����
    public ManagerForm query_update(ManagerForm managerForm) {
        ManagerForm managerForm1 = null;
        String sql = "select m.*,p.sysset,p.readerset,p.bookset,p.borrowback,p.sysquery from tb_manager m left join tb_purview p on m.id=p.id where m.id=" +
                     managerForm.getId() + "";

        ResultSet rs = conn.executeQuery(sql);	//ִ�в�ѯ���
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setId(Integer.valueOf(rs.getString(1)));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
                managerForm1.setSysset(rs.getInt(4));
                managerForm1.setReaderset(rs.getInt(5));
                managerForm1.setBookset(rs.getInt(6));
                managerForm1.setBorrowback(rs.getInt(7));
                managerForm1.setSysquery(rs.getInt(8));
            }
        } catch (SQLException ex) {
        	ex.printStackTrace();	//����쳣��Ϣ
        }finally{
        	conn.close();	//�ر����ݿ�����
        }
        return managerForm1;
    }
    //���Ŀ���ʱӦ�õĲ�ѯ����
    public ManagerForm query_pwd(ManagerForm managerForm) {
        ManagerForm managerForm1 = null;
        String sql = "SELECT * FROM tb_manager WHERE name='" +managerForm.getName() + "'";
        ResultSet rs = conn.executeQuery(sql);
        try {
            while (rs.next()) {
                managerForm1 = new ManagerForm();
                managerForm1.setId(Integer.valueOf(rs.getString(1)));
                managerForm1.setName(rs.getString(2));
                managerForm1.setPwd(rs.getString(3));
            }
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }finally{
        	conn.close();
        }
        return managerForm1;
    }
    //�������
    public int insert(ManagerForm managerForm) {
        String sql1="SELECT * FROM tb_manager WHERE name='"+managerForm.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_manager (name,pwd) values('" +
                                 managerForm.getName() + "','" +
                                 managerForm.getPwd() +
                                 "')";
                    falg = conn.executeUpdate(sql);
                    System.out.println("��ӹ���Ա��Ϣ��SQL��" + sql);
                }
            } catch (SQLException ex) {
                falg=0;
            }finally{
            	conn.close();
            }
        return falg;
    }

    //���ù���ԱȨ��
    public int update(ManagerForm managerForm) {
        String sql1="SELECT * FROM tb_purview WHERE id="+managerForm.getId()+"";
        ResultSet rs=conn.executeQuery(sql1);	//��ѯҪ����Ȩ�޵Ĺ���Ա��Ȩ����Ϣ
        String sql="";
        int falg=0;
        try {					//��׽�쳣��Ϣ
            if (rs.next()) {	//���Ѿ�����Ȩ��ʱ��ִ�и������
                sql = "Update tb_purview set sysset=" + managerForm.getSysset() +
                             ",readerset=" + managerForm.getReaderset() + ",bookset="+managerForm.getBookset()+",borrowback="+managerForm.getBorrowback()+",sysquery="+managerForm.getSysquery()+" where id=" +
                     managerForm.getId() + "";
            }else{	//δ����Ȩ��ʱ��ִ�в������
                sql="INSERT INTO tb_purview values("+managerForm.getId()+","+managerForm.getSysset()+","+managerForm.getReaderset()+","+managerForm.getBookset()+","+managerForm.getBorrowback()+","+managerForm.getSysquery()+")";
            }
            falg = conn.executeUpdate(sql);
            System.out.println("�޸�����ʱ��SQL��" + sql);
        } catch (SQLException ex) {
            falg=0;			//��ʾ���ù���ԱȨ��ʧ��
        }finally{
        	conn.close();	//�ر����ݿ�����
        }
        return falg;
    }
    //�޸Ĺ���Ա����
public int updatePwd(ManagerForm managerForm){
    String sql="UPDATE tb_manager SET pwd='"+managerForm.getPwd()+"' where name='"+managerForm.getName()+"'";
    int ret=conn.executeUpdate(sql);
    System.out.println("�޸Ĺ���Ա����ʱ��SQL��"+sql);
    conn.close();
    return ret;
}

//ɾ������
    public int delete(ManagerForm managerForm) {
    	int flag=0;
    	try{		//��׽�쳣��Ϣ
        String sql = "DELETE FROM tb_manager where id=" + managerForm.getId() +"";
        flag = conn.executeUpdate(sql);	//ִ��ɾ������Ա��Ϣ�����
        if (flag !=0){
            String sql1 = "DELETE FROM tb_purview where id=" + managerForm.getId() +"";
            conn.executeUpdate(sql1);	//ִ��ɾ��Ȩ����Ϣ�����
        }}catch(Exception e){
        	System.out.println("ɾ������Ա��Ϣʱ�����Ĵ���"+e.getMessage());	//���������Ϣ
        }finally{
        	conn.close();	//�ر����ݿ�����
        }
        return flag;
    }
}
