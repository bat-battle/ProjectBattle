package cars;

/**
 * <p>Title: �����������ۼ�����վ</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: ���տƼ����޹�˾</p>
 * @author not attributable
 * @version 1.0
 */

public class PopMenu {
  String tablehead;
  String table;
  String tablebottom;
  String tr="";
  int i=0;
  public PopMenu() {
    tablehead="<table height=100 width=160 border=0>";
    tablebottom="</table>";
  }

  public void add(String st,String str){
    i=i+1;
    tr=tr+"<tr><form name=menu"+i+" method=post action=''><td align=center><input name='type' type='hidden' value='"+str+"'><a href='javascript:menu"+i+".submit()' style='color:#000000;'>"+st+"</a></td></form></tr>";
  }

  public String table(){
    table=tablehead+tr+tablebottom;
    return table;
  }

  public void setnull(){
    i=0;
    tr="";
  }
}