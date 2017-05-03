class RealationOP {
    public static void main(String[] args) {
        int i = 4;
        int j = 4;
        boolean b1 = i == j;
        boolean b2 = i != j;
        boolean b5 = i > j;
        boolean b6 = i < j;
        boolean b7 = i >= j;
        boolean b8 = i <= j;
        String s1 = new String("你好");
        String s2 = new String("你好");
        boolean b3 = (s1 == s2);
        boolean b4 = (s1 != s2); 

        
        System.out.println(b1);
        System.out.println(b2);


        MyString mstr1 = new MyString("你好");
        MyString mstr2 = new MyString("你好");
        
        System.out.println("mstr1 =" + mstr1);
        System.out.println("mstr2 =" + mstr2);

        System.out.println("s1 =" + s1);
        System.out.println("s2 =" + s2);
        System.out.println("b3 = " + b3); // true 
        System.out.println("b4 = " + b4); // false
        System.out.println();
        System.out.println(b5);
        System.out.println(b6);
        System.out.println(b7);
        System.out.println(b8);
        System.out.println();
    }
}
class MyString{
    MyString(String str){
        System.out.println("MyString init");
    }

}