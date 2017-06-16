public class BitOP  
{  
    public static void main(String args[])  
    {  
        int n = 0b100 & 0b011; // 0b000; => 0 
        int m = 0b100 | 0b011;  // 0b111; => 7
        int i = 0b100 ^ 0b011;  // 0b111; => 7
        System.out.println(n);  
        System.out.println(m);  
        System.out.println(i);  
    }  
}  