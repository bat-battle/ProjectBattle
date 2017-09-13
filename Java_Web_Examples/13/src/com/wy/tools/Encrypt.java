package com.wy.tools;

import java.security.*;
import java.text.DateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Encrypt {

	// �÷������������MD5�ļ��ܣ��������Ϊ��̬����������ͨ����������ֱ�ӷ���
	public static String encode(String str) {
		if (str == null) // ������strΪ�գ�ֱ��ͨ��return�ؼ��ֽ��з���
			return null;
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest code = MessageDigest.getInstance("MD5");
			code.update(str.getBytes());
			byte[] bs = code.digest();
			for (int i = 0; i < bs.length; i++) {
				int v = bs[i] & 0xFF;
				if (v < 16)
					sb.append(0);
				sb.append(Integer.toHexString(v));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString().toUpperCase();
	}

	// �÷������ص�ϵͳ��ʱ�䣬Ҳ�Ǿ�̬����
	public static String currentlyTime() {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
		return dateFormat.format(date);
	}
	// �÷������������ݽ���ת�룬Ҳ�Ǿ�̬����
	public static String toChinese(String strvalue) {
		try {
			if (strvalue == null) {
				return "";
			} else {
				strvalue = new String(strvalue.getBytes("ISO8859_1"), "GBK");
				return strvalue;
			}
		} catch (Exception e) {
			return "";
		}

	}

}
