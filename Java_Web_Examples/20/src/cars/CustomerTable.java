package cars;

public class CustomerTable {
  String table;

  public CustomerTable() {
    table="";
    table=table+"<table width=580 height=566 border=1 cellpadding=0 cellspacing=0><tr bgcolor=#FFCC99>";
        table=table+"<td height=20>&nbsp;<a href=SpeakFor.jsp style='color:#000000' >�ͷ�����</a> --&gt;&gt; �ͷ�����</td>";
      table=table+"</tr><tr><td height=180 valign=top style=padding:10px;>" +
      		"������0431-8497****<br><br>���֣�0432-769****<br><br>��ƽ��0434-559****</td></tr> </table>";
  }

  public String gettable(){
    return table;
  }
}