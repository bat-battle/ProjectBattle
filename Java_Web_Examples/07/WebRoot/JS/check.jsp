//�ж��û��������Ƿ�Ϸ�
function check(myform){
	if(myform.author.value==""){
		alert("�����˲�����Ϊ��!");myform.author.focus();return;
	}
	if (myform.email.value!=""){
		var i=myform.email.value.indexOf("@");
		var j=myform.email.value.indexOf(".");
		if((i<0)||(i-j>0)||(j<0)){
			alert("�������Email��ַ����ȷ�����������룡");myform.email.value="";myform.email.focus();return;
		}
	}
	if(myform.content.value==""){
		alert("�������ݲ�����Ϊ�գ�");myform.content.focus();return;
	}	
	myform.submit();		
}

function checkM(myform){
	if(myform.name.value==""){
		alert("���������Ա��!");myform.name.focus();return;
	}
	if(myform.pwd.value==""){
		alert("����������!");myform.pwd.focus();return;
	}
	myform.submit();
}
