<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodselement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");
int ID=Integer.parseInt(request.getParameter("ID"));
int number=Integer.parseInt(request.getParameter("number"));
Vector newcart=new Vector();
float sum=0;
for(int i=0;i<cart.size();i++){
	Goodselement mygoodselement=(Goodselement)cart.elementAt(i);
	try{
		if(mygoodselement.ID==ID){	//�޸ĵ�����Ʒ�Ĺ�������
			mygoodselement.number=number;
		}
		if(number!=0){
			newcart.addElement(mygoodselement);
			sum=sum+mygoodselement.number*mygoodselement.nowprice;	//����ϼƽ��
		}
	}catch(Exception e){
		out.println("<script language='javascript'>alert('���Ĳ�������!');history.back();</script>");
		return;
	}
}
session.setAttribute("cart",newcart);	//�����ﳵ�е���Ʒ���浽session��
out.println("�ϼ��ܽ�<span class='word_orange'>��"+sum+"</span>");
%>
