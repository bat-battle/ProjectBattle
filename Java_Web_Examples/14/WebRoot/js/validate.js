//<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<!-- Begin
function affiche(){
	if(form2.title.value==""){
		alert("������ⲻ����Ϊ��");	return false;
	}
	if(form2.content.value==""){
		alert("����д��������");	return false;
	}
}
function themetitle(){
	if(form3.checkbox.checked){
		form3.title.value="[�ȴ���Ļظ�]";
	}else{
		form3.title.value="";
	}
}
function themes(){
	if(form3.title.value==""){
		alert("����д��̳����");	return false;
	}
	if(form3.content.value==""){
		alert("�������ݲ�����Ϊ��");	return false;
	}
}
function fsorts(){
	if(form2.name.value==""){
		alert("����д�������");	return false;
	}
	if(form2.resume.value==""){
		alert("����д������");	return false;
	}
}
function news(){
	if(form2.title.value==""){
		alert("���ű��ⲻ����Ϊ��");	return false;
	}
	if(form2.content.value==""){
		alert("����д��������");	return false;
	}
}
function linkss(){
	if(form2.name.value==""){
		alert("����д������������");	return false;
	}
	if(form2.url.value==""){
		alert("����д��������URL");	return false;
	}
}
function ssort(){
	if(form2.name.value==""){
		alert("����д�������");	return false;
	}
}
function pricenum(){
	if(isNaN(forms.price.value)){
		alert("����д��ȷ����۸�");
		forms.price.focus();
		forms.price.value="";
		return false;
	}
}
function filesizes(){
	if(isNaN(forms.filesize.value)){
		alert("����д����");
		forms.filesize.focus();
		forms.filesize.value="";
		return false;
	}
}
function softs(){
	if(forms.name.value==""){
		alert("����д�������");
		return false;
	}
	if(forms.edition.value==""){
		alert("����д����汾");
		return false;
	}
	if(forms.price.value==""){
		alert("����д����۸�");
		return false;
	}
	if(forms.environment.value==""){
		alert("����д������л���");
		return false;
	}
	if(forms.filesize.value==""){
		alert("����д������ļ���С");
		return false;
	}
	if(forms.introduce.value==""){
		alert("����д�������");
		return false;
	}
}
function reg(){
	if(formr.uid.value==""){
		alert("����д�û�ID");	return false;
	}
	if(formr.password.value==""){
		alert("����д����");	return false;
	}
	if(formr.password.value!=formr.repassword.value){
		alert("����������ȷ�ϲ���");
		return false;
	}
	if(formr.name.value==""){
		alert("����д��ʵ����");	return false;
	}
	if(formr.regqu.value==""){
		alert("����д������ʾ");	return false;
	}
	if(formr.reganswer.value==""){
		alert("����дȡ������ش�");	return false;
	}
	if(formr.age.value==""){
		alert("����д����");	return false;
	}
	if(formr.email.value==""){
		alert("����дEmail");	return false;
	}
	if(formr.email.value!=""){
		if((formr.email.value.indexOf("@")==-1)||(formr.email.value.indexOf(".")==-1)){
			alert("Email��ַ����ȷ!");
			return false;
		}
	}
}
function updates(){
	if(formr.password.value==""){
		alert("����д�����޸�");	return false;
	}
	if(formr.password.value!=formr.repassword.value){
		alert("����������ȷ�ϲ���");
		return false;
	}
	if(formr.name.value==""){
		alert("����д��ʵ����");	return false;
	}
	if(formr.regqu.value==""){
		alert("����д������ʾ");	return false;
	}
	if(formr.reganswer.value==""){
		alert("����дȡ������ش�");	return false;
	}
	if(formr.age.value==""){
		alert("����д����");	return false;
	}
	if(formr.email.value==""){
		alert("����дEmail");	return false;
	}
	if(formr.email.value!=""){
		if((formr.email.value.indexOf("@")==-1)||(formr.email.value.indexOf(".")==-1)){
			alert("Email��ַ����ȷ!");
			return false;
		}
	}
}
function ages(){
	if(isNaN(formr.age.value)){
		alert("����д����");
		formr.age.focus();
		formr.age.value="";
		return false;
	}
}
function resolvent(){
	if(form2.name.value==""){
		alert("����д�����������");	return false;
	}
	if(form2.content.value==""){
		alert("����д�����������");	return false;
	}
}
function questions(){
	if(form2.question.value==""){
		alert("����д��������");	return false;
	}
	if(form2.answer.value==""){
		alert("����д����ش�");	return false;
	}
}
function guestboard(){
	if(form2.recontent.value==""){
		alert("����д�ظ�����");	return false;
	}
}
function mend(){
	if(forms.name.value==""){
		alert("����д�������");	return false;
	}
	if(forms.filesize.value==""){
		alert("����д�����С");	return false;
	}
	if(forms.resume.value==""){
		alert("����д�������");	return false;
	}
}
function logons(){
	if(forms.uid.value==""){
		alert("����д�û���");	return false;
	}
	if(forms.password.value==""){
		alert("����д�û�����");	return false;
	}
}
//  End -->
