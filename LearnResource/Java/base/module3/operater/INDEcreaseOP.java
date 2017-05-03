public class INDEcreaseOP{
    public static void main(String[] args) {
        int i = 5;
        int j = 5;
        int m = 5;
        int n = 5;
        i++;
        j = j + 1;
        m --;
        n = n - 1;

        System.out.println(i); // i => 6
        System.out.println(i++);  // i => 6 
        System.out.println(++i);  // i => 8
        System.out.println(i--);  // i => 8
        System.out.println();  
  
        System.out.println(j); // j => 6
        System.out.println(j++);  // j => 6
        System.out.println(j--);  // j => 7
        System.out.println(--j);  // j => 5
        System.out.println();  
  
        System.out.println(m);  // m => 4
        System.out.println(n);  // n => 4
    }
}