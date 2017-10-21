package com.hrl.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * ����Գ��õ�JSON�������з�װ���Լ�ҵ�����
 * 
 * @author Administrator
 * 
 */
public class JSONKit {
	/**
	 * ��������Map����ת��ΪJSON��
	 * 
	 * @param map
	 *          Map����
	 * @return JSON�ַ���{"name1":"value1","name2":"value2"}
	 */
	public static String Map2JSONStr(Map map) {
		return JSONObject.fromObject(map).toString();
	}

	/**
	 * ��JSON��ת��ΪMap����
	 * 
	 * @param jsonStr
	 *          JSON�ַ���{"name1":"value1","name2":"value2"}
	 * @return Map����
	 */
	public static Map JSONStr2Map(String jsonStr) {
		return (Map) JSONObject.toBean(JSONObject.fromObject(jsonStr), Map.class);
	}

	public static List JSONStr2List(String jsonStr) {
		// JSONObject obj = JSONObject.fromObject(jsonStr);
		JSONArray jsonArray = JSONArray.fromObject(jsonStr);
		if (jsonArray != null && !jsonArray.isEmpty()) {
			List list = new ArrayList();
			for (int i = 0, len = jsonArray.size(); i < len; i++) {
				list.add(JSONObject.toBean(jsonArray.getJSONObject(i), Map.class));
			}
			return list;
		}
		return null;
	}

	public static List JSONStr2List(String jsonStr, String arrayName) {
		JSONObject obj = JSONObject.fromObject(jsonStr);
		JSONArray jsonArray = obj.getJSONArray(arrayName);
		if (jsonArray != null && !jsonArray.isEmpty()) {
			List list = new ArrayList();
			for (int i = 0, len = jsonArray.size(); i < len; i++) {
				list.add(JSONObject.toBean(jsonArray.getJSONObject(i), Map.class));
			}
			return list;
		}
		return null;
	}

	public static String[][] JSONStr2StringArray(String jsonStr) {
		Map map = JSONStr2Map(jsonStr);
		return null;
	}

	/**
	 * ��Ԫ��ΪMap��JavaBean��List����ת��Ϊ�ʺ�Ext֮Grid�ؼ�չʾ��JSON��
	 * 
	 * @param list
	 *          ���и�Ԫ��ΪMap��JavaBean��List����
	 * @param totalRowCount
	 *          ����Ҫ��ҳ��ͨ���˲���ע��������(����ע��0����)
	 * @return jsonStr JSON�ַ���{"rowCount":"2","rows":[
	 *         {"key1":"value1","key2":"value2"},{"key3":"value3","key4":"value4"} ]}
	 * @desc ���ע��null��յ�List����ʱ������{"rowCount":"0","rows":[]}
	 * @desc ���List�е�Ԫ�ز���Map��JavaBean�����򷵻�{"rowCount":"*","rows":[ ]}
	 *       ��Ҫ��֪Ext֮�ؼ�������(totalProperty: 'rowCount',root: 'rows')
	 */
	public static String List2JSONStr(List list, int totalRowCount) {
		if (list == null || list.isEmpty()) {
			return "{\"rowCount\":\"0\",\"rows\":[]}";
		}
		int len = list.size();
		StringBuffer strBuf = new StringBuffer("{\"rowCount\":\"");
		strBuf.append(totalRowCount != 0 ? totalRowCount : len).append("\",");
		strBuf.append("\"rows\":").append("[ ");
		Object obj = null;
		JSONObject jsonObj = null;
		for (int i = 0; i < len; i++) {
			obj = list.get(i);
			// if (!(obj instanceof Map)) continue;
			if (obj instanceof Map)
				jsonObj = JSONObject.fromObject(obj);
			else
				jsonObj = JSONObject.fromObject(Bean2Map(obj));
			strBuf.append(jsonObj.toString());
			strBuf.append(",");
		}
		strBuf.deleteCharAt(strBuf.length() - 1).append(" ]}");
		return strBuf.toString();
	}

	/**
	 * ��Ԫ��ΪMap��JavaBean��List����ת��Ϊ�ʺ�Ext֮Grid�ؼ�չʾ��JSON��
	 * 
	 * @param list
	 *          ���и�Ԫ��ΪMap��JavaBean��List����
	 * @param totalRowCount
	 *          ����Ҫ��ҳ��ͨ���˲���ע��������(����ע��0����)
	 * @return jsonStr JSON�ַ���[
	 *         {"key1":"value1","key2":"value2"},{"key3":"value3","key4":"value4"} ]
	 * @desc ���ע��null��յ�List����ʱ������{"rowCount":"0","rows":[]}
	 * @desc ���List�е�Ԫ�ز���Map��JavaBean�����򷵻�{"rowCount":"*","rows":[ ]}
	 *       ��Ҫ��֪Ext֮�ؼ�������(totalProperty: 'rowCount',root: 'rows')
	 */
	public static String List2JSONStrForGroupDef(List list) {
		if (list == null || list.isEmpty()) {
			return "[]";
		}
		int len = list.size();
		StringBuffer strBuf = new StringBuffer("[ ");
		Object obj = null;
		JSONObject jsonObj = null;
		for (int i = 0; i < len; i++) {
			obj = list.get(i);
			// if (!(obj instanceof Map)) continue;
			if (obj instanceof Map)
				jsonObj = JSONObject.fromObject(obj);
			else
				jsonObj = JSONObject.fromObject(Bean2Map(obj));
			strBuf.append(jsonObj.toString());
			strBuf.append(",");
		}
		strBuf.deleteCharAt(strBuf.length() - 1).append(" ]");
		return strBuf.toString();
	}

