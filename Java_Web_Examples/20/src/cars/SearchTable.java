package cars;

public class SearchTable {
  private String table;

  public SearchTable() {
    table="";
    table=table+"<table width='160' height='120' border='0' cellpadding='0' cellspacing='0'><form name='form1' method='post' action='Search.jsp'>";
    table=table+"<tr><td width='57' height='30'><div align='right'>Ʒ�ƣ�</div></td>";
    table=table+"<td width='103' height='30'><div align='left'><input name='name' type='text' class='wenbenkuang' id='name' size='13'></div>";
    table=table+"</td></tr><tr><td height='30'><div align='right'>�ͺţ�</div></td><td height='30'><div align='left'>";
    table=table+"<input name='number' type='text' class='wenbenkuang' id='number' size='13'></div></td></tr><tr><td height='30'><div align='right'>���ࣺ</div></td>";
    table=table+"<td height='30'><select name='type' class='wenbenkuang' id='type'><option value='1' selected>���ó�</option>";
    table=table+"<option value='3'>���ó�</option></select></td></tr><tr><td height='30' colspan='2'><div align='center'>";
    table=table+"<input name='Submit' type='submit' class='buttons' value='���顡ѯ��'></div></td></tr></form></table>";
  }

  public String getsearch(){
    return table;
  }
}