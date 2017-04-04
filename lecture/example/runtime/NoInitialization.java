

/*
 * 通过子类引用父类的静态字段, 不会导致子类初始化
 *
 * javac NoInitialization.java
 * java -XX:+TraceClassLoading NoInitialization
 * javap -verbose NoInitialization.class
 */
class SuperClass {
    static {
        System.out.println("SuperClass init !");
    }
    public static int value = 123;
}

class SubClass extends SuperClass {
    static {
        System.out.println("SubClass init !");
    }
}

class ConstClass {
    static {
        System.out.println("ConstClass init !");
    }

    final public static String HELLOWORLD="hello world";
}

public class NoInitialization {
    public static void main(String []args) {
        System.out.println(SubClass.value);
        SuperClass[]sca = new SuperClass[10];
        System.out.println(ConstClass.HELLOWORLD);
    }
}
