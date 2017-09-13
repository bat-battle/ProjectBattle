package test;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate��ʼ���࣬���ڻ�ȡSession��SessionFactory ���ر�Session
 * @author Li Yong Qiang
 */
public class HibernateUtil {
	// SessionFactory����
	private static SessionFactory factory = null;
	// ��̬��
	static {
		try {
			
			// ����Hibernate�����ļ�
			Configuration cfg = new Configuration().configure();
			// ʵ����SessionFactory
			factory = cfg.buildSessionFactory();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
	/**
	 * ��ȡSession����
	 * @return Session����
	 */
	public static Session getSession() {
		//���SessionFacroty��Ϊ�գ�����Session
		Session	session = (factory != null) ? factory.openSession() : null;
		return session;
	}
	/**
	 * ��ȡSessionFactory����
	 * @return SessionFactory����
	 */
	public static SessionFactory getSessionFactory() {
		return factory;
	}
	/**
	 * �ر�Session
	 * @param session����
	 */
	public static void closeSession(Session session) {
		if (session != null) {
			if (session.isOpen()) {
				session.close(); // �ر�Session
			}
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getSessionFactory());
	}
}
