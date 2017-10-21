package com.yxq.action;

import java.util.List;

import com.yxq.actionSuper.AdminSuperAction;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;

public class AdminAction extends AdminSuperAction {

	/** ���ܣ�����Ա����-�����б���ʾ��Ϣ */
	public String ListShow(){
		request.setAttribute("mainPage","../info/listshow.jsp");
		session.remove("adminOP");	
		
		int infoType=showType.getInfoType();
		String stateType=showType.getStateType();
		String payforType=showType.getPayforType();

		session.put("infoType",Integer.valueOf(infoType));  				//������ѡ��ġ���Ϣ��𡱵�ѡ��
		session.put("payforType",payforType);								//������ѡ��ġ�����״̬����ѡ��
		session.put("stateType",stateType);									//������ѡ��ġ����״̬����ѡ��		
		
		String sqlall="";
		String sqlsub="";
		Object[] params=null;
		String mark="";		
		int perR=8;
		
		if(!stateType.equals("all")&&!payforType.equals("all")){			//û��ͬʱѡ�񡰸���״̬���롰���״̬���еġ�ȫ����ѡ��
			mark="1";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_payfor=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) AND (info_payfor=?) ORDER BY info_date DESC";			
			params=new Object[3];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
			params[2]=payforType;					
		}else if(stateType.equals("all")&&payforType.equals("all")){		//ͬʱѡ���ˡ�����״̬���롰���״̬���еġ�ȫ����ѡ��
			mark="2";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) ORDER BY info_date DESC";			
			params=new Object[1];
			params[0]=Integer.valueOf(infoType);
		}else if(payforType.equals("all")){									//ѡ���ˡ�����״̬���еġ�ȫ����ѡ������״̬��ѡ������
			mark="3";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_state=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=stateType;
		}
		else if(stateType.equals("all")){  									//ѡ���ˡ����״̬���еġ�ȫ����ѡ�������״̬��ѡ������
			mark="4";
			sqlall="SELECT * FROM tb_info WHERE (info_type=?) AND (info_payfor=?) ORDER BY info_date DESC";
			sqlsub="SELECT TOP "+perR+" * FROM tb_info WHERE (info_type=?) AND (info_payfor=?) ORDER BY info_date DESC";
			params=new Object[2];
			params[0]=Integer.valueOf(infoType);
			params[1]=payforType;
		}		
		
		String strCurrentP=request.getParameter("showpage");
		String gowhich="admin_ListShow.action";
		
		OpDB myOp=new OpDB();
		CreatePage createPage=myOp.OpCreatePage(sqlall, params,perR,strCurrentP,gowhich);			//����OpDB���е�OpCreatePage()����������ܼ�¼������ҳ�����������õ�ǰҳ�룬��Щ��Ϣ����װ����createPage������
		
		int currentP=createPage.getCurrentP();		
		if(currentP>1){
			int top=(currentP-1)*perR;
			if(mark.equals("1")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_payfor = ?) AND (info_state = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_payfor = i.info_payfor) AND (info_state = i.info_state) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("2")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("3")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_state = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_state = i.info_state) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}
			else if(mark.equals("4")){
				sqlsub="SELECT TOP "+perR+" * FROM tb_info i WHERE (info_type = ?) AND (info_payfor = ?) AND (info_date < (SELECT MIN(info_date) FROM (SELECT TOP "+top+" (info_date) FROM tb_info WHERE (info_type = i.info_type) AND (info_payfor = i.info_payfor) ORDER BY info_date DESC) AS mindate)) ORDER BY info_date DESC";
			}				
		}

		List adminlistshow=myOp.OpListShow(sqlsub, params);
		request.setAttribute("adminlistshow",adminlistshow);
		request.setAttribute("createpage",createPage);
		return SUCCESS;
	}

	
	/** ���ܣ�����Ա����-��ʾҪ��˵���Ϣ */
	public String CheckShow(){
		request.setAttribute("mainPage","../info/checkshow.jsp");		
		comebackState();
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		String checkID=request.getParameter("checkID");
		if(checkID==null||checkID.equals(""))
			checkID="-1";
		Object[] params={checkID};
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//��Ϣ������
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("city.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** ���ܣ�����Ա����-�����Ϣ(�������ݿ�) */
	public String Check(){
		session.put("adminOP","Check");			//��¼��ǰ����Ϊ�������Ϣ��			
		
		String checkID=request.getParameter("checkID");
		String sql="UPDATE tb_info SET info_state = 1 WHERE (id = ?)";
		Object[] params={checkID};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//�����Ϣ�ɹ�			
			return "checkSuccess";			
		}
		else{									//�����Ϣʧ��
			comebackState();
			addFieldError("AdminCheckUnSuccess",getText("city.admin.check.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** ���ܣ�����Ա����-ɾ����Ϣ(�������ݿ�) */
	public String Delete(){
		session.put("adminOP","Delete");		//��¼��ǰ����Ϊ��ɾ����Ϣ��			
		
		String deleteID=request.getParameter("deleteID");
		String sql="DELETE tb_info WHERE (id = ?)";
		Object[] params={deleteID};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//ɾ����Ϣ�ɹ�			
			return "deleteSuccess";			
		}
		else{									//ɾ����Ϣʧ��
			comebackState();
			addFieldError("AdminDeleteUnSuccess",getText("city.admin.delete.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** ���ܣ�����Ա����-��ʾҪ���и������õ���Ϣ */
	public String SetMoneyShow(){
		request.setAttribute("mainPage","../info/moneyshow.jsp");		
		
		String moneyID=request.getParameter("moneyID");
		if(moneyID==null||moneyID.equals(""))
			moneyID="-1";
		
		String sql="SELECT * FROM tb_info WHERE (id = ?)";
		Object[] params={moneyID};
		
		OpDB myOp=new OpDB();
		infoSingle=myOp.OpSingleShow(sql, params);		
		if(infoSingle==null){			//��Ϣ������
			request.setAttribute("mainPage","/pages/error.jsp");
			addFieldError("AdminShowNoExist",getText("city.singleshow.no.exist"));
		}
		return SUCCESS;
	}
	
	/** ���ܣ�����Ա����-�����Ѹ�����Ϣ(�������ݿ�) */
	public String SetMoney(){		
		String moneyID=request.getParameter("moneyID");
		if(moneyID==null||moneyID.equals(""))
			moneyID="-1";
		String sql="UPDATE tb_info SET info_payfor=1 WHERE (id = ?)";
		Object[] params={Integer.valueOf(moneyID)};
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i>0){								//��Ϣ�������óɹ�			
			addFieldError("AdminSetMoneySuccess",getText("city.admin.setmoney.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "setMoneySuccess";			
		}
		else{									//��Ϣ��������ʧ��
			addFieldError("AdminSetMoneyUnSuccess",getText("city.admin.setmoney.no.success"));			
			request.setAttribute("mainPage","/pages/error.jsp");
			return "UnSuccess";
		}
	}
	
	/** ���ܣ���֤����-��̨�����б���ʾ��Ϣʱ����֤�Ƿ�ѡ����һ����ʾ��ʽ����Ϣ��� */
	public void validateListShow(){
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String adminOP=(String)session.get("adminOP");
		if(adminOP==null)
			adminOP="";
		if(adminOP.equals("Check")||adminOP.equals("Delete"))    //����ǽ����ˡ�ͨ����ˡ���ɾ����Ϣ����������������ListShow()������ʾ��Ϣ�б�����Ҫ�ָ�֮ǰѡ��ġ���ʾ��ʽ���͡���Ϣ���״̬���Ӷ�������ListShow()�����в�ѯ�����������ļ�¼
			comebackState();			
		else{
			int getInfoType=showType.getInfoType();			
			String getPayforType=showType.getPayforType();
			String getStateType=showType.getStateType();
			
			if(getInfoType<=0){
				if(session.get("infoType")!=null){
					getInfoType=(Integer)session.get("infoType");
					showType.setInfoType(getInfoType);
				}
			}			
			if(getPayforType==null||getPayforType.equals("")){
				getPayforType=(String)session.get("payforType");
				showType.setPayforType(getPayforType);
			}
            if(getStateType==null||getStateType.equals("")){
            	getStateType=(String)session.get("stateType");
            	showType.setStateType(getStateType);
			}			
			
			if(getInfoType<=0){						//û��ѡ����Ϣ���
				addFieldError("AdminListNoType",getText("city.admin.list.no.infoType"));
			}
			else{
				if(getPayforType==null||getPayforType.equals("")){		//û��ѡ�񡰸���״̬��ѡ��
					addFieldError("AdminListNoPayForType",getText("city.admin.list.no.payforType"));
				}
				if(getStateType==null||getStateType.equals("")){			//û��ѡ�����״̬��ѡ��
					addFieldError("AdminListNoStateType",getText("city.admin.list.no.stateType"));
				}
			}			
		}
	}
	
	/** ���ܣ���֤����-��̨������Ϣ�ĸ������ò���ʱ����֤�Ƿ���������ϢIDֵ�������IDֵ�Ƿ�Ϊ���ָ�ʽ */
	public void validateSetMoneyShow() {
		request.setAttribute("mainPage","/pages/error.jsp");
		
		String moneyID=request.getParameter("moneyID");		
		if(moneyID==null||moneyID.equals("")){				//û��������ϢIDֵ
			addFieldError("moneyIDError",getText("city.admin.setMoney.no.moneyID"));
		}
		else{												//��֤�������ϢIDֵ�Ƿ�Ϊ���ָ�ʽ			
			try{
				int id=Integer.parseInt(moneyID);
				if(id<0)									//��IDΪ����
					addFieldError("moneyIDError",getText("city.admin.setMoney.moneyID.0"));
			}catch(NumberFormatException e){
				addFieldError("moneyIDError",getText("city.admin.setMoney.format.moneyID"));
				e.printStackTrace();
			}
		}
	}
	
	/** ���ܣ��ָ��ڡ���ʾ��ʽ���е�ѡ��״̬ */
	private void comebackState(){
		/* ��ȡsession�б����ѡ��״̬��
		 * ��ѡ��״̬������session�У�
		 * ���ڹ���Ա��������ʾ����ť�����б���ʾʱ��
		 * ��ListShow()������ʵ�ֵ�
		 */
		Integer getInfoType=(Integer)session.get("infoType");
		String getPayForType=(String)session.get("payforType");
		String getStateType=(String)session.get("stateType");
		
		/* �ָ�ѡ���״̬ */
		if(getPayForType!=null&&getStateType!=null&&getInfoType!=null){			
			showType.setInfoType(getInfoType.intValue());	
			showType.setPayforType(getPayForType);
			showType.setStateType(getStateType);			
		}
	}
}