	public static Map Bean2Map(Object bean) {
		Map map = new HashMap();
		Method[] methods = bean.getClass().getMethods();
		String methodName = "", fieldName = "";
		Object fieldValue = null;
		for (int i = 0; i < methods.length; i++) {
			methodName = methods[i].getName();
			if (methodName.length() >= 4 && methodName.substring(0, 3).equals("get")) {
				fieldName = methodName.substring(3, 4).toLowerCase()
						+ methodName.substring(4);
				try {
					fieldValue = methods[i].invoke(bean, new Object[] {});
				} catch (Exception e) {
					// logger.error("Bean2Map error:"+e);
					fieldValue = null;
					continue;
				}
				if (fieldValue != null) {
					map.put(fieldName, fieldValue);
				}
			}
		}
		return map;
	}

	/**
	 * 
	 * <p>
	 * ��������:[������ת����json��ʽ�ַ���]
	 * </p>
	 * 
	 * @param obj
	 * @return
	 * @author:ţ����
	 * @update:[����YYYY-MM-DD] [����������][�������]
	 */
	public static String JSONOBJ2Str(Object obj) {
		JSONArray jsonObject = JSONArray.fromObject(obj);
		String menuString = "";
		try {
			menuString = jsonObject.toString();
		} catch (Exception e) {
		}
		return menuString;
	}

	/**
	 * ������ڷ���
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		// List list = new ArrayList();
		// Map m1 = new HashMap();
		// m1.put("key1", "value1");
		// m1.put("key2", "value2");
		// Map m2 = new HashMap();
		// m2.put("key3", "value3");
		// m2.put("key4", "value4");
		// //list.add("first");
		// //list.add("second");
		// list.add(m1);
		// list.add(m2);
		// String jsonStr = List2JSONStr(list,0);
		// System.out.println(jsonStr);
		// *
		// JSONArray jsonArray = JSONArray.fromObject(list);
		// String strJSON = jsonArray.toString();
		// System.out.println(strJSON);
		// String newStr = strJSON.replace('"', '\'');
		// newStr = "{'data':"+newStr +"}";
		// System.out.println(newStr);
		// newStr = "{'key1':'value1','key2':'value2'}";
		// JSONObject jsonObject = JSONObject.fromObject(newStr);
		// Map classMap = new HashMap();
		// classMap.put( "data", Person.class );
		// MyBean bean = JSONObject.toBean( JSONObject.fromObject(json),
		// MyBean.class, classMap );
		// System.out.println(jsonObject.getClass());
		// Map bean = (Map) JSONObject.toBean( jsonObject, Map.class );
		// System.out.println(bean.get("key1"));
		// List myList = (List)JSONObject.toBean(jsonObject.getJSONObject("data"),
		// ArrayList.class);
		// Map m = JSONStr2Map("{\"key1\":'value1','key2':'value2'}");
		// System.out.println("m:"+m.get("key1"));
		// List l = JSON2List("{aaa:'l1',bbb:'l2'}");
		// System.out.println("l:"+l.get(0));//*/
		String s = "{id:certsn,{isHidden:false,width:120,index:2}},{id:subject,{isHidden:false,width"
				+ ":120,index:3}},{id:ctmlName,{isHidden:false,width:170,index:4}},{id:notBefore,{i"
				+ "sHidden:false,width:80,index:5}},{id:validity,{isHidden:false,width:60,index:6}}"
				+ ",{id:certStatus,{isHidden:false,width:60,index:7}},{id:certDown,{isHidden:false,"
				+ "width:100,index:8}}";
		
		String s1="{'id':'certsn','isHidden':'false','width':'120','index':'2'}";
		Map map =new HashMap();
		map = JSONKit.JSONStr2Map(s1);
		System.out.println("id=="+map.get("id"));
	}
	/**
	 * ��Actionֱ�����json��Ϣ�ķ���
	 * 
	 * @param info
	 */
	public static void outJSONInfo(String info) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println(info);
			out.flush();
		} catch (IOException e) {
		}
	}
}
