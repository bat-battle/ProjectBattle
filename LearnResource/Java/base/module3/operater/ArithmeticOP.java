public class ArithmeticOP
{  
    int i = 33;  
    int j = 44;  
  
    char c1 = 'a';  
    char c2 = 'b';  
  
    public static void main(String args[])  
    {  
        ArithmeticOP aop = new ArithmeticOP();  
        int n = aop.i + aop.j;  
        int m = aop.j - aop.i; 
          
        int c = aop.c1 + aop.c2;  
        int d = aop.c2 - aop.c1;  
  
        int h = aop.i * aop.j;  
        int k = aop.j / aop.i;  
        int y = aop.j % aop.i;  
  
        System.out.println("n = " + n); // 77 
        System.out.println("m = " + m);  //11
        System.out.println("c = " + c);   //195
        System.out.println("d = " + d);  // 1
        System.out.println();  
  
        System.out.println("h = " + h); // 1452  
        System.out.println("k = " + k);  // 1
        System.out.println("y = " + y);  // 11 
    }  
}  
