<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodselement"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	if(session.getAttribute("cart")==""){
	out.println("<script language='javascript'>alert('����û�й���!');window.location.href='index.jsp';</script>");
}
String Username="";
Username=(String)session.getAttribute("username");
if (Username!=""){
try{
ResultSet rs_user=conn.executeQuery("select * from tb_Member where username='"+Username+"'");
if(!rs_user.next()){
	session.invalidate();
	out.println("<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
	return;
}else{
	String username=chStr.chStr(request.getParameter("username"));
	String truename=chStr.chStr(request.getParameter("truename"));
	String address=chStr.chStr(request.getParameter("address"));
	String postcode=request.getParameter("postcode");
	String tel=request.getParameter("tel");
	String pay=chStr.chStr(request.getParameter("pay"));	
	String carry=chStr.chStr(request.getParameter("carry"));
	String bz=chStr.chStr(request.getParameter("bz"));
	int orderID=0;
	//�������
	float rebate=1;
	ResultSet rs_rebate=conn.executeQuery("select rebate from V_Member where username='"+username+"'");
	
	if (rs_rebate.next()){
		rebate=rs_rebate.getFloat("rebate");
	}
	Vector cart=(Vector)session.getAttribute("cart");
	int number=0;
	float nowprice=0f;
	float sum=0f;
	float Totalsum=0f;
	String flag="True";
	int temp=0;
	int ID=-1;
	//���붩����������
	float bnumber=cart.size();
	String sql="insert into tb_Order(bnumber,username,truename,address,postcode,tel,pay,carry,rebate,bz) values("+bnumber+",'"+username+"','"+truename+"','"+address+"','"+postcode+"','"+tel+"','"+pay+"','"+carry+"',"+rebate+",'"+bz+"')";
	temp=conn.executeUpdate_id(sql);
	//out.print("sql:"+sql);
	if (temp==0){
		 flag="false";
		// out.print(flag+"�������");
	}else{
		orderID=temp;
	}
	String str="";
	//���붩����ϸ������
	for(int i=0;i<cart.size();i++){
		Goodselement mygoodselement=(Goodselement)cart.elementAt(i);
		ID=mygoodselement.ID;
		nowprice=mygoodselement.nowprice*rebate;
		number=mygoodselement.number;
		sum=nowprice*number;
		str="insert into tb_order_Detail (orderID,goodsID,price,number) values("+orderID+","+ID+","+nowprice+","+number+")";
		temp=conn.executeUpdate(str);
		//out.print("sql2:"+str);
		Totalsum=Totalsum+sum;
		if (temp==0){
		 	flag="false";
	//out.print(flag+"�ӱ����");
		}
	}
	//���»�Ա��Ϣ
	String sql_up="update tb_Member set Amount=Amount+"+Totalsum+" where username='"+username+"'";
	temp=conn.executeUpdate(sql_up);	
	if (temp==0){
		 flag="false";
		// out.print(flag+"���»�Ա���Ѷ����");
	}
	//���»�Ա�ȼ�
	ResultSet rs_Amount=conn.executeQuery("select Amount from tb_Member where username='"+username+"'");
	if (rs_Amount.next()){
		int Amount=0;
		Amount=rs_Amount.getInt("Amount");
		ResultSet rs_grade=conn.executeQuery("select Top 1 grade,Amount from tb_rebate where Amount<="+Amount+" order by grade desc");
		if (rs_grade.next()){
	int grade=0;
	grade=rs_grade.getInt("grade");
	String sql_upgrade="update tb_Member set grade="+grade+" where username='"+username+"'";
	temp=conn.executeUpdate(sql_upgrade);	
	if (temp==0){
		 flag="false";
		 //out.print(flag+"���»�Ա�ȼ�����");
	}
		}
	}
	if(flag.equals("false")){
		out.println("<script language='javascript'>alert('������Ч');history.back();</script>");
	}else{
		session.removeAttribute("cart");
		out.println("<script language='javascript'>alert('�������ɣ����ס���Ķ�����["+orderID+"]');window.location.href='index.jsp';</script>");
	}
	conn.close();
}
}catch(Exception e){
out.println(e.toString());
}
}else{
	session.invalidate();
	out.println("<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">