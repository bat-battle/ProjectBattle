


class SoltTest {
    static void test() {
        byte[]placeholder = new byte[64*1024*1024];
        System.gc();
    }

    static void test1() {
        {
            byte[]placeholder = new byte[64*1024*1024];
        }
        System.gc();
    }

    static void test2() {
        {
            byte[]placeholder = new byte[64*1024*1024];
        }
        int a = 0;
        System.gc();
    }

    public static void main(String[]args) {
        //test();
        //test1();
        test2();
    }
}
