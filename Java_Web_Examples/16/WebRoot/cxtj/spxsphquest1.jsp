<%@ page contentType="text/html;charset=gb2312" language="java"%>
<html>
  <title>��Ʒ��������</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
    <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <body>
<table width="99%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" colspan="6" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã���ѯͳ��> </span>��Ʒ�������� &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="550" height="40" border="0" cellpadding="-2" cellspacing="-2">
          <form name="form1" method="POST" action="spxsphquest.jsp" target="MainFrame">
            <tr>
              <td align="center">
                ��ѡ���ѯ����:��
                <input type="text" name="sdate" value="������������" size="11">
                ��:
                <input type="text" name="edate" value="������������" size="11">��&nbsp;��
                <select name="orderby">
                  <option value="je">���</option>
                  <option value="sl">����</option>
                </select>
                <select name="paixu">
                  <option value="desc">��������</option>
                  <option value="asc">��������</option>
                </select>
                <input type="button" class="btn_grey" onClick="check()" value="�鿴����">
              </td></tr>
			  </form>
  </table>
  </td></tr></table>
</body>
</html>
<script language="javascript">
function  check(){
  if(form1.sdate.value==0){
    form1.sdate.focus();
    alert("�������ѯ����");return;
    }
  if(form1.edate.value==0){
    form1.edate.focus();
    alert("�������ֹ����");return;
    }
  if(CheckDate(form1.sdate.value)){
    alert("�������׼����(��:(��/��/��)��(��-��-��))");
    form1.sdate.value="";
    form1.sdate.focus();
    return;
  }
  if(CheckDate(form1.edate.value)){
    alert("�������׼����(��:(��/��/��)��(��-��-��))");
    form1.edate.value="";
    form1.edate.focus();
    return;
  }
  form1.submit();
}
//�ж�����������Ƿ���ȷ
function CheckDate(INDate){
 if (INDate=="")			//�����������Ϊ��
    {return true;}
	subYY=INDate.substr(0,4)	 //��ȡ�������ڵ�ǰ4λ
	if(isNaN(subYY) || subYY<=0){	//�������Ĳ������ֻ����Ǹ���
		return true;
	}
	//ת���·ݣ����������ֵĵ�0λ��ʼ���ң��ж��Ƿ����ַ���"-"������н�separate��ֵ����Ϊ"-"
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}//���û���ַ���"-"����ô��separate��ֵ����Ϊ"/"
		else {return true;}//����������߾���ѯ�������򷵻�true
		}
		area=INDate.indexOf(separate,0)//���ַ����ĵ�һ��λ�ÿ�ʼ���ң������ض��ַ���λ��
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}//����·�ֻ��1λ����ô������ǰ���"0"
	//ת����
	area=INDate.lastIndexOf(separate)//���ַ��������һλ��ʼ���ң������ض��ַ���λ��
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}	//����Ϊ���ֱ��ʽ���ַ�����ֵ
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}	//����������ڵĳ���С��10
    if(NewDate.substr(4,1)!="-"){return true;}	//����������ڵĵ�5λ����"-"
    if(NewDate.substr(7,1)!="-"){return true;}	//����������ڵĵ�8λ����"-"
	var MM=NewDate.substr(5,2);		//�ӵ�5λ��ʼ��ȡ�ַ�������ȡ2Ϊ��������·�
	var DD=NewDate.substr(8,2);		//�ӵ�8λ��ʼ��ȡ�ַ�������ȡ2Ϊ���������
	//�ж��Ƿ�Ϊ���꣨�ܱ�4�������Ҳ��ܱ�100��������ֻ�ܱ�400��������ݾ�Ϊ���꣩
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //�ж��Ƿ�Ϊ����
		if(parseInt(MM)==2){	//��MMת��Ϊ����
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //�ж�ÿ���е��������
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){	//�ж��·��Ƿ�Ϊ�����е�ֵ
			if(parseInt(DD)>31){
				return true;
			}else{
				return false;
			}
		}
	}
   if(parseInt(DD)>30){return true;}
   if(parseInt(MM)>12){return true;}//����·ݴ���12
   return false;	//�����������������򷵻�false
   }
</script>
