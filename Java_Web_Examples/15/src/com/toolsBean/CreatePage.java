package com.toolsBean;

public class CreatePage {
	private int currentP;			//��ǰҳ��
	private int allP;				//��ҳ��
	private int allR;				//�ܼ�¼��
	private int perR;				//ÿҳ��ʾ��¼��
	private String pageLink;		//��ҳ��������Ϣ
	private String pageInfo;		//��ҳ״̬��ʾ��Ϣ
	
	public CreatePage(){
		currentP=1;
		allP=1;
		allR=0;
		perR=3;
		pageLink="";
		pageInfo="";
	}
	
	/** ����ÿҳ��ʾ��¼�� */
	public void setPerR(int perR){
		this.perR=perR;
	}
	
	/** �����ܼ�¼�� */
	public void setAllR(int allR){
		this.allR=allR;
	}
	/** ������ҳ�� */
	public void setAllP(){
		allP=(allR%perR==0)?(allR/perR):(allR/perR+1);
	}
	
	/** ���õ�ǰҳ�� */
	public void setCurrentP(String currentP) {		
		if(currentP==null||currentP.equals(""))
			currentP="1";
		try{
			this.currentP=Integer.parseInt(currentP);
		}catch(NumberFormatException e){
			this.currentP=1;
			e.printStackTrace();
		}
		if(this.currentP<1)
			this.currentP=1;
		if(this.currentP>allP)
			this.currentP=allP;		
	}

	/** ���÷�ҳ״̬��ʾ��Ϣ */
	public void setPageInfo(){
		if(allP>=1){
			pageInfo="<table border='0' cellpadding='3'><tr><td>";
			pageInfo+="ÿҳ��ʾ��"+perR+"/"+allR+" ����¼��";
			pageInfo+="&nbsp;&nbsp;&nbsp;&nbsp;";
			pageInfo+="��ǰҳ��"+currentP+"/"+allP+" ҳ��";
			pageInfo+="</td></tr></table>";			
		}				
	}
	
    /** ���÷�ҳ��������Ϣ */
	public void setPageLink(String goWhich){
		if(goWhich==null)
			goWhich="";
		if(goWhich.indexOf("?")>=0)
			goWhich+="&";
		else
			goWhich+="?";
		if(allP>1){
			pageLink="<table border='0' cellpadding='3'><tr><td>";
			if(currentP>1){
				pageLink+="<a href='"+goWhich+"showPage=1'>��ҳ</a>&nbsp;&nbsp;";
				pageLink+="<a href='"+goWhich+"showPage="+(currentP-1)+"'>��һҳ</a>&nbsp;&nbsp;";
			}
			if(currentP<allP){
				pageLink+="<a href='"+goWhich+"showPage="+(currentP+1)+"'>��һҳ</a>&nbsp;&nbsp;";
				pageLink+="<a href='"+goWhich+"showPage="+allP+"'>βҳ</a>";
			}
			pageLink+="</td></tr></table>";			
		}		
	}
	
	
	/** ����ÿҳ��¼�� */
	public int getPerR(){
		return perR;
	}
	
	/** �����ܼ�¼�� */
	public int getAllR() {
		return allR;
	}	
	
    /** ������ҳ�� */
	public int getAllP() {		
		return allP;
	}

	/** ���ص�ǰҳ�� */
	public int getCurrentP() {
		return currentP;
	}
	
	/** ���ط�ҳ״̬��ʾ��Ϣ */
	public String getPageInfo(){
		return pageInfo;
	}

	/** ���ط�ҳ��������Ϣ */
	public String getPageLink(){
		return pageLink;
	}
}