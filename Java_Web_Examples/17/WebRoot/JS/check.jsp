//�ж��û��������Ƿ�Ϸ�
function check(){
	if (myform.UserName.value==""){
		alert("�������û�����");myform.UserName.focus();return;
	}
	if (myform.TrueName.value==""){
		alert("��������ʵ������");myform.TrueName.focus();return;
	}
	if (myform.PWD1.value==""){
		alert("���������룡");myform.PWD1.focus();return;
	}
	if (myform.PWD1.value.length<6){
		alert("��������Ϊ6λ�����������룡");myform.PWD1.focus();return;
	}		
	if (myform.PWD2.value==""){
		alert("��ȷ�����룡");myform.PWD2.focus();return;
	}
	if (myform.PWD1.value!=myform.PWD2.value){
		alert("��������������벻һ�£����������룡");myform.PWD1.focus();return;
	}
	if(myform.cardNO.value==""){
		alert("��֤�����룡");myform.cardNO.focus();return;
	}		
	if (myform.Email.value==""){
		alert("������Email��ַ��");myform.Email.focus();return;
	}
	var i=myform.Email.value.indexOf("@");
	var j=myform.Email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("�������Email��ַ����ȷ�����������룡");myform.Email.value="";myform.Email.focus();return;
	}
	myform.submit();		
}
//�ж��û��������Ƿ�Ϸ�
function check_m(){
	if (myform.TrueName.value==""){
		alert("��������ʵ������");myform.TrueName.focus();return;
	}
	if (myform.PWD1.value==""){
		alert("������ԭ���룡");myform.PWD1.focus();return;
	}
	if (myform.PWD1.value!=myform.oldPWD.value){
		alert("�������ԭ���벻��ȷ�����������룡");myform.PWD1.focus();return;
	}		
	if (myform.PWD2.value==""){
		alert("�����������룡");myform.PWD2.focus();return;
	}
	if (myform.PWD3.value==""){
		alert("��ȷ�������룡");myform.PWD3.focus();return;
	}
	if (myform.PWD2.value!=myform.PWD3.value){
		alert("����������������벻һ�£����������룡");myform.PWD2.focus();return;
	}
	if(myform.cardNO.value==""){
		alert("��֤�����룡");myform.cardNO.focus();return;
	}		
	if (myform.Email.value==""){
		alert("������Email��ַ��");myform.Email.focus();return;
	}
	var i=myform.Email.value.indexOf("@");
	var j=myform.Email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("�������Email��ַ����ȷ�����������룡");myform.Email.value="";myform.Email.focus();return;
	}
	myform.submit();		
}