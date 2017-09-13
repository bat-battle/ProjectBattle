package com.lyq.model;

import java.util.ArrayList;
import java.util.List;

/**
 * �Ա�ö����
 * @author Li Yongqiang
 */
public enum Sex {
	BOY{
		@Override
		public String getName() {
			return "��";
		}
	},
	GIRL{
		@Override
		public String getName() {
			return "Ů";
		}
	},
	ALL{
		@Override
		public String getName() {
			return "����";
		}
	};
	/**
	 * ��ȡ���Ƶĳ��󷽷�
	 * @return ����
	 */
	public abstract String getName();
	public static List<String> getValues(){
		List<String> list = new ArrayList<String>();
		for (Sex sex : Sex.values()) {
			list.add(sex.getName());
		}
		return list;
	}
}
