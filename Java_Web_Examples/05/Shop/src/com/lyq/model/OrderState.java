package com.lyq.model;

import java.util.ArrayList;
import java.util.List;

/**
 * ����״̬
 * @author Li Yongqiang
 */
public enum OrderState {
	DELIVERED {
		@Override
		public String getName() {
			return "�ѷ���";
		}
	},
	FINISH{
		@Override
		public String getName() {
			return "�������";
		}
	},
	CANCLE{
		@Override
		public String getName() {
			return "��ȡ��";
		}
	};
	public abstract String getName();
	public static List<String> getValues(){
		List<String> list = new ArrayList<String>();
		for (OrderState orderState : OrderState.values()) {
			list.add(orderState.getName());
		}
		return list;
	}
}
