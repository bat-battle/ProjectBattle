package cars;

import javax.servlet.*;
import java.io.*;

/**
 * <p>Title: �����������ۼ�����վ</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: ���տƼ����޹�˾</p>
 * @author not attributable
 * @version 1.0
 */

public class SendGet{

  /*����������,�����洢�û��ϴ��Ķ����������� */
  DataInputStream datas;
   /*�洢REQUEST��������Ŀͻ����ϴ��Ķ�����������*/
  ServletInputStream input;
  /*����ת�����������������ַ�����*/
  byte[] buffer;
  private static String str="\r\n";
  int start,end,size,begin;
  String path;
  String all;
  int counts=0;
  int strs=0;
  int sum;

  public SendGet() {

  }

/*
   *��ȡ�û��ϴ��Ķ�����������
   *����Ϊ������������,�������Ĵ�С
 **/

public void setdata(ServletInputStream inputs,int len){
  try{
  input=inputs;
  begin=0;
  size=len;
  byte[] buf=new byte[size];
  buffer=new byte[size];
  while(strs<size){
  sum = inputs.read(buf);
  for (int i = 0; i < sum; i++) {
  buffer[strs+i] = buf[i];
    }
  strs = strs + sum;
   }

  all=new String(buffer);
  path=all.substring(0,all.indexOf(str));
  int lengths=path.length();
  String repla=all;
  while(repla.indexOf(path,begin)!=-1){
    begin=repla.indexOf(path,begin);
    begin=begin+lengths;
    counts++;
  }
  begin=0;
  counts=counts-1;
  }
  catch(Exception e){
    e.printStackTrace();
  }
}


/*
  *��ȡָ��˳��ı�����
**/

  public String getdatas(int i){
    try{
      if (i > counts) {
        return null;
      }
      else{
        String rel=all;
        for(int j=0;j<i;j++){
           begin=rel.indexOf(path,begin);
           begin=begin+path.length();
        }
        start=rel.indexOf(str+str,begin)+2*str.length();
        end=rel.indexOf(path,begin);
        rel=rel.substring(start,end);
        start=0;
        end=0;
        begin=0;
        return rel;
      }
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return null;
  }

  /*
    *��ȡָ��˳��ı����������
  **/

 public String getformname(int i){
   try{
     if (i > counts) {
     return "wrong";
   }
   else{
     String rel=all;
     for(int j=0;j<i;j++){
        begin=rel.indexOf(path,begin);
        begin=begin+path.length();
     }
     start=rel.indexOf("name",begin)+6;
     end=rel.indexOf(str+str,begin);
     rel=rel.substring(start,end);
     rel=rel.substring(0,rel.indexOf("\""));
     start=0;
     end=0;
     begin=0;
     return rel;
   }
   }
   catch(Exception e){
     e.printStackTrace();
   }
   return null;
 }

public int getcounts(){
   return counts;
 }

 public String getall(){
   return all;
 }


}

