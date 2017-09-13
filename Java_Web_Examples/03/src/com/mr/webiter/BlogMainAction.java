package com.mr.webiter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.mr.dao.ObjectDao;
import com.mr.model.ArticleInfo;
import com.mr.model.UserInfo;
import com.opensymphony.xwork2.ActionSupport;
/**
 * ִ����ҳ��������
 * @author CHUNBIN
 *
 */
public class BlogMainAction extends ActionSupport implements
ServletRequestAware {
	protected HttpServletRequest request;
	private ObjectDao<UserInfo> userDao = new ObjectDao<UserInfo>();
	private ObjectDao<ArticleInfo> articleDao = new ObjectDao<ArticleInfo>();
	private String hql_user_commend = null;
	private String hql_user_vistor = null;
	private String hql_article_commend = null;
	private String hql_article_vistor = null;

	public BlogMainAction() {
		hql_user_commend = "from UserInfo where commend='��' and freeze='�ⶳ'";
		hql_user_vistor = "from UserInfo where freeze='�ⶳ' order by vistor desc";
		hql_article_commend = "from ArticleInfo where commend='��' and author in (select account from UserInfo where freeze='�ⶳ')";
		hql_article_vistor = "from ArticleInfo where author in (select account from UserInfo where freeze='�ⶳ') order by visit desc";
	}

	public String BlogMain() {
		// �������жϲ����Ƽ�
		List<UserInfo> userCommned = userDao.queryList(hql_user_commend);
		if (userCommned.size() > 5) {
			userCommned = userCommned.subList(0, 5);
		}
		request.setAttribute("userCommned", userCommned);
		// ���������Ų���
		List<UserInfo> userVistor = userDao.queryList(hql_user_vistor);
		if (userVistor.size() > 5) {
			userVistor = userVistor.subList(0, 5);
		}
		request.setAttribute("userVistor", userVistor);
		// �������Ƽ�����
		List<ArticleInfo> articleCommend = articleDao
				.queryListObject(hql_article_commend);
		if (articleCommend.size() > 5) {
			articleCommend = articleCommend.subList(0, 5);
		}
		request.setAttribute("articleCommend", articleCommend);
		// ��������������
		List<ArticleInfo> articleVistor = articleDao
				.queryListObject(hql_article_vistor);
		if (articleVistor.size() > 5) {
			articleVistor = articleVistor.subList(0, 5);
		}
		request.setAttribute("articleVistor", articleVistor);
		return "blogMain";
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}
}
