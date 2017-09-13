package com.hiernate.util;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.hiernate.persistence.*;
//hibernate�����࣬�����ݿ⽻����
public class HibernateUtil {
   static Session session;
   static GetHibernate hib = new GetHibernate();  //����
	
// �����û���������Ѱ���û�
	public static List findUser(String strUserName, String strPwd) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                    //���ù�����Ŀ���session������
			tx = (Transaction) session.beginTransaction();  //��������
			Query query = session.createQuery("from User as u where u.userName=:strUserName and u.pwd=:strPwd");  //Ӧ��HQL�����������������ļ���
			query.setString("strUserName", strUserName);     //��̬�󶨲���
			query.setString("strPwd", strPwd);
			list = query.list();                             //list��������ִ��HQL���
			tx.commit();                                     //������ύ
			hib.closeSession(session);                       //�ر�session
		} catch (Exception e) {
			e.printStackTrace();							//����쳣��Ϣ
			tx.rollback();                                    //����Ļع�
		}
		return list;
	}
//	 ��������û�����ҳ
	public static List findUser(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from User");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	����Ա�����ܼ�¼��
	public static int findUserCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			String count = (session.createQuery("select count(*)from User").uniqueResult()).toString();
			intCount = Integer.parseInt(count);
			tx.commit();
			hib.closeSession(session);
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	�޸��û���Ϣ
	public static void updateUser(User user) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(user);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	ɾ���û�
	public static void deleUser(User user) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(user);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
  }
//	 �����û�id����
	public static List findUserId(int intId) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session
					.createQuery("from User as u where u.id =:intMedeId");
			query.setInteger("intMedeId", intId);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	 �����Ų����û�
	public static List findUser(String strBranch,int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session
					.createQuery("from User as u where u.branch=:strBranch");
			query.setString("strBranch", strBranch);
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
		    e.printStackTrace();
		    tx.rollback(); 
		}
		return list;
	}
//	�����Ų���Ա�����ܼ�¼��
	public static int findUserCount(String branch) {
	   Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt( (session.createQuery("select count(*)from User u  where u.branch ="+"'"+branch+"'").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	��������Ա��
	public static List findU() {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session
					.createQuery("from User as u where u.bestMan =1");
		
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
   // ���Ҳ˵�
	public static List findMenu(int intMendId) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                   //���ù����࿪��session
			tx = (Transaction) session.beginTransaction(); //��������
			Query query = session
					.createQuery("from Menu as m where m.modeId =:intMedeId");
			query.setInteger("intMedeId", intMendId);      //�󶨲�ѯ����
			list = query.list();
			tx.commit();
			hib.closeSession(session);                     //���ù�����ر�session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
           return list;
	}
   
 // ��������¼,����ҳ
	public static List finMeeting(int intFrint,int intpages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                        //��session
			tx = (Transaction) session.beginTransaction();      //��������
			Query query = session.createQuery("from Meeting");  //����Query����
			query.setFirstResult(intFrint);                     //����Query�ķ�ҳ����
			query.setMaxResults(intpages);
			list = query.list();                                //��ѯ�������list����    
			tx.commit();                                        //�ύ����   
			hib.closeSession(session);                          //�ر�session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
		}
//	���һ�����ܼ�¼��
	public static int findMeetingCount() {
		Transaction tx = null;                            //��������
		int intCount=0;                                   //����int�ͱ���
		try {
			Session session = hib.openSession();                  //���ù������session
			tx = (Transaction) session.beginTransaction();//��������
			intCount = Integer.parseInt((session.createQuery("select count(*)from Meeting").uniqueResult()).toString());
			                                               //����ڲ�ȷ����ѯ������͵�ʱ�򣬿���uniqueResult()����������Object
			tx.commit();                                   //�ύ����
			hib.closeSession(session);                     //�ر�session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();                                 //��������
		}
		return intCount;
	}
//	 ������ϻ���id����
	public static List findMeetingid(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();                               //���ù������session
			tx = (Transaction) session.beginTransaction();             //��������
			Query query = session.createQuery("from Meeting as m where m.id =:intid");   //��id�ż�������
			query.setInteger("intid",intid);                           //��̬�󶨲���
			list = query.list();                                       //ִ��HQL���
			tx.commit();                                               //�ύ����
			hib.closeSession(session);                                 //�ر�session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); }

		return list;
	}
//	 ������ϻ���ļ�¼
	public static void saveMeeting(Meeting meeting) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(meeting);        //����ʱ����ת��Ϊ�־û�����
			tx.commit(); 
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 ������ϻ���ļ�¼
	public static void deleMeeting(Meeting meeting) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();                       //���ù����෽����session
			tx = (Transaction) session.beginTransaction();     //��������
			session.delete(meeting);                           //����delete����ɾ���������
			tx.commit();                                       //�ύ����
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 ���������Ϣ�ļ�¼
	public static List finplacard(int intFrist,int intpages) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Placard");   //���ҹ�����Ϣ
			query.setFirstResult(intFrist);
			query.setMaxResults(intpages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	���ҹ�����ܼ�¼��
	public static int findPlacardCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Placard").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	 ����¹����¼
	public static void savePlacard(Placard placard) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(placard);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		
	}
//	 �޸Ĺ����¼
	public static void updatePlacard(Placard placard) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(placard);                //����session��update�������³־û�����
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 ɾ�������¼
	public static void delePlacard(Placard placard) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(placard);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		
	}
	//����id���ҹ�����Ϣ
	public static List finplacardId(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Placard as p where p.id=:intid"); //����Query����
			query.setInteger("intid",intid);                //��̬�󶨲�����
			list = query.list();                            //����list����ִ�в�ѯ��䣬�÷�������List����
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
  //���������Ϣ
	public static List finWaichu(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Waichu");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();			
			hib.closeSession(session);			
		} catch (Exception e) {		
			tx.rollback(); 
		}
		return list;
	}
//	����������Ǽǵ��ܼ�¼��
	public static int findWaichuCount() {
		Transaction tx = null;
		int intCount=0;
		
		    Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			try {
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Waichu").uniqueResult()).toString());
			tx.commit();				
			hib.closeSession(session);				
		} catch (Exception e) {			
			System.out.println("sssssssssssss "+(tx == null));
			tx.rollback(); 
		}
		return intCount;
	}
 //	����id���������ϸ��Ϣ
	public static List finwaichuId(int intid) {
		Transaction tx = null;
		List list = null;
	
		Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			try {
			Query query = session.createQuery("from Waichu as w where w.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}

//	 ���������¼
	public static void saveWaichu(Waichu waichu) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();                     //���ù����෽����session
			tx = (Transaction) session.beginTransaction();   //��������
			session.save(waichu);                            //�����������г־û�����
			tx.commit();                                     //������ύ
			hib.closeSession(session);                       //�ر�session
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
//	 ɾ�������¼
	public static void updateChuchai(Chuchai chuchai) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(chuchai);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		
	}
//	��������¼
	public static void saveChuchai(Chuchai chuchai) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(chuchai);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}
 //���������Ϣ
	public static List findQingjia(int recPerPage,int  pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qingjia");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
		return list;
	}
//	������ٵ��ܼ�¼��
	public static int findQingjiaCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Qingjia").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
		return intCount;
	}
//	 �޸������Ϣ
	public static void updateQingjia(Qingjia qingia) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(qingia);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
	}
//	 �޸������Ϣ
	public static void saveQingjia(Qingjia qingia) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(qingia);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {			
			tx.rollback(); 
		}
	}
