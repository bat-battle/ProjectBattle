<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<head>
<title>�����������ۼ�����վ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="page" class="cars.Bean1" />
<jsp:useBean id="news" scope="page" class="cars.NewsShow" />
<jsp:useBean id="cross" scope="page" class="cars.CrossTable" />
<jsp:useBean id="rst" scope="page" class="cars.Pages" />
<jsp:useBean id="search" scope="page" class="cars.SearchTable" />
<%!
	String sql;
	String keyword,type;
	String vari;
	String name;
	int homo;
	int pagecount;
	int pages;
	int nows;
	int i;
	ResultSet rs;
	ResultSet rs1;
%>
<%
rs=cross.getrs(Integer.parseInt(request.getParameter("type")),Integer.parseInt(request.getParameter("id")));
 %>
<link rel="stylesheet" href="Css/style.css">
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<%@ include file="Top.jsp" %>
<table width="742" height="588" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="700" valign="top"><table width="164" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160" height="20" bgcolor="#FFCC99">&nbsp;��վ����</td>
      </tr>
      <tr>
        <td height="100" valign="top">
		<marquee behavior="alternate" scrollamount=3 onmouseover="this.stop()" onmouseout="this.start()">
		<% 
		sql="select * from tb_News where Type='վ�ڹ���' order by IssueDate";
		ResultSet rs3;
		rs3=data.getrs(sql);
		rs3.beforeFirst();
		i=0;
		while(rs3.next()&&(i<5)){
		i++;
		%>
		<%="<a href='#'onClick=javascript:window.open('News_Particular.jsp?id="+rs3.getInt("ID")+"','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs3.getString("Title")+"</a>" %><br>
		
		<%
		}
		data.close();
		%>

		</marquee>
		</td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;վ������</td>
      </tr>
      <tr>
        <td height="120"><%=search.getsearch()%></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFCC99">&nbsp;<a href="News.jsp" style="color:#000000 ">���ű���</a></td>
      </tr>
      <tr>
        <td height="293" valign="top"><%=news.getstring()%></td>
      </tr>
      <tr>
        <td height="20" valign="middle" bgcolor="#FFCC99">&nbsp;��ҵ����</td>
      </tr>
      <tr>
        <td height="120" valign="middle"><table width="160" height="100" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><a href="#"><img src="Image/mrflag.gif" width="136" height="38" border="0"></a></div></td>
          </tr>
          <tr>
            <td><div align="center"><a href="#"><img src="Image/ssph.gif" width="135" height="41" border="0"></a></div></td>
          </tr>
        </table></td>
      </tr>
    </table>    </td>
    <td width="578" valign="top">
	<%if(rs!=null){
	rs.beforeFirst();
	if(rs.next()){
	%>
	<table width="578" height="724" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td width="574" height="20">&nbsp;������Ϣչʾ</td>
      </tr>
      <tr>
        <td valign="top">
		<table width="574" height="250" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="50" colspan="2" class="br" align="center">
			<%
			sql="select * from tb_Basic1 where Homo="+Integer.parseInt(request.getParameter("type"));
			rs1=data.getrs(sql);
			rs1.beforeFirst();
			while(rs1!=null&&rs1.next()){
			%>
				<a href="Cars_Particular_Default.jsp?type=<%=request.getParameter("type")%>&id=<%=request.getParameter("id")%>&homo=<%=rs1.getInt("ID")%>" style="color:#000000 "><%out.print(rs1.getString("Name")+"| ");%></a>

			<%}
			data.close();
			%>
			</td>
            </tr>
          <tr>
            <td width="288" height="200" class="br"><table width="250" height="170" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="150" valign="middle" class="bottm"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="236" height="141"> </div></td>
                </tr>
                <tr>
                  <td height="20"><div align="center"></div>
                      <div align="center">
                        <table width="250" height="20" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="128" height="20" class="bottm">�ο��۸�<%=rs.getString("�ۼ�")%>����</td>
                            <td width="122" height="20" class="bottm"><div align="center">
                              <input name="Submit2" type="submit" class="buttons" value=" �� �� �� �� " onClick="javascript:window.open('OrderForm.jsp?action=<%=rs.getString("Ʒ��")%> <%=rs.getString("�ͺ�")%>','','width=500,height=560,toolbar=no,location=no,status=no,menubar=no')">
                            </div></td>
                          </tr>
                        </table>
                    </div></td>
                </tr>
            </table></td>
            <td width="286" valign="top" class="bottm"><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("���ּ��")%></td>
          </tr>
        </table>
		<%if(request.getParameter("homo")==null){%>
          <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">
                      <table width="500" border="1" align="center" cellpadding="0" cellspacing="0" id="jibenziliao">
                        <tr>
                          <td width="73" height="30" bgcolor="#efefef"><div align="right">����Ʒ�ƣ�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("Ʒ��"));%>
                            </div>
                              <div align="right"></div></td>
                          <td width="75" height="30" bgcolor="#efefef"><div align="right">�����ͺţ�</div></td>
                          <td width="171" height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("�ͺ�"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">������Ⱥ��</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("������Ⱥ"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">�ο��۸�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("�ۼ�"));%>
                    ����Ԫ��</div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">��ɫ��</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("��ɫ"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">��ۣ�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("���"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">���Σ�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">���ã�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="middle"><table width="500" height="220" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="133" rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="110" height="90"></div></td>
                          <td width="128" height="15" class="br"><div align="left">��� </div></td>
                          <td width="119" height="15" class="br"><div align="left">���� </div></td>
                          <td width="120" rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("���"));%>
                          </div></td>
                          <td width="119" height="95" class="br"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                          <td height="15" class="br"><div align="left">���� </div></td>
                          <td height="15" class="br">
                            <div align="left">��ɫ</div></td>
                          <td rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("��ɫͼƬ")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("��ɫ"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}else{
		  homo=Integer.parseInt(request.getParameter("homo"));
		  sql="select * from tb_Basic1 where ID="+homo;
		  ResultSet rs2=data.getrs(sql);
		  rs2.beforeFirst();
		  if(rs2!=null&&rs2.next()){
			name=rs2.getString("Name");
		  }
		  data.close();
		 if(request.getParameter("type").equals("1")){ 
		if(name.equals("��������")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="jibencanshu">
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">��߳��٣�</div></td>
                          <td width="305" height="35"><div align="center">
                            <%out.write(rs.getString("��߳���"));%>
                          </div></td>
                            </tr>
                        <tr>  
						  <td height="35" bgcolor="#efefef"><div align="center">�ƶ����룺</div></td>
                          <td width="305" height="35"><div align="center">
                            <%out.write(rs.getString("�ƶ�����"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">�����ͺģ�</div></td>
                          <td height="35"><div align="center">
                            <%out.write(rs.getString("�����ͺ�"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">�����ͺģ�</div></td>
                          <td height="35"><div align="center">
                           <%out.write(rs.getString("�����ͺ�"));%>                         
                          </div></td>
                        </tr>
                        <tr>
                          <td width="169" height="35" bgcolor="#efefef"><div align="center">0-100KM����ʱ�䣺</div></td>
                          <td width="305" height="35"><div align="center">
                            <%out.write(rs.getString("0-100KM����ʱ��"));%>
                          </div></td>
                        </tr>
                      </table>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}
		  if(name.equals("���β���")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="waixingcanshu">
                        <tr>
                          <td width="165" height="35" bgcolor="#efefef"><div align="center">�����ߴ磺</div></td>
                          <td height="35"><div align="center">
            <%out.write(rs.getString("�����ߴ�"));%>
        </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">��С��ؼ�϶��</div></td>
                          <td width="315" height="35"><div align="center">
                           <%out.write(rs.getString("��С��ؼ�϶"));%>
                          </div></td>
                             </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">��Сת��ֱ����</div></td>
                          <td width="315" height="35"><div align="center">
                            <%out.write(rs.getString("��Сת��ֱ��"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">�������أ�</div></td>
                          <td height="35">
                              <div align="center">
                               <%out.write(rs.getString("��������"));%>
                              </div></td>
                            </tr>
                        <tr> 
						  <td height="35" bgcolor="#efefef"><div align="center">��������</div></td>
                          <td height="35"><div align="center">
                            <%out.write(rs.getString("������"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">��λ����</div></td>
                          <td height="35"><div align="center">
                            <%out.write(rs.getString("��λ��"));%>
                          </div></td>
                              </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">��ȫ���ң�</div></td>
                          <td height="35"><div align="center">
                           <%out.write(rs.getString("��ȫ����"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">�������ݻ���</div></td>
                          <td height="35"><div align="center">
                           <%out.write(rs.getString("�������ݻ�"));%>
                          </div></td>
                             </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">ȼ�����ݻ���</div></td>
                          <td height="35"><div align="center">
                       <%out.write(rs.getString("ȼ�����ݻ�"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">����ϵ����</div></td>
                          <td height="35" colspan="3"><div align="center">
                        <%out.write(rs.getString("����ϵ��"));%>
                          </div></td>
                          </tr>
                      </table>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		 <%}if(name.equals("���̲���")){%>
		 <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="dipancanshu">
                        <tr>
                          <td width="98" height="35" bgcolor="#efefef"><div align="right">��������ʽ��</div></td>
                          <td width="382" height="35"><%out.write(rs.getString("��������ʽ"));%>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">��̥���ͼ����</div></td>
                          <td height="35"><%out.write(rs.getString("��̥���ͼ����"));%></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">�ƶ�װ����ʽ��</div></td>
                          <td height="35"><%out.write(rs.getString("�ƶ�װ����ʽ"));%></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">ת��ϵͳ��</div></td>
                          <td height="35"><%out.write(rs.getString("ת��ϵͳ"));%></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="right">������ʽ��</div></td>
                          <td height="35"><%out.write(rs.getString("������ʽ"));%></td>
                        </tr>
                      </table>
                      </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("����������")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <table width="480" border="1" cellspacing="0" cellpadding="0" id="fadongjicanshu">
                        <tr>
                          <td width="145" height="35" bgcolor="#efefef"><div align="center">���������ƣ�</div></td>
                          <td width="335" height="35"><div align="center">
                                <%out.write(rs.getString("����������"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">������λ�ã�</div></td>
                          <td width="335" height="35"><div align="center">
                                <%out.write(rs.getString("������λ��"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">��������ʽ��</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("��������ʽ"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">��������</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("������"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">������</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("����"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">����ʣ�</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("�����"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">���Ť�أ�</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("���Ť��"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="35" bgcolor="#efefef"><div align="center">���ʽ��</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("���ʽ"));%>
                          </div></td>
                            </tr>
                        <tr>
						  <td height="35" bgcolor="#efefef"><div align="center">�����ͺţ�</div></td>
                          <td height="35"><div align="center">
                                <%out.write(rs.getString("�����ͺ�"));%>
                          </div></td>
                        </tr>
                      </table>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		<%}if(name.equals("��������")){%>
		<table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="��������" cols="80" rows="25" class="area"><%out.write(rs.getString("��������"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("����˵��")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� ˵��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="��������" cols="80" rows="25" class="area"><%out.write(rs.getString("����˵��"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table> 
		  <%}if(name.equals("��׼װ��")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� ׼ װ ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="��������" cols="80" rows="25" class="area"><%out.write(rs.getString("��׼װ��"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("ѡװװ��")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;ѡ װ װ ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">                      <div align="center">
                      <textarea name="��������" cols="80" rows="25" class="area"><%out.write(rs.getString("ѡװװ��"));%>
                      </textarea>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
		  <%}if(name.equals("��������")){%>
		  <table width="574" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
            </tr>
            <tr>
              <td height="15" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle" class="bottm">
                      <table width="500" border="1" align="center" cellpadding="0" cellspacing="0" id="jibenziliao">
                        <tr>
                          <td width="73" height="30" bgcolor="#efefef"><div align="right">����Ʒ�ƣ�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("Ʒ��"));%>
                            </div>
                              <div align="right"></div></td>
                          <td width="75" height="30" bgcolor="#efefef"><div align="right">�����ͺţ�</div></td>
                          <td width="171" height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("�ͺ�"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">������Ⱥ��</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("������Ⱥ"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">�ο��۸�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("�ۼ�"));%>
                    ����Ԫ��</div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">��ɫ��</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("��ɫ"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">��ۣ�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("���"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td height="30" bgcolor="#efefef"><div align="right">���Σ�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                          <td height="30" bgcolor="#efefef"><div align="right">���ã�</div></td>
                          <td height="30" colspan="3"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td valign="middle"><table width="500" height="220" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="133" rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("���ͼƬ")%>" width="110" height="90"></div></td>
                          <td width="128" height="15" class="br"><div align="left">��� </div></td>
                          <td width="119" height="15" class="br"><div align="left">���� </div></td>
                          <td width="120" rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("���"));%>
                          </div></td>
                          <td width="119" height="95" class="br"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                        </tr>
                        <tr>
                          <td rowspan="2" class="br"><div align="center"><img src="Image/<%=rs.getString("����ͼƬ")%>" width="110" height="90"></div></td>
                          <td height="15" class="br"><div align="left">���� </div></td>
                          <td height="15" class="br">
                            <div align="left">��ɫ</div></td>
                          <td rowspan="2" class="bottm"><div align="center"><img src="Image/<%=rs.getString("��ɫͼƬ")%>" width="110" height="90"></div></td>
                        </tr>
                        <tr>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("����"));%>
                          </div></td>
                          <td height="95" class="br"><div align="center">
                              <%out.write(rs.getString("��ɫ"));%>
                          </div></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table>
<%}}else{if(name.equals("��������")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="jibencanshu">
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">��߳��٣�</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("��߳���")%>
              </div></td>
                    </tr>
            <tr>
			  <td width="155" height="35" bgcolor="#efefef"><div align="center">������ʽ��</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("������ʽ")%>
              </div></td>
            </tr>
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">�ƶ����룺</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("�ƶ�����")%>
              </div></td>
                   </tr>
            <tr>
			  <td height="35" bgcolor="#efefef"><div align="center">��Сת��ֱ����</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("��Сת��ֱ��")%>
              </div></td>
            </tr>
            <tr>
                        <td width="155" height="35" bgcolor="#efefef"><div align="center">������¶ȣ�</div></td>
                        <td width="325" height="35"><div align="center">
                          <%=rs.getString("������¶�")%>
                        </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("�ߴ�������")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="waixingcanshu">
            <tr>
              <td width="188" height="30" bgcolor="#efefef"><div align="center">�����ߴ磺</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("���γߴ�")%>
        </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�����ڲ��ߴ磺</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("�����ڲ��ߴ�")%>
        </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��������</div></td>
              <td width="286" height="30"><div align="center">
                <%=rs.getString("������")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">�������أ�</div></td>
              <td width="286" height="30"><div align="center">
                <%=rs.getString("��������")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�غɷ��䣨�գ���</div></td>
              <td height="30">
                  <div align="center">
                    <%=rs.getString("�غɷ��䣨���أ�")%>
                  </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">�غɷ��䣨������</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("�غɷ��䣨���أ�")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�������أ�</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("��������")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">���ܣ�</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("����")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��С��ؼ�϶��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("��С��ؼ�϶��mm��")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">��ࣺ</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("���")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�־ࣺ</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("�־�")%>
              </div></td>
               </tr>
            <tr><td height="30" bgcolor="#efefef"><div align="center">�����ݻ���</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("�����ݻ�")%>
              </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("����������")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� �� ��</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="fadongjicanshu">
            <tr>
              <td width="185" height="30" bgcolor="#efefef"><div align="center">���������ƣ�</div></td>
              <td width="289" height="30">
                <div align="center">
                  <%=rs.getString("����������")%>
                </div></td>
                         </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">������λ�ã�</div></td>
              <td width="289" height="30">
                <div align="center">
                  <%=rs.getString("������λ��")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��������ʽ��</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("��������ʽ")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��������</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("������")%>
                </div></td>
                         </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">������</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("����")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">����ʣ�</div></td>
              <td height="30">
                <div align="center">                  <%=rs.getString("�����")%>
                </div></td>
                          </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">���Ť�أ�</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("���Ť��")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�׾���</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("�׾�/�г�")%>
                </div></td>
                          </tr>
            <tr>
			  <td height="30" bgcolor="#efefef"><div align="center">ѹ���ȣ�</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("ѹ����")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">0-100KM����ʱ�䣺</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("0-100km����ʱ��")%>
                </div></td>
                         </tr>
            <tr> 
			  <td height="30" bgcolor="#efefef"><div align="center">���ʽ��</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("���ʽ")%>
                </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�ٹ����ͺģ�</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("�ٹ����ͺ�")%>
                </div></td>
                         </tr>
            <tr> 
			  <td height="30" bgcolor="#efefef"><div align="center">ȼ�����ࣺ</div></td>
              <td height="30">
                <div align="center">
                  <%=rs.getString("ȼ������")%>
                </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("���̲���")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� ��</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="500" border="1" align="center" cellpadding="0" cellspacing="0" id="dipancanshu">
            <tr>
              <td width="194" height="30" bgcolor="#efefef"><div align="center">��������ʽ��</div></td>
              <td width="300" height="30"><div align="center">
                <%=rs.getString("��������ʽ")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�������ʽ��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("�������ʽ")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�����᣺</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("������")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">������ʽ��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("������ʽ")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">���ܣ�</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("����")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">ǰ�᣺</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("ǰ��")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��̥��������</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("��̥������")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">����ϵͳ��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("����ϵͳ")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��������ϵͳ��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("��������ϵͳ")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">����������</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("��������")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">��̥���ͼ����</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("��̥���ͼ����")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">�ƶ�װ����ʽ��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("�ƶ�װ����ʽ")%>
              </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#efefef"><div align="center">ת������ʽ��</div></td>
              <td height="30"><div align="center">
                <%=rs.getString("ת������ʽ")%>
              </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("�������ʶ��")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm">&nbsp;�� �� �� �� �� ʶ ��</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="187" height="40" bgcolor="#efefef"><div align="center">�����ͺţ�</div></td>
              <td width="293" height="40"><div align="center">
                <%=rs.getString("�����ͺż����")%>
              </div></td>
                 </tr>
            <tr> 
			  <td height="40" bgcolor="#efefef"><div align="center">����ʶ���룺</div></td>
              <td width="293" height="40"><div align="center">
                <%=rs.getString("����ʶ����")%>
              </div></td>
            </tr>
            <tr>
              <td height="40" bgcolor="#efefef"><div align="center">��ѡ��ɫ��</div></td>
              <td height="40" colspan="3"><div align="center">
                <%=rs.getString("��ѡ��ɫ")%>
              </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}if(name.equals("��������")){%>
<table width="574" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" valign="bottom" class="bottm"> &nbsp;�� �� �� ��</td>
  </tr>
  <tr>
    <td height="15" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="401" valign="middle"><table width="560" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="middle" class="bottm"><table width="480" border="1" align="center" cellpadding="0" cellspacing="0" id="jibencanshu">
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">��߳��٣�</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("��߳���")%>
              </div></td>
                    </tr>
            <tr>
			  <td width="155" height="35" bgcolor="#efefef"><div align="center">������ʽ��</div></td>
              <td width="325" height="35"><div align="center">
                <%=rs.getString("������ʽ")%>
              </div></td>
            </tr>
            <tr>
              <td height="35" bgcolor="#efefef"><div align="center">�ƶ����룺</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("�ƶ�����")%>
              </div></td>
                   </tr>
            <tr>
			  <td height="35" bgcolor="#efefef"><div align="center">��Сת��ֱ����</div></td>
              <td height="35"><div align="center">
                <%=rs.getString("��Сת��ֱ��")%>
              </div></td>
            </tr>
            <tr>
                        <td width="155" height="35" bgcolor="#efefef"><div align="center">������¶ȣ�</div></td>
                        <td width="325" height="35"><div align="center">
                          <%=rs.getString("������¶�")%>
                        </div></td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<%}}}%>
		  </td>
      </tr>
    </table>
	<%}}%>
	</td>
  </tr>
</table>
<%@ include file="Bottom.jsp" %>
</body>
</html>
