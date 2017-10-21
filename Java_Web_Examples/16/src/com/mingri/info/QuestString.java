package com.mingri.info;

import com.mingri.dbconn.DBResult;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QuestString {

	  private int curPage;           //��ǰҳ��
	  private int maxPage;          //���ҳ��
	  private int maxRowCount;     //�ܼ�¼��(�������ݿ��в�������м�¼)
	  private int pageSize=2;        //ÿҳҪ��ʾ�ļ�¼��
	  private DBResult db;         //��¼������
	  private String httpFile;        //��ǰ��ַ�����ļ����������JSP�ļ�
	  private String cif;            //ѡ��Ĳ�ѯ�ֶ�
	  private String ccif;           //ѡ��Ĳ�ѯ�����
	  private String qvalue;         //��ѯ�ؼ���
	  private String countSql=null;      //�����洢select count (*) �������
	  private String topSql=null;        //�����洢 select top 2�������
	  private String nowPage=null;      //��ʼ����ǰҳcurPage����������ȡ��ǰҳ�ľ���ҳ��
	  private String str_parameter;      //������ҳʱ�����ݳ�pages�������������
	  private String andor;            //��ѯ����/������
	  private String sdate;            //��ѯ��ʼʱ�䣬����ʲô���ڿ�ʼ��ѯ
	  private String edate;            //��ѯ����ʱ�䣬����ʲô���ڽ���
	  private String orderby;          //��������������ʲô����
	  private String paixu;            //���򷽷������������
	  public QuestString(){           //���췽������������dbΪһ��DBResult()����
		pageSize = 2;
		countSql = null;
		topSql = null;
		nowPage = null;
		db = new DBResult();
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int i) {
		curPage = i;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int i) {
		maxPage = i;
	}

	public int getMaxRowCount() {
		return maxRowCount;
	}

	public void setMaxRowCount(int i) {
		maxRowCount = i;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int i) {
		pageSize = i;
	}

	public String getHttpFile() {
		return httpFile;
	}

	public void setHttpFile(String s) {
		httpFile = s;
	}

	public String getCcif() {
		return ccif;
	}

	public void setCcif(String s) {
		ccif = s;
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String s) {
		cif = s;
	}

	public String getQValue() {
		return qvalue;
	}

	public void setQValue(String s) {
		qvalue = s;
	}

	public String getStr_parameter() {
		return str_parameter;
	}

	public void setStr_parameter(String s) {
		str_parameter = s;
	}

	public String getAndor() {
		return andor;
	}

	public void setAndor(String s) {
		andor = s;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String s) {
		sdate = s;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String s) {
		edate = s;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String s) {
		orderby = s;
	}

	public String getPaixu() {
		return paixu;
	}

	public void setPaixu(String s) {
		paixu = s;
	}
	/**
	   * ͨ����������������Bean�е�����
	   */
	public void setQuerySql(String s, String s1, String s2) {
		nowPage = s1;		//�����ύ�����Ĳ���pages(�ڼ�ҳ)��ֵ���ݸ�����nowPage����
		httpFile = s;    	//������̬���ô���������JSP�ļ�
		countSql = s2; 		//��������ִ��select count(*)������SQL���
		try {
			querySql(countSql);//����querySql()��������������countSql���ݵ��÷�����
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}
	  /**
	   * ִ��SQL��䣬��÷�ҳ��ʾʱ�ĸ�������
	   */
	public void querySql(String s) throws SQLException {
		if (nowPage == null || "".equals(nowPage)) {
			curPage = 1;
		} else {
			curPage = Integer.parseInt(nowPage);
			if (curPage < 1)
				curPage = 1;
		}
		ResultSet resultset = db.getResult(s);
		if (resultset.next())
			maxRowCount = resultset.getInt(1);
		maxPage = maxRowCount % pageSize != 0 ? maxRowCount / pageSize + 1
				: maxRowCount / pageSize;
		if (curPage > maxPage)
			curPage = maxPage;
		resultset.close();
	}
	  /**
	   * һ���ַ�����������̬�ĸ���һ����
	   * �ñ��������з�ҳ��ͳ��ҳ������ת
	   */

	public String pageFooter() {
		//����һ����
		String s = "<form action=" + httpFile + " name=formBean methord=post>";
		int i = curPage - 1;//��ǰ��ҳ������ǰҳ��1
		int j = curPage + 1;//���ҳ������ǰҳ��1
		s = s + "<font style='font-size: 10pt'>�ܼ�<font color='red'>"
				+ getMaxRowCount() + "</font>����¼," + "����<font  color='red'>"
				+ getMaxPage() + "</font>ҳ��";
		s = s + "�� <font color='red'>" + pageSize
				+ "</font>��/ҳ�� ��ǰ��<font color='red'>" + getCurPage()
				+ "</font>ҳ &nbsp; ";
		if (curPage > 1)
			s = s + " <A href=" + httpFile + "?pages=1" + str_parameter
					+ ">��ҳ</A> ";
		else
			s = s + " ��ҳ ";
		if (curPage > 1)
			s = s + " <A href=" + httpFile + "?pages=" + i + str_parameter
					+ ">��һҳ</A> ";
		else
			s = s + " ��һҳ ";
		if (curPage < maxPage)
			s = s + " <A href=" + httpFile + "?pages=" + j + str_parameter
					+ ">��һҳ</A> ";
		else
			s = s + " ��һҳ ";
		if (maxPage > 1 && curPage != maxPage)
			s = s + " <A href=" + httpFile + "?pages=" + maxPage
					+ str_parameter + ">βҳ</A>";
		else
			s = s + " βҳ</font>";//��ҳ����ת���������ر��������治ͬ������
		s = s + "ת��<input type ='text' name='pages' size='2'>ҳ"
				+ "<input type='hidden' name='ccif' value='" + ccif
				+ "'><input type ='hidden' name='cif' value='" + cif
				+ "'><input type ='hidden' name='qvalue' value='" + qvalue
				+ "'><input type ='hidden' name='andor' value='" + andor
				+ "'><input type ='hidden' name='sdate' value='" + sdate
				+ "'><input type ='hidden' name='edate' value='" + edate
				+ "'><input type ='hidden' name='orderby' value='" + orderby
				+ "'><input type ='hidden' name='paixu' value='" + paixu
				+ "'><input type='submit' name='sumbmit' value='go'></form>";
		return s;
	}
	  /**
	   * ���ݲ�ͬ��������ȡ��ͬ�Ĳ�ѯǰN����¼��SQL���
	   */
	public String getString(String s) {
		if (ccif.equals("=")) {
			String s1 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + "=" + "'" + qvalue + "'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + " " + "like" + " " + "'%" + qvalue
					+ "%'";
			return s2;
		}
		if (ccif.equals("ALL")) {
			String s3 = "select top " + pageSize * curPage + " * from " + s;
			return s3;
		}
		if (ccif.equals("<")) {
			String s4 = "select top " + pageSize * curPage + " * from " + s
					+ " where " + cif + " < '" + qvalue + "'";
			return s4;
		} else {
			return null;
		}
	}
	public String getXSString(String s) {
		if (ccif.equals("=")) {
			String s1 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + "=" + "'" + qvalue
					+ "' and whether='��'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select top " + pageSize * curPage + " * from " + s
					+ " where" + " " + cif + " " + "like" + " " + "'%" + qvalue
					+ "%'and whether='��'";
			return s2;
		} else {
			return null;
		}
	}
	 /**
	  * ���ݲ�ͬ��������ò�ͬ�ļ����¼������SQL���
	  */
	public String getCount(String s) {
		if (ccif.equals("=")) {
			String s1 = "select count(*) from " + s + " where" + " " + cif
					+ "=" + "'" + qvalue + "'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select count(*) from " + s + " where" + " " + cif
					+ " " + "like" + " " + "'%" + qvalue + "%'";
			return s2;
		}
		if (ccif.equals("ALL")) {
			String s3 = "select count(*) from " + s;
			return s3;
		}
		if (ccif.equals("<")) {
			String s4 = "select count(*) from " + s + " where " + cif + " < '"
					+ qvalue + "'";
			return s4;
		} else {
			return null;
		}
	}

	public String getXSCount(String s) {
		if (ccif.equals("=")) {
			String s1 = "select count(*) from " + s + " where" + " " + cif
					+ "=" + "'" + qvalue + "' and whether='��'";
			return s1;
		}
		if (ccif.equals("LIKE")) {
			String s2 = "select count(*) from " + s + " where" + " " + cif
					+ " " + "like" + " " + "'%" + qvalue + "%' and whether='��'";
			return s2;
		} else {
			return null;
		}
	}

	/**
	 * ���ݲ�ͬ�����Ͳ�ͬ����ʼ���ںͽ�����������ò�ͬ�ļ����¼������SQL���
	 */
	public String getDateCount(String s, String s1) {
		if (ccif.equals("=")) {		//��sdate��edateʱ����н��о�ȷ��ѯ
			String s2 = "select count(*) from " + s + " where " + cif + " = '"
					+ qvalue + "'" + andor + " " + s1 + " between '" + sdate
					+ "' and '" + edate + "'";
			return s2;
		}
		if (ccif.equals("LIKE")) {//��sdate��edateʱ����н���ģ����ѯ
			String s3 = "select count(*) from " + s + " where " + cif
					+ " like '%" + qvalue + "%'" + andor + " " + s1
					+ " between '" + sdate + "' and '" + edate + "'";
			return s3;
		}
		if (ccif.equals("ALL")) {//ȡ���������м�¼
			String s4 = "select count(*) from " + s;
			return s4;
		} else {
			return null;
		}
	}

	/**
	 * ���ݲ�ͬ�����Ͳ�ͬ����ʼ���ںͽ�����������ò�ͬ�Ĳ�ѯ��ǰN����SQL���
	 */
	public String getDateString(String s, String s1) {
		if (ccif.equals("=")) {
			String s2 = "select top " + pageSize * curPage + " * from " + s
					+ " where " + cif + " = '" + qvalue + "'" + andor + " "
					+ s1 + " between '" + sdate + "' and '" + edate + "'";
			return s2;
		}
		if (ccif.equals("LIKE")) {
			String s3 = "select top " + pageSize * curPage + " * from " + s
					+ " where " + cif + " like '%" + qvalue + "%'" + andor
					+ " " + s1 + " between '" + sdate + "' and '" + edate + "'";
			return s3;
		}
		if (ccif.equals("ALL")) {
			String s4 = "select top " + pageSize * curPage + " * from " + s;
			return s4;
		} else {
			return null;
		}
	}

	/**
	 * �Ӳ�ѯ�еõ�����ʼ���ڵ������������ʱ�����в��ظ���spid(��Ʒid)�������ز��ظ���spid������
	 */

	public String getOrderCount(String s, String s1) {
		String s2 = "select count(*) from (select spid from " + s + " where "
				+ s1 + " between '" + sdate + "' and '" + edate
				+ "' group by spid) as aa";
		return s2;
	}

	/**
	 * ���ϲ�ѯ��ѯ��ĳһ���д���ʼ���������ڼ����в��ظ���spid(��Ʒid)
	 * ���ҽ�������ͬspid�µ�sl(����)��je(���)��ͣ��������ĳһ��Ʒ�� ĳһʱ����ڵ������������������ܶ�
	 * ���ͨ�����ϲ�ѯ��tb_brand��(��Ʒ��Ϣ��)�н���spid����Ӧ��Ʒ������һЩ��Ϣ��ѯ����
	 */

	public String getOrderString(String s, String s1) {
		String s2 = "select top "
				+ pageSize
				* curPage
				+ "* from tb_brand a inner join (select spid,sum(sl) as sl,sum(je) as je"
				+ " from " + s + " where " + s1 + " between '" + sdate
				+ "' and '" + edate + "' group by spid ) as b"
				+ " on a.id=b.spid order by " + orderby + " " + paixu;
		return s2;
	}
}