//	 �޸������Ϣ
	public static void updateWaichu(Waichu waichu) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(waichu);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
	}

 //����id�Ų��������Ϣ
	public static List findQingjia(int intid) {
	    Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qingjia as q where q.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	���������Ϣ
	public static List findchuchai(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Chuchai");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	���ҳ�����Ϣ���ܼ�¼��
	public static int findChuchaiCount() {
	    Transaction tx = null;
		int intCount=0;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Chuchai").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	����id�Ų��ҳ�����Ϣ
	public static List findchuchai(int intid) {
	    Transaction tx = null;
		List list = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Chuchai as c where c.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	�������°�Ǽ���Ϣ
	public static List findOnduty(int recPerPage,int pages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Onduty");
			query.setFirstResult(recPerPage);
			query.setMaxResults(pages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return list;
	}
//	�������°�Ǽ���Ϣ���ܼ�¼��
	public static int findOndutyCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Onduty").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); 
		}
		return intCount;
	}
//	������°�Ǽ���Ϣ
	public static void saveOnduty(Onduty onduty) {
	  Transaction tx = null;
	 try {  
		 	Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
		    session.save(onduty);
		    tx.commit();
		    hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	����id�Ų��ҳ�����Ϣ
	public static List findonduty(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Onduty as o where o.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//������ҵ�ƻ���Ϣ
	public static List findqiye(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qiye");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	�������°�Ǽ���Ϣ���ܼ�¼��
	public static int findQiyeCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Qiye").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	������ҵ�ƻ����id����
	public static List findqiye(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Qiye as q where q.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	ɾ����ҵ�ƻ����id����
	public static void deleqiye(Qiye qiye) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(qiye);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	������ҵ�ƻ����
	public static void saveqiye(Qiye qiye) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(qiye);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	���Ҳ��żƻ���Ϣ
	public static List findbm(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Bm");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	���Ҳ��żƻ����ܼ�¼��
	public static int findBmCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt( (session.createQuery("select count(*)from Bm").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	���Ҳ���id���ϡ�
	public static List findbmid(int intid) {
	    Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Bm as b where b.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
 //���Ӳ��żƻ����
	public static void savebm(Bm bm) {
		Transaction tx = null;
	try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(bm);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	ɾ����ҵ�ƻ����id����
	public static void deleBm(Bm bm) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(bm);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		}
//	���Ҹ��˼ƻ���Ϣ
	public static List findperson(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Person");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	���Ҹ��˼ƻ����ܼ�¼��
	public static int findPersonCount() {
	    Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt((session.createQuery("select count(*)from Person").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	���Ҹ���id���ϡ�
	public static List findPerson(int intid) {
        Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Person as p where p.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
	 //���Ӹ��˼ƻ����
	public static void saveperson(Person person) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(person);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		
	}
//	ɾ�����˼ƻ����id����
	public static void delePerson(Person person) {
		Transaction tx = null;
	 try {
		 	Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(person);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		}
	 //�������û�
	public static void saveUser(User user) {
	   Transaction tx = null;
	  try {
		  Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(user);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	 //������˱����Ϣ
	public static List findshenhe(int intFrist,int intPages) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Shenhe");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	����������ܼ�¼��
	public static int findShenheCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Shenhe").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
 //�������id���ϡ�
	public static List findShenheId(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Shenhe as s where s.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	�������id���ϡ�
	public static void updateshenhe(Shenhe shehe) {
		Transaction tx = null;
	 try {
		 Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.saveOrUpdate(shehe);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	//	������˱��¼
	public static void saveshenhe(Shenhe shenhe) {
		Transaction tx = null;
	 try {
		 Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(shenhe);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	ɾ����˱��¼
	public static void deleshenhe(Shenhe shenhe) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(shenhe);
	        tx.commit();
	        hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	 
//	����ͨѶ������Ϣ
	public static List findTongxuns() {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			String strsql="from TongXunAdd";
			Query query = session.createQuery(strsql);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	����ͨѶ��Ϣ�����ܼ�¼��
	public static int findTongXunCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt((session.createQuery("select count(*)from TongXunAdd").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	�����û����Ƿ���á�
	public static List findTonName(String name) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from TongXunAdd  as txa where txa.name11=:name");
			query.setString("name", name);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	����id����ͨѶ������Ϣ��
	public static List findTonId(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from TongXunAdd  as txa where txa.id=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			
			tx.rollback();
		}
		return list;
	}
//����ͨѶ��Ϣ��
	public static void saveTongxun(TongXunAdd txa) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(txa);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	����ͨѶ��Ϣ��
	public static void updateTongxun(TongXunAdd txa) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(txa);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	ɾ��ͨѶ��Ϣ��
	public static void deleteTongxun(TongXunAdd txa) {
	   Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(txa);
			tx.commit();
			hib.closeSession(session);;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	����ͨѶ��ʾ��Ϣ��
	public static List findTongxun(int intname1) {
		Transaction tx = null;
		List list = null;
		try { 
			Session session = hib.openSession();                      //��session
			tx = (Transaction) session.beginTransaction();    //��������
			String strsql="select count(*) from TongXunAdd t,Tongxun T where T.id = t.name1 group by t.name1 having t.name1=:intname1";
			Query query = session.createQuery(strsql);
			query.setInteger("intname1",intname1);             //�󶨲���
			list = query.list();                               //list����ִ�в�ѯ���
			tx.commit();                                       //�ύ����
			hib.closeSession(session);;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	���ͨѶ�򵥱���Ϣ
	public static void saveTx(Tongxun tongxun) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.save(tongxun);
			tx.commit();
			hib.closeSession(session);;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
	//	����ͨѶ���ͷ�������ҳ
	public static List findT(int intFrist,int intPages) {
	    Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Tongxun");
			query.setFirstResult(intFrist);
			query.setMaxResults(intPages);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	����ͨѶ���ͷ�������ҳ
	public static List findT() {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();                       //���ù����෽����session����
			tx = (Transaction) session.beginTransaction();     //��������
			Query query = session.createQuery("from Tongxun"); //��ѯͨѶ�������м�¼
			list = query.list();                               //list����ִ��HQL���
			tx.commit();                                       //������ύ
			hib.closeSession(session);                         //���ù������еĹر�session����
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
//	����ͨѶ�����ܼ�¼��
	public static int findTCount() {
		Transaction tx = null;
		int intCount=0;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			intCount = Integer.parseInt(( session.createQuery("select count(*)from Tongxun").uniqueResult()).toString());
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return intCount;
	}
//	����ͨѶ���ͷ���
	public static List findT(int intId) {
		Transaction tx = null;
		List list = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from Tongxun t where t.id=:intId");
			query.setInteger("intId", intId);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}

//	�޸ļ򵥱���Ϣ
	public static void updateTx(Tongxun tongxun) {
		Transaction tx = null;
		try {
			Session	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.update(tongxun);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	ɾ���򵥱���Ϣ
	public static void deleTx(Tongxun tongxun) {
		Transaction tx = null;
		try {
			Session session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			session.delete(tongxun);
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}
//	����ͨѶ��ʾ��Ϣ��
	public static List findTX(int intid) {
		Transaction tx = null;
		List list = null;
		try {
			Session 	session = hib.openSession();
			tx = (Transaction) session.beginTransaction();
			Query query = session.createQuery("from TongXunAdd as txa where txa.name1=:intid");
			query.setInteger("intid",intid);
			list = query.list();
			tx.commit();
			hib.closeSession(session);
		} catch (Exception e) {  
			e.printStackTrace();
			tx.rollback();
		}
		return list;
	}
	
	}
    

