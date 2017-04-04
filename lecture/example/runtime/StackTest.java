
class StackTest {

    class Test {
        private int i = 0;

        public int getValue() {
            return i;
        }

        public void setValue(int i) {
            this.i = i;
        }

    }
    void test(Test t) {
        t.setValue(1);
        System.out.println(t.getValue());
    }

    void test1() {
        Test t = new Test();
    }

    public static void main(String []args) {
        new StackTest().test1();
    }
}
