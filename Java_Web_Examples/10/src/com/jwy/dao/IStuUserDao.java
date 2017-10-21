package com.jwy.dao;

import java.util.List;

import com.jwy.dto.StuUser;

/**
 * 
 * @author Jingweiyu 
 */
public interface IStuUserDao {
	public StuUser findById(Integer id);			//���ձ�Ų�ѯ�û�
	public List<Object[]> findSelect(Integer id);	//��ѯָ������û���ѡ�γ�
	public List<Object[]> findSelected(Integer id);	//��ѯָ������û��Ѿ�ѡ���Ŀγ�
	public void insert(StuUser user);				//�������û�
	public void insertSC(String[] courseIds,Integer stuId);	//���û������γ̱�Ź�������
}
