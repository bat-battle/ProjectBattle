<%@ page contentType="text/html;charset=gb2312"%>
<%request.setCharacterEncoding("gb2312");%>
<html>
  <title>���۽��˲�ѯ</title>
  <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
  <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
<!--
.style1 {color: #FF3535}
.style2 {color: #333333}
-->
    </style>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td height="27" bgcolor="#EEEEEE" class="tableBorder_gray">
    &nbsp;<span  class="word_deepgrey"> ��ǰλ�ã��������� > </span>�����˲�ѯ &gt;&gt;&gt;</td>
  </tr>
    <tr><td valign="top" height="83">
      <table width="98%" height="90" border="0" cellpadding="0" cellspacing="0">
        <tr><td width="590" height="41" align="Top">
          <form name="form1" method="POST" action="rkjzquest.jsp" target="MainFrame">
            <div align="center">��ѡ���ѯ����:
                <select name="cif">
                  <option value="gysname" selected>��Ӧ������</option>
                  <option value="id">�����</option>
                  <option value="rkid">���Ʊ��</option>
                </select>
                <select name="ccif">
                  <option value="=" selected> ����</option>
                  <option value="LIKE">LIKE</option>
                  <option value="ALL">ALL</option>
                </select>
                <input type="text" name="qvalue">
                <select name="andor">
                  <option value="AND" selected> AND</option>
                  <option value="OR">OR</option>
                </select>
                <br>
                �������ѯ���ڣ���
                <input type="text" name="sdate" size="16">
                ��
                <input type="text" name="edate" size="16">
                <input name="submit1" type="button" class="btn_grey" value="��ѯ" onClick="check()">
                <input name="submit2" type="button" class="btn_grey" value="��ʾȫ������" onClick="listall()">
            </div>
          </form>
           </td><td>&nbsp;
        </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body>
</html>
<script language='JavaScript'>
function listall()
{
window.location.reload();
form1.ccif.value="ALL";
form1.submit();}
function  check(){
  if(form1.qvalue.value==0){
    alert("�������ѯ����");form1.qvalue.focus();
    return;
  }
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
    form1.sdate.focus();
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
function CheckDate(INDate)
{ if (INDate=="")//�����������Ϊ��
    {return true;}
	subYY=INDate.substr(0,4)//��ȡ�������ڵ�ǰ4λ
	if(isNaN(subYY) || subYY<=0){//�������Ĳ������ֻ����Ǹ���
		return true;
	}
	//ת���·�
        //�ӵ��������ֵĵ�0λ��ʼ���ң��ж��Ƿ����ַ���"-",����н�separate��ֵ����Ϊ"-"
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
                //���ַ����ĵ�һ��λ�ÿ�ʼ���ң������ض��ַ���λ��
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}//����·ݵ�ֻ��һλ��ô������ǰ���"0"
	//ת����
	area=INDate.lastIndexOf(separate)//���ַ��������һλ��ʼ���ң������ض��ַ���λ��
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}//����Ϊ���ֱ��ʾ���ַ�����ֵ
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}//����������ڵĳ���С��10
    if(NewDate.substr(4,1)!="-"){return true;}//����������ڵĵ�5λ����"-"
    if(NewDate.substr(7,1)!="-"){return true;}//����������ڵĵ�8λ����"-"
	var MM=NewDate.substr(5,2);//�ӵ�5λ��ʼ��ȡ�ַ�������ȡ2Ϊ��������·�
	var DD=NewDate.substr(8,2);//�ӵ�8λ��ʼ��ȡ�ַ�������ȡ2Ϊ���������
        //�ж��Ƿ�Ϊ���꣨�ܱ�4���������ܹ���100��������ֻ�ܱ�400��������ݾ�Ϊ���꣩
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){
		if(parseInt(MM)==2){//��MMת��Ϊ����
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}
	}
	var mm=new Array(1,3,5,7,8,10,12); //�ж�ÿ���е��������
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){//�ж��·��Ƿ�Ϊ�����е�ֵ
			if(parseInt(DD)>31){return true;}
		}else{
			if(parseInt(DD)>30){return true;}
		}
	}
	if(parseInt(MM)>12){return true;}//����·ݴ���12
   return false;}//���������������Ƿ���false
</script>
