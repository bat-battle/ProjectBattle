function checkRegList(form){
	if(form.select1.value=="djrq"){
		if(form.strvalue.value==""){
			alert("�������ѯ����ѧ���ڣ��磺1981-02-08��!");return false;
		}else if(CheckDate(form.strvalue.value)){
			alert("����ȷ�����ѯ����ѧ���ڣ��磺1981-02-08��!");return false;
		}
	}else if(form.select1.value=="lqfs"){
		if(form.strvalue.value==""||isNaN(form.strvalue.value)){
			alert("����ȷ�����ѯ��¼ȡ����");return false;
		}
	}
}
function checkBorrowService(form){
	if(form.condition.value=="��������"){
		if(form.conditionContent.value==""){
			alert("�������ѯ�Ľ������ڣ��磺1981-02-08��!");return false;
		}else if(CheckDate(form.conditionContent.value)){
			alert("����ȷ�����ѯ�Ľ������ڣ��磺1981-02-08��!");return false;
		}
	}
}
function checkEmpty(form1){
	for(i = 0; i < form1.length;i++){
		if(form1.elements[i].value==""){
			alert("����Ϣ����Ϊ��");
			return false;
		}
	}
}
function sturegvalid(myform){
	if (myform.jbr.value==""){
		alert("�����뾭����������");myform.jbr.focus();return false;
	}
	if (myform.lqfs.value==""||isNaN(myform.lqfs.value)){
		alert("����ȷ����¼ȡ������");myform.lqfs.focus();return false;
	}	
}
function checkBorrow(form){
	if(form.stu_id.value==""||isNaN(form.stu_id.value)){
		alert("�������ָ�ʽ����ѧ��!");form.stu_id.focus();return false;
	}
	if(form.book_id.value==""){
		alert("���������!");form.book_id.focus();return false;
	}
}
function checkTea(form){
	if(form.name.value==""){
		alert("�������ʦ����!");form.name.focus();return false;
	}
	if(form.age.value==""||isNaN(form.age.value)){
		alert("�������ָ�ʽ�����ʦ����!");form.age.focus();return false;
	}
	if(form.csrq.value==""||CheckDate(form.csrq.value)){
		alert("������������ڣ��磺1981-02-08��!");form.csrq.focus();return false;
	}
	if(form.sfzh.value==""||isNaN(form.sfzh.value)){
		alert("�������ָ�ʽ�������֤����!");form.sfzh.focus();return false;
	}
	if(form.lxdh.value==""||isNaN(form.lxdh.value)){
		alert("�������ָ�ʽ������ϵ�绰����!");form.lxdh.focus();return false;
	}
	if(form.gzrq.value==""||CheckDate(form.gzrq.value)){
		alert("�����빤�����ڣ��磺1981-02-08��!");form.gzrq.focus();return false;
	}
}
function checkCourse(form){
	if(form.teaId.value==""||isNaN(form.teaId.value)){
		alert("�������ָ�ʽ�����ʦ��ţ�");form.teaId.focus();return false;
	}
	if(form.rkrq.value==""||CheckDate(form.rkrq.value)){
		alert("�������ʦ�ο����ڣ��磺1981-02-08����");form.rkrq.focus();return false;
	}
}
function checkCharge(form){
	if(form.teaId.value==""||isNaN(form.teaId.value)){
		alert("�������ָ�ʽ�����ʦ��ţ�");form.teaId.focus();return false;
	}
	if(form.rzrq.value==""||CheckDate(form.rzrq.value)){
		alert("�������ʦ��ְ���ڣ��磺1981-02-08����");form.rzrq.focus();return false;
	}
}
function sorucenjtj(form1){
	if(document.form1.typeexam.value==""){
		alert("���������Ϊ�գ�������!!!");
		document.form1.typeexam.focus();
		return false;
	}
	if(document.form1.dateexam.value==""){
		alert("�������ڲ���Ϊ�գ�������!!!");
		document.form1.dateexam.focus();
		return false;
	}
	if(CheckDate(form1.dateexam.value)){
		alert("�������׼���ڣ��磺1980-07-17��");
		form1.dateexam.focus();
		return false;
	}
}
function mycheck(form1){
	if (form1.book_id.value==""){
		alert("��������ţ�");	form1.book_id.focus();return false;
	} 
	if (form1.book_name.value==""){
		alert("������ͼ�����ƣ�");form1.book_name.focus();return false;
	}
	if (form1.writer.value==""){
		alert("���������ߣ�");form1.writer.focus();return false;
	}
	if (form1.book_type.value==""){
		alert("���������");form1.book_type.focus();return false;
	}	
	if (form1.book_concern.value==""){
		alert("����������磡");form1.book_concern.focus();return false;
	}	
	if (form1.publish_date.value==""||CheckDate(form1.publish_date.value)){
		alert("�����뷢�����ڣ����磺1980-07-17��");form1.publish_date.focus();return false;
	}
	if (form1.price.value==""){
		alert("�����붨�ۣ�");form1.price.focus();return false;
	}	
	if (isNaN(form1.price.value)){
		alert("������Ķ��۴������������룡");form1.price.value="";form1.price.focus();return false;
	}
	if (form1.czy.value==""){
		alert("���������Ա��");form1.czy.focus();return false;
	}
	if (form1.book_count.value==""||isNaN(form1.book_count.value)){
		alert("��ȷ�����������");form1.book_count.focus();return false;
	}
}
function stusourcevalid(myform){
	if (myform.stuId.value==""){
		alert("������ѧ����ţ�");myform.stuId.focus();return false;
	}
	if (document.myform.stuName.value==""){
		alert("����ѧ��������");myform.stuName.focus();return false;
	}	
	if(myform.examType.value==""){
		alert("�����뿼�����");myform.examType.focus();return false;		
	}
	if(myform.examDate.value==""){
		alert("�����뿼�����ڣ�");myform.examDate.focus();return false;		
	}
	if(CheckDate(myform.examDate.value)){
		alert("�������׼���ڣ��磺1981-02-8��");myform.examDate.focus();return false;
	}
	if(myform.czy.value==""){
		alert("���������Ա��");myform.czy.focus();return false;		
	}
}
function stuinfovalid(myform){
	if (myform.stuId.value==""){
		alert("��ѡ��ѧ���༶��");return false;
	}
	if (myform.name.value==""){
		alert("������ѧ��������");myform.name.focus();return false;
	}
	if (myform.age.value==""||isNaN(myform.age.value)){
		alert("����ѧ���������Ϊ��ֵ���ͣ�");myform.age.focus();return false;
	}	
	if(myform.sfzhm.value==""||isNaN(myform.sfzhm.value)){
		alert("�������ָ�ʽ�������֤����");myform.sfzhm.focus();return false;
	}		
	if(CheckDate(myform.csrq.value)){
		alert("�������׼���ڣ��磺1980-07-17��");myform.csrq.focus();return false;
	}
	if (myform.jtdz.value==""){
		alert("�������ͥ��ַ��");myform.jtdz.focus();return false;
	}
	if (myform.jtdh.value==""||isNaN(myform.jtdh.value)){
		alert("�������ָ�ʽ�����ͥ�绰��");myform.jtdh.focus();return false;
	}
 }
 
 
 
 function CheckDate(INDate){ 
   if (INDate=="")
    {return true;}
	subYY=INDate.substr(0,4)
	//ת���·�
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}}
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(subMM.length<2){subMM="0"+subMM}
	//ת����
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	if(NewDate.substr(5,2)>"12"){return true;}
	if(NewDate.substr(8,2)>"31"){return true;}
   return false;
 }