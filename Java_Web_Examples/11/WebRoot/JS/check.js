//�ж��û��������Ƿ�Ϸ�
function check(){
	if (myform.username.value==""){
		alert("�������û�����");myform.username.focus();return;
	}
	if (myform.truename.value==""){
		alert("��������ʵ������");myform.truename.focus();return;
	}
	if (myform.pwd.value==""){
		alert("���������룡");myform.pwd.focus();return;
	}
	if (myform.pwd.value.length<1){
		alert("��������Ϊ6λ�����������룡");myform.pwd.focus();return;
	}		
	if (myform.pwd1.value==""){
		alert("��ȷ�����룡");myform.pwd1.focus();return;
	}
	if (myform.pwd.value!=myform.pwd1.value){
		alert("��������������벻һ�£����������룡");myform.pwd.focus();return;
	}
	if(myform.cardno.value==""){
		alert("��֤�����룡");myform.cardno.focus();return;
	}		
	if (myform.email.value==""){
		alert("������Email��ַ��");myform.email.focus();return;
	}
	var i=myform.email.value.indexOf("@");
	var j=myform.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("�������Email��ַ����ȷ�����������룡");myform.email.value="";myform.email.focus();return;
	}
	myform.submit();		
}
function check_modi(){
	if (myform.truename.value==""){
		alert("��������ʵ������");myform.truename.focus();return;
	}
	if (myform.oldpwd.value==""){
		alert("������ԭ���룡");myform.oldpwd.focus();return;
	}
	if(myform.holdpwd.value!=myform.oldpwd.value){
		alert("�������ԭ���벻��ȷ�����������룡");myform.oldpwd.value="";myform.oldpwd.focus();return;
	}
	if (myform.pwd.value==""){
		alert("�����������룡");myform.pwd.focus();return;
	}
	if (myform.pwd.value.length<1){
		alert("����������Ϊ6λ�����������룡");myform.pwd.focus();return;
	}		
	if (myform.pwd1.value==""){
		alert("��ȷ�������룡");myform.pwd1.focus();return;
	}
	if (myform.pwd.value!=myform.pwd1.value){
		alert("��������������벻һ�£����������룡");myform.pwd.focus();return;
	}
	if(myform.cardno.value==""){
		alert("��֤�����룡");myform.cardno.focus();return;
	}		
	if (myform.email.value==""){
		alert("������Email��ַ��");myform.email.focus();return;
	}
	var i=myform.email.value.indexOf("@");
	var j=myform.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("�������Email��ַ����ȷ�����������룡");myform.email.value="";myform.email.focus();return;
	}
	myform.submit();		
}
function checkU(myform){
	if(myform.username.value==""){
		alert("�������û���!");myform.username.focus();return;
	}
	if(myform.PWD.value==""){
		alert("����������!");myform.PWD.focus();return;
	}
	myform.submit();
}

function checkM(myform){
	if(myform.manager.value==""){
		alert("���������Ա��!");myform.manager.focus();return false;
	}
	if(myform.PWD.value==""){
		alert("����������!");myform.PWD.focus();return false;
	}
}
function CheckAll(elementsA,elementsB){
	for(i=0;i<elementsA.length;i++){
		elementsA[i].checked = true;
	}
	if(elementsB.checked ==false){
		for(j=0;j<elementsA.length;j++){
			elementsA[j].checked = false;
		}
	}
}
//�ж��û��Ƿ�ѡ����Ҫɾ���ļ�¼������ǣ�����ʾ���Ƿ�ɾ������������ʾ����ѡ��Ҫɾ���ļ�¼��
function checkdel(delid,formname){
	var flag = false;
	for(i=0;i<delid.length;i++){
		if(delid[i].checked){
			flag = true;
			break;
		}
	}
	if(!flag){
		alert("��ѡ��Ҫɾ���ļ�¼��");
		return false;
	}else{
			if(confirm("ȷ��Ҫɾ����")){
				formname.submit();
		}
	}
}