package com.mingri.showtime;

import java.util.*;

public class ShowTime {
	private Date date = null;
	private int yy; // ������Date����getYear()�������ص�������ֵ
	private int mm; // ������Date����getMonth()�������ص�������ֵ
	private int dd; // ������Date����getDate()�������ص�������ֵ
	private String sy;
	private String sm;
	private String sd;

	public ShowTime() {
		date = new Date();
		yy = date.getYear() + 1900; // ֻ�м���1900����ϵͳ��ǰ�����
		mm = date.getMonth() + 1; // ֻ�м���1����ϵͳ��ǰ���·�
		dd = date.getDate();
		sy = String.valueOf(yy); // ������yyת��Ϊ�ַ�������
		sm = String.valueOf(mm); // ������mmת��Ϊ�ַ�������
		sd = String.valueOf(dd); // ������ddת��Ϊ�ַ�������
		// ����·���1λ����ǰ�����"0"���������1�·���ô��ʾ�ľ���"01"
		if (sm.length() == 1) {
			sm = "0" + sm;
		}
		if (sd.length() == 1) {
			sd = "0" + sd;
		}
	}

	public String getDateString() {
		return sy + sm + sd;
	}

	public String getDate() {
		return sy + "-" + sm + "-" + sd;
	}
}
