package com.lyq.util.hibernate;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;
/**
 * �Զ���Hibernateӳ������
 * @author Li Yongqiang
 * @param <T>
 */
public class EnumType<T extends Enum<T>> implements UserType {
	// ���ɵ����ݿ���������
	private static final int[] SQL_TYPES = { Types.VARCHAR };
	// Class
	private Class<T> clazz = null;
	// ���췽��
	public EnumType(Class<T> c) {
		this.clazz = c;
	}
	@Override
	public Object assemble(Serializable arg0, Object arg1)
			throws HibernateException {
		return arg0;
	}
	@Override
	public Object deepCopy(Object arg0) throws HibernateException {
		return arg0;
	}
	@Override
	public Serializable disassemble(Object arg0) throws HibernateException {
		return (Serializable) arg0;
	}
	@Override
	public boolean equals(Object arg0, Object arg1) throws HibernateException {
		if (arg0 == arg1)
			return true;
		if (null == arg0 || null == arg1)
			return true;
		return arg0.equals(arg1);
	}
	@Override
	public int hashCode(Object arg0) throws HibernateException {
		return arg0.hashCode();
	}
	@Override
	public boolean isMutable() {
		return false;
	}
	@Override
	public Object nullSafeGet(ResultSet rs, String[] names, Object owner)
			throws HibernateException, SQLException {
		try {
//			if (!rs.wasNull()) {
				// ��ȡ�ֶ�ֵ
				String name = rs.getString(names[0]).toUpperCase();
				// ���ֶ�ֵת����Ϊö��
				return Enum.valueOf(clazz, name);
//			}else{
//				System.out.println("----------------rs.wasNull()-------------------");
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public void nullSafeSet(PreparedStatement arg0, Object arg1, int arg2)
			throws HibernateException, SQLException {
		if (null == arg1) {
			arg0.setNull(arg2, Types.VARCHAR);
		} else {
			// ��ö��ת����Ϊ�ַ���
			arg0.setString(arg2, ((Enum) arg1).name());
		}
	}
	@Override
	public Object replace(Object arg0, Object arg1, Object arg2)
			throws HibernateException {
		return arg0;
	}
	@Override
	public Class<T> returnedClass() {
		return clazz;
	}
	@Override
	public int[] sqlTypes() {
		return SQL_TYPES;
	}
}
