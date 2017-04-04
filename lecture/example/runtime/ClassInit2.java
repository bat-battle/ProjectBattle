

class ClassInit2 {

    static final int k = 0;
    static {
        i = 2;
    }
    static final int i;
    static final int j = 3;

    public static void main(String []args) {
        System.out.println(ClassInit.k);
        System.out.println(ClassInit.i);
        System.out.println(ClassInit.j);
    }
}
