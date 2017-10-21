package com.jwy.dao;

import java.util.List;

import com.jwy.dto.Specialty;

/**
 * 
 * @author Jingweiyu 
 */
public interface ISpecialtyDao {
	public void insert(Specialty specialty);	//������רҵ
	public void updateIsFinish(Integer id);		//��ָ�����רҵ����Ϊ�Ѿ���ҵ
	public Specialty findById(Integer id);		//��ָ����Ų���רҵ
	public List<Specialty> findByAll();			//��ѯ������רҵ
	public List<Specialty> findStuByAll();		//��ѯ������δ��ҵ��רҵ
}
