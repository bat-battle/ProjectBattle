package com.hiernate.util;
public class Test {
   public static void main(String args[]){
	   int intmethod;                       //����int�ͱ���
	   for(int i = 0 ;i < 200 ;i++ ){       
		   intmethod  = (int)( (((Math.random())*11))-1);   //�������ǵ��뷨��Math.random()����10��1������֮��ֵ������ 
		   if(intmethod == 10){             //��intmethod�Ƿ��10���ص��ж�
			   System.out.println("ok");     
		   }
		   System.out.print(intmethod+",");  //�ڿ���̨�ϴ�ӡ����������鸳ֵ�Ƿ����
		}
	  }
  }
