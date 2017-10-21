package com.jwy.dao;

import com.jwy.dto.UserLogin;

/**
 * 
 * @author Jingweiyu 
 */
public interface IUserLoginDao {
	public UserLogin findbyNameAndPwd(String name,String pwd);		//���û�����������û�
	public boolean findByLoginName(String loginName);				//��֤�û����Ƿ��Ѿ�����
	public Integer  findByNPM(String name,String pwd,String mail);	//��֤�޸�������Ϣ
	public Integer insert(UserLogin user);							//���û�ע��
	public void updatePwd(Integer id,String pwd);					//�޸�����
	
}
