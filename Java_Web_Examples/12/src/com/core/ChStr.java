package com.core;

public class ChStr {


	// �����ַ����еĿ�ֵ
	public static final String nullToString(String v, String toV) {
	    if (v == null || "".equals(v)) {			//���������vΪ��ʱ
	        v = toV;						//���������v��ֵΪ�������toV
	    }
	    return v;							//����ת������������v
	}
	//����Σ���ַ�
	public static final String filterStr(String str){
		str=str.replaceAll(";","");
		str=str.replaceAll("&","&amp;");
		str=str.replaceAll("<","&lt;");
		str=str.replaceAll(">","&gt;");
		str=str.replaceAll("'","");
		str=str.replaceAll("--"," ");
		str=str.replaceAll("/","");
		str=str.replaceAll("%","");
		return str;
	}
}
