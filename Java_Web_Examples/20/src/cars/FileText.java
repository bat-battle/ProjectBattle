package cars;

import java.sql.*;

/**
 * <p>Title: �����������ۼ�����վ</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: ���տƼ����޹�˾</p>
 * @author not attributable
 * @version 1.0
 */

public class FileText {
  String[] city=new String[30];
  String filetext="";
  String sql;
  String rla="";
  String mid="";
  ResultSet rs;
  Bean1 data=new Bean1();

  public FileText() {
    city[0]="�½�";
    city[1]="����";
    city[2]="����";
    city[3]="�Ĵ�";
    city[4]="����";
    city[5]="�㶫";
    city[6]="����";
    city[7]="����";
    city[8]="����";
    city[9]="����";
    city[10]="�㽭";
    city[11]="����";
    city[12]="����";
    city[13]="����";
    city[14]="����";
    city[15]="����";
    city[16]="�ӱ�";
    city[17]="ɽ��";
    city[18]="ɽ��";
    city[19]="����";
    city[20]="����";
    city[21]="����";
    city[22]="�ຣ";
    city[23]="���ɹ�";
    city[24]="����";
    city[25]="����";
    city[26]="����";
    city[27]="���";
    city[28]="����";
    city[29]="������";
  }

  public String getfiletext(String type){
    try{
      filetext="<script language='javascript'>\rfunction area(areas)\r{ var str;switch(areas){\r";
       for(int i=0;i<city.length;i++){
                mid=mid+"case \""+city[i]+"\":\n";
                sql="select * from tb_Enterprise where Address like '%"+city[i]+"%' and Style='"+type+"'";
                        rs=data.getrs(sql);
                        rs.beforeFirst();
                        while(rs!=null&&rs.next()){
                                rla=rla+"<tr height='20'><td align=center class=br><a href='#' onclick=javascript:window.open('Enterprise_Particular.jsp?id="+rs.getInt("ID")+"','','width=380,height=235,toolbar=no,location=no,status=no,menubar=no') style='color:#000000'>"+rs.getString("Name")+"</a></td><td align=center class=bottm>"+rs.getString("Phone")+"</td></tr>";
                        }
                 mid=mid+"str=\"<table align=center width=560><tr height=20><td bgcolor=#efefef align=center class=br>������ҵ����</td>";
                 mid=mid+"<td align=center class=bottm  bgcolor=#efefef>��ϵ�绰</td></tr>"+rla+"<tr><td></td><td></td></tr></table>\"\r";
                 mid=mid+"break;\r";
                 rla="";
               }
        filetext=filetext+mid+"} intro.innerHTML=str;}</script>";
        return filetext;
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }
}