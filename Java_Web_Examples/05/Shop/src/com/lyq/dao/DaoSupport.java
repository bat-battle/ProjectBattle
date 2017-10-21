package com.lyq.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyq.model.PageModel;
import com.lyq.util.GenericsUtils;
/**
 * Dao֧����
 * @author Li Yongqiang
 * @param <T>
 */
@Transactional
@SuppressWarnings("unchecked")
public class DaoSupport<T> implements BaseDao<T>{
	// ���͵�����
	protected Class<T> entityClass = GenericsUtils.getGenericType(this.getClass());
	// Hibernateģ��
	@Autowired
	protected HibernateTemplate template;
	
	public HibernateTemplate getTemplate() {
		return template;
	}
	@Override
	public void delete(Serializable ... ids) {
		for (Serializable id : ids) {
			T t = (T) getTemplate().load(this.entityClass, id);
			getTemplate().delete(t);
		}
	}
	/**
	 * ����get()�������ض��󣬻�ȡ�������ϸ��Ϣ
	 */
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public T get(Serializable entityId) {
		return (T) getTemplate().get(this.entityClass, entityId);
	}
	/**
	 * ����load()�������ض��󣬻�ȡ�������ϸ��Ϣ
	 */
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public T load(Serializable entityId) {
		return (T) getTemplate().load(this.entityClass, entityId);
	}
	/**
	 * ����hql�����ҵ�����Ϣ
	 */
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Object uniqueResult(final String hql,final Object[] queryParams) {
		return getTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery(hql);//ִ�в�ѯ
				setQueryParams(query, queryParams);//���ò�ѯ����
				return query.uniqueResult();
			}
		});
	}
	/**
	 * ��ȡָ���������Ϣ����
	 */
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public long getCount() {
		String hql = "select count(*) from " + GenericsUtils.getGenericName(this.entityClass);
		return (Long)uniqueResult(hql,null);
	}
	/**
	 * ����save()��������������ϸ��Ϣ
	 */
	@Override
	public void save(Object obj) {
		getTemplate().save(obj);
	}
	@Override
	public void saveOrUpdate(Object obj) {
		getTemplate().saveOrUpdate(obj);
	}
	/**
	 * ����update()�����޸Ķ������ϸ��Ϣ
	 */
	@Override
	public void update(Object obj) {
		getTemplate().update(obj);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(final int pageNo, int maxResult) {
		return find(null, null, null, pageNo, maxResult);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(int pageNo, int maxResult,
			Map<String, String> orderby) {
		return find(null, null, orderby, pageNo, maxResult);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(int pageNo, int maxResult, String where,
			Object[] queryParams) {
		return find(where, queryParams, null, pageNo, maxResult);
	}
	/**
	 * ��ҳ��ѯ
	 * @param where ��ѯ����
	 * @param queryParams hql����ֵ
	 * @param orderby ����
	 * @param pageNo �ڼ�ҳ
	 * @param maxResult ���ؼ�¼����
	 * return PageModel
	 */
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PageModel<T> find(final String where, final Object[] queryParams,
			final Map<String, String> orderby, final int pageNo,
			final int maxResult) {
		final PageModel<T> pageModel = new PageModel<T>();//ʵ������ҳ����
		pageModel.setPageNo(pageNo);//���õ�ǰҳ��
		pageModel.setPageSize(maxResult);//����ÿҳ��ʾ��¼��
		getTemplate().execute(new HibernateCallback() {//ִ���ڲ�����
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = new StringBuffer().append("from ")//���form�ֶ�
								.append(GenericsUtils.getGenericName(entityClass))//��Ӷ�������
								.append(" ")//��ӿո�
								.append(where == null ? "" : where)//���whereΪnull����ӿո�,��֮���where
								.append(createOrderBy(orderby))//���������������
								.toString();//ת��Ϊ�ַ���
				Query query = session.createQuery(hql);//ִ�в�ѯ
				setQueryParams(query,queryParams);//Ϊ������ֵ
				List<T> list = null;//����List����
				// ���maxResult<0�����ѯ����
				if(maxResult < 0 && pageNo < 0){
					list = query.list();//����ѯ���ת��ΪList����
				}else{
					list = query.setFirstResult(getFirstResult(pageNo, maxResult))//���÷�ҳ��ʼλ��
								.setMaxResults(maxResult)//����ÿҳ��ʾ�ļ�¼��
								.list();//����ѯ���ת��ΪList����
					//�����ѯ�ܼ�¼����hql���
					hql = new StringBuffer().append("select count(*) from ")//���hql���
									.append(GenericsUtils.getGenericName(entityClass))//��Ӷ�������
									.append(" ")//��ӿո�
									.append(where == null ? "" : where)//���whereΪnull����ӿո�,��֮���where
									.toString();//ת��Ϊ�ַ���
					query = session.createQuery(hql);//ִ�в�ѯ
					setQueryParams(query,queryParams);//����hql����
					int totalRecords = ((Long) query.uniqueResult()).intValue();//����ת��
					pageModel.setTotalRecords(totalRecords);//�����ܼ�¼��
				}
				pageModel.setList(list);//����ѯ��list�������ʵ�������
				return null;
			}
		});
		return pageModel;//���ط�ҳ��ʵ�����
	}
	/**
	 * ��ȡ��ҳ��ѯ�н��������ʼλ��
	 * @param pageNo �ڼ�ҳ
	 * @param maxResult ҳ����ʾ�ļ�¼��
	 * @return ��ʼλ��
	 */
	protected int getFirstResult(int pageNo,int maxResult){
		int firstResult = (pageNo-1) * maxResult;
		return firstResult < 0 ? 0 : firstResult;
	}
	/**
	 * ��query�еĲ�����ֵ
	 * @param query
	 * @param queryParams
	 */
	protected void setQueryParams(Query query, Object[] queryParams){
		if(queryParams!=null && queryParams.length>0){
			for(int i=0; i<queryParams.length; i++){
				query.setParameter(i, queryParams[i]);
			}
		}
	}
	/**
	 * ��������hql���
	 * @param orderby
	 * @return �����ַ���
	 */
	protected String createOrderBy(Map<String, String> orderby){
		StringBuffer sb = new StringBuffer("");
		if(orderby != null && orderby.size() > 0){
			sb.append(" order by ");
			for(String key : orderby.keySet()){
				sb.append(key).append(" ").append(orderby.get(key)).append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
		}
		return sb.toString();
	}
	/**
	 * ��ȡSession����
	 * @return
	 */
	protected Session getSession(){
		return (!this.template.isAllowCreate() ?
		    SessionFactoryUtils.getSession(this.template.getSessionFactory(), false) :
				SessionFactoryUtils.getSession(
						this.template.getSessionFactory(),
						this.template.getEntityInterceptor(),
						this.template.getJdbcExceptionTranslator()));
	}
}
