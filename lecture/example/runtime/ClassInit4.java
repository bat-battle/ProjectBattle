
class ClassInit4 {

    static int k;
    static {
        i = 2;
        j = k;
        //k = l; //注释后是否可以编译通过, 为什么
    }
    {
        k = l;  //注释后编译是否可以通过, 对结果有什么影响
    }
    static int i;
    static int j = 3;
    static final int l = 4;

    public static void main(String []args) {
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
        System.out.println(l);
        new ClassInit4();
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
        System.out.println(l);
    }
}
