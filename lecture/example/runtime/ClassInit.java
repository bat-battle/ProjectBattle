
class ClassInit {

    static int k = 0;
    static {
        i = 2;
        //j = i; //注释后发生什么
        j = k;
        //System.out.println(i); //注释后发生什么
        //System.out.println(j); //注释后发生什么
        System.out.println(k); //注释后发生什么
    }
    static int i;
    static int j = 3;
    static int l = 4;

    public static void main(String []args) {
    }
}
