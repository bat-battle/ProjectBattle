public class InnerClass {

    private String name = "outer Class";

    int age = 20;

    public class Inner {
        String name = "inner Class";

        public void show() {
            System.out.println("外部类中的name：" + InnerClass.this.name);
            System.out.println("内部类中的name：" + this.name);
            System.out.println("外部类中的age：" + age);
        }
    }

    public static void main(String[] args) {

        HelloWorld o = new HelloWorld();

        Inner inn = new o.Inner();

        inn.show();
    }
}