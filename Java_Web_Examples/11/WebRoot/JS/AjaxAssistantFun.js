/**************************��������***************************/
function onerror(){
alert("���Ĳ�������");
window.location.href="index.jsp";
}
/***************************���ؽ����ʾ����******************************/
//��ӻ��޸���Ʒ��ϢʱӦ��
function deal_type(){
	subType.innerHTML=this.req.responseText;
}
//�޸Ĺ�������ʱӦ��
function deal_cart(){
	totalSum.innerHTML=this.req.responseText;
}
